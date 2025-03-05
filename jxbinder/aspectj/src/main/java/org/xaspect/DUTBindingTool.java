package org.xaspect;

import com.squareup.javapoet.ClassName;
import com.squareup.javapoet.ParameterizedTypeName;
import org.xaspect.datas.*;

import javax.annotation.processing.ProcessingEnvironment;
import javax.lang.model.element.*;
import javax.lang.model.type.ArrayType;
import javax.lang.model.type.DeclaredType;
import javax.lang.model.type.TypeKind;
import javax.lang.model.type.TypeMirror;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class DUTBindingTool {

    private static List<String> watchpointsStmts = new ArrayList<>();

    static List<String> getWatchpointsStmts() {
        return watchpointsStmts;
    }

    static String WATCHPOINT_MAP_NAME = "watchpointMap";

    static ProcessingEnvironment processingEnv;

    static ParameterizedTypeName getWatchPointTypeName(){
        return ParameterizedTypeName.get(
                ClassName.get(Map.class),
                ClassName.get(String.class),
                ClassName.get(Integer.class)
        );
    }

    static List<String> constructGetMethod(ExecutableElement method, String prefix, String instanceFieldName, String outerName){
        String outputPrefix = prefix;
        List<String> ret = new ArrayList<>();

        IOParameters ios = new IOParameters();
        ios.isIn = false;
        Annotation outerPinAnnotation =  getAnnotationFromType(method.getReturnType(), Pin.class);
        Annotation outerBundleAnnotation =  getAnnotationFromType(method.getReturnType(), OutBundle.class);
        if (outerBundleAnnotation != null) {
            OutBundle outerBundle = (OutBundle) outerBundleAnnotation;
            outputPrefix += outerBundle.value();
            ios.coveringUnsigned = outerBundle.coveringUnsigned();
            ios.unsigned = outerBundle.unsigned();
        } else if (outerPinAnnotation != null){
            outputPrefix += ((Pin) outerPinAnnotation).value();
        }
        ios.isPin = outerPinAnnotation != null;

        Class<?> returnTypeCls = getClassFromTypeMirror(method.getReturnType());
        String typeName = returnTypeCls.getTypeName();
        String initializr = typeName + " " + outerName ;
        if (!ios.isPin) {
            initializr += " = new " + typeName + "()";
        }
        initializr += ";\n";
        ret.add(initializr);

        // 将 TypeMirror 转换为 TypeElement

        List<String> outputAssigns = constructIO(outputPrefix, method, instanceFieldName, outerName, ios);
        ret.addAll(outputAssigns);

//        Annotation outerWatchPoint = getAnnotationFromType(method.getReturnType(), WatchPoint.class);

        return ret;
    }

    static List<String> constructOneParamBinding(String prefix, VariableElement param, String inputBundleName, String instanceFieldName) {
        IOParameters ios = new IOParameters();
        ios.isIn = true;
        String inputPrefix = prefix;
        Annotation innerPinAnnotation = getAnnotationFromType(param.asType(), Pin.class);

        ios.isPin = innerPinAnnotation != null;
        Annotation innerBundleAnnotation = getAnnotationFromType(param.asType(), InBundle.class);
        //更新前缀和unsigned设置
        if (innerBundleAnnotation != null) {
            InBundle inBundle = (InBundle) innerBundleAnnotation;
            inputPrefix += inBundle.value();
            ios.coveringUnsigned = inBundle.coveringUnsigned();
            ios.unsigned = inBundle.unsigned();
        } else if (innerPinAnnotation != null) {
            Pin pinAnnotation = (Pin) innerPinAnnotation;
            if (pinAnnotation.value().isEmpty()){
                inputPrefix += param.getSimpleName().toString();
            } else {
                inputPrefix += pinAnnotation.value();
            }
            ios.unsigned = pinAnnotation.unsigned();
        }

        return constructIO(inputPrefix, param, instanceFieldName, inputBundleName, ios);
    }


    private static List<String> constructIO(String pre, Element element, String insName, String IOName, IOParameters ioParameters) {
        String prefix = pre;
        Class<?> dataClass;
        String trueInsPin = "this." + insName + "." + prefix;
        List<String> laterChecks = new ArrayList<>();
        if (element.getKind() == ElementKind.METHOD){
            dataClass = getClassFromTypeMirror(((ExecutableElement)element).getReturnType());
            Annotation wp = getAnnotationFromType(((ExecutableElement) element).getReturnType(), WatchPoint.class);
            if (wp != null){
//                WatchPoint watchPoint = (WatchPoint) wp;
                laterChecks = checkWatchPoints(IOName, ((WatchPoint) wp).conditionClassNames(), ((WatchPoint) wp).conditionMethodNames(), ((WatchPoint) wp).conditionNames());
            }
        } else{
            dataClass = getClassFromTypeMirror(element.asType());
        }
        // 处理 Bundle 注解
        if (dataClass.getAnnotation(Bundle.class) != null) {
            prefix += dataClass.getAnnotation(Bundle.class).value();
        }

        List<String> rets = new ArrayList<>();
        String fieldPrefix = IOName;

        if (ioParameters.isPin) {
            rets.add(constructSingleAssignment(fieldPrefix, dataClass, trueInsPin, ioParameters.isIn, ioParameters.unsigned));
        } else {
            // 如果元素是类或接口，获取其字段
            if (element.getKind() == ElementKind.CLASS || element.getKind() == ElementKind.INTERFACE) {
                TypeElement typeElement = (TypeElement) element;
                for (Element enclosedElement : typeElement.getEnclosedElements()) {
                    if (enclosedElement.getKind() == ElementKind.FIELD) {
                        VariableElement field = (VariableElement) enclosedElement;
                        processField(field, prefix, insName, fieldPrefix, ioParameters, rets);
                    }
                }
            }
        }
        rets.addAll(laterChecks);
        return rets;
    }


    private static void processField(VariableElement field, String prefix, String insName, String fieldPrefix, IOParameters ioParameters, List<String> rets) {
        if (field.getAnnotation(Pin.class) != null) {
            String varName = field.getSimpleName().toString();
            Pin pinAnnotation = field.getAnnotation(Pin.class);
            String pinName = pinAnnotation.value();
            boolean unsignedPin = pinAnnotation.unsigned();

            if (ioParameters.coveringUnsigned) {
                unsignedPin = ioParameters.unsigned;
            }

            if (pinName.isEmpty()) {
                pinName = varName;
            }

            String dataWrapperVar = fieldPrefix + "." + varName;
            String trueInsPin = prefix + pinName;
            IOParameters subIOS = ioParameters.copy();
            subIOS.isSon = true;
            subIOS.isPin = true;
            subIOS.unsigned = unsignedPin;
            rets.addAll(constructIO(trueInsPin, field, insName, dataWrapperVar, subIOS));
        } else if (field.getAnnotation(SubBundle.class) != null) {
            String subFieldName = fieldPrefix + "." + field.getSimpleName().toString();
            IOParameters subIOS = ioParameters.copy();
            subIOS.isSon = true;
            String pinPrefix = prefix + field.getAnnotation(SubBundle.class).value();
            System.err.println("pin prefix" + pinPrefix);
            List<String> subreses = constructIO(pinPrefix, field, insName, subFieldName, subIOS);
            rets.addAll(subreses);
        } else if (field.getAnnotation(ListPins.class) != null) {
            // 处理 ListPins 注解
        }
    }

    private static List<String> checkWatchPoints(String watchedVarName, String[] conditionClasses, String[] conditionMethods, String[] names){
        List<String> rets = new ArrayList<>();
        if (conditionClasses.length == 0){
            return rets;
        }
        if (conditionClasses.length != names.length || conditionMethods.length != names.length){
            throw new IllegalArgumentException("Number of conditions does not match number of ids");
        }
        for (int i = 0; i < conditionClasses.length; i++){
            String checkStmt = WATCHPOINT_MAP_NAME + ".put(\""+  names[i] +"\", "+  WATCHPOINT_MAP_NAME + ".getOrDefault(\"" + names[i] + "\", 0) + ("
                    + conditionClasses[i] +"." + conditionMethods[i] + "(" + watchedVarName+") ? 1 : 0));\n";
//            watchpointsStmts.add(checkStmt);
            rets.add(checkStmt);
//            System.err.println(checkStmt);
        }
        return rets;
    }

    private static String getBasicTypeValStr(Class<?> fieldType){
        if (isInteger(fieldType)){
            return ".intValue()";

        } else if (isLong(fieldType)){
            return ".longValue()";

        } else if (isByteArray(fieldType)){
            return ".GetBytes()";
        } else if (fieldType.getCanonicalName().equals(String.class.getCanonicalName())){
            return ".String()";
        } else if (fieldType.getCanonicalName().equals(BigInteger.class.getCanonicalName())){
            return "";
        }

        return "";
    }

    static String constructSingleAssignment(String fieldFullName, Class<?> fieldType, String pinFullName, boolean isIn, boolean unsigned){
//        if (isInteger(fieldType)){
//            if (isIn){
//                return pinFullName + ".Set(" + fieldFullName + ");\n";
//
//            } else {
//
//                String signedGet = unsigned? "U()": "S()";
//                String getIntString = signedGet + ".intValue()";
//                return fieldFullName + " = " + pinFullName + "." + getIntString + ";\n";
//            }
//        } else if (isLong(fieldType)){
//            if (isIn){
//                return pinFullName + ".Set(" + fieldFullName + ");\n";
//            } else {
//                String signedGet = unsigned? "U()": "S()";
//                String getLongString = signedGet + ".longValue()";
//                return fieldFullName + " = " + pinFullName + "." + getLongString + ";\n";
//            }
//        } else if (isByteArray(fieldType)){
//            if (isIn){
//                return pinFullName + ".Set(" + fieldFullName + ");\n";
//            } else {
//                return fieldFullName + " = " + pinFullName + ".GetBytes();\n";
//            }
//        } else if (fieldType.getCanonicalName().equals(String.class.getCanonicalName())){
//            if (isIn){
//                return pinFullName + ".Set(" + fieldFullName + ");\n";
//            } else {
//                return fieldFullName + " = " + pinFullName + ".String();\n";
//            }
//        } else if (fieldType.getCanonicalName().equals(BigInteger.class.getCanonicalName())){
        if (isIn){
            return pinFullName + ".Set(" + fieldFullName + ");\n";
        } else {
            String signedGet = unsigned? "U()": "S()";
            return fieldFullName + " = " + pinFullName + "." + signedGet  + getBasicTypeValStr(fieldType) + ";\n";
        }

//        }


//        return "";
    }

    private static boolean isInteger(Class<?> fieldType){
        String typeName = fieldType.getName();
        if (fieldType.isPrimitive()){
            return typeName.equals("int");
        }
        return typeName.equals("java.lang.Integer");
    }

    private static boolean isLong(Class<?> fieldType){
        String typeName = fieldType.getName();
        if (fieldType.isPrimitive()){
            return typeName.equals("long");
        }
        return typeName.equals("java.lang.Long");
    }

    private static boolean isByteArray(Class<?> fieldType){
        if (!fieldType.isArray()){
            return false;
        }

        return fieldType.getComponentType() == byte.class;
    }


    static Annotation getAnnotationFromType(TypeMirror type, Class<?> annotationClass) {
        // 检查类型上的注解
        for (AnnotationMirror annotationMirror : type.getAnnotationMirrors()) {
            DeclaredType annotationType = annotationMirror.getAnnotationType();
            Element annotationElement = annotationType.asElement();
            if (annotationElement.toString().equals(annotationClass.getCanonicalName())) {
                return type.getAnnotation((Class<? extends Annotation>) annotationClass); // 找到了目标注解，返回注解对象
            }
        }

        // 如果是数组类型，递归检查组件类型
        if (type.getKind() == TypeKind.ARRAY) {
            ArrayType arrayType = (ArrayType) type;
            return getAnnotationFromType(arrayType.getComponentType(), annotationClass);
        }

        return null; // 没有找到目标注解
    }

    static Class<?> getClassFromTypeMirror(TypeMirror typeMirror) {
        try {

            // 将 TypeMirror 转为 Class
            if (typeMirror.getKind() == TypeKind.DECLARED) {
                DeclaredType declaredType = (DeclaredType) typeMirror;
                TypeElement typeElement = (TypeElement) declaredType.asElement();
                String className = typeElement.getQualifiedName().toString();
                return Class.forName(className);
            } else if (typeMirror.getKind().isPrimitive()) {
                // 处理原始类型
                return getPrimitiveClass(typeMirror.getKind());
            } else if (typeMirror.getKind() == TypeKind.ARRAY) {
                // 处理数组类型
                ArrayType arrayType = (ArrayType) typeMirror;
                TypeMirror componentType = arrayType.getComponentType();
                Class<?> componentClass = getClassFromTypeMirror(componentType);
//                System.out.println(componentClass.getTypeName());
                return java.lang.reflect.Array.newInstance(componentClass, 0).getClass();
            } else {
                throw new IllegalArgumentException("Unsupported type: " + typeMirror);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to get Class<?> from VariableElement", e);
        }
    }

    private static Class<?> getPrimitiveClass(TypeKind kind) {
        switch (kind) {
            case BOOLEAN:
                return boolean.class;
            case BYTE:
                return byte.class;
            case SHORT:
                return short.class;
            case INT:
                return int.class;
            case LONG:
                return long.class;
            case CHAR:
                return char.class;
            case FLOAT:
                return float.class;
            case DOUBLE:
                return double.class;
            default:
                throw new IllegalArgumentException("Unsupported primitive type: " + kind);
        }
    }



}
