package org.xaspect;

import com.squareup.javapoet.ClassName;
import com.squareup.javapoet.TypeName;
import org.xaspect.datas.*;

import javax.annotation.processing.ProcessingEnvironment;
import javax.lang.model.element.*;
import javax.lang.model.type.ArrayType;
import javax.lang.model.type.DeclaredType;
import javax.lang.model.type.TypeKind;
import javax.lang.model.type.TypeMirror;
import javax.lang.model.util.Elements;
import javax.lang.model.util.Types;
import java.lang.annotation.Annotation;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

class DUTBindingTool {

    static ProcessingEnvironment processingEnv;

    static List<String> constructGetMethod(ExecutableElement method, String prefix, InstanceDUTTypeInfo instanceFieldType, String outerName){
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

        Class<?> returnTypeCls = TypeParserHelper.getInstance().getClassFromTypeMirror(method.getReturnType());
        String typeName = returnTypeCls.getTypeName();
        String initializr = typeName + " " + outerName ;
        if (!ios.isPin) {
            initializr += " = new " + typeName + "()";
        }
        initializr += ";\n";
        ret.add(initializr);

        // 将 TypeMirror 转换为 TypeElement

        List<String> outputAssigns = constructIO(outputPrefix, method, instanceFieldType, outerName, ios);
        ret.addAll(outputAssigns);

//        Annotation outerWatchPoint = getAnnotationFromType(method.getReturnType(), WatchPoint.class);

        return ret;
    }

    static List<String> constructOneParamBinding(String prefix, VariableElement param, String inputBundleName, InstanceDUTTypeInfo instanceField) {
        IOParameters ios = new IOParameters();
        System.err.println("printing...");

        for (String name: instanceField.getFieldNames()){
            System.err.println(name);
        }
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

        return constructIO(inputPrefix, param, instanceField, inputBundleName, ios);
    }


    private static List<String> constructIO(String pre, Element element, InstanceDUTTypeInfo insInfo, String IOName, IOParameters ioParameters) {
        String prefix = pre;
        TypeElement dataTypeElement;
        Class<?> dataClass;
//        String trueInsPin = "this." + insName + "." + prefix;
        if (element.getKind() == ElementKind.METHOD) {

            dataTypeElement = (TypeElement) processingEnv.getTypeUtils().asElement(((ExecutableElement) element).getReturnType());
            dataClass = TypeParserHelper.getInstance().getClassFromTypeMirror(((ExecutableElement) element).getReturnType());
        } else {
            dataTypeElement = (TypeElement) processingEnv.getTypeUtils().asElement((element).asType());
            dataClass = TypeParserHelper.getInstance().getClassFromTypeMirror(element.asType());

        }
//        TypeMirror dataClass;
//        if (element.getKind() == ElementKind.METHOD) {
//            dataTypeElement = (TypeElement) processingEnv.getTypeUtils().asElement(((ExecutableElement) element).getReturnType());
//
//            dataClass = ((ExecutableElement) element).getReturnType();
//        } else {
//            dataTypeElement = (TypeElement) processingEnv.getTypeUtils().asElement((element).asType());
//            dataClass = element.asType();
//        }
//        System.err.println("deal with bundle annotation");
        // 处理 Bundle 注解
        if (dataTypeElement != null) {
            Bundle bundleAnnotation = dataTypeElement.getAnnotation(Bundle.class);
            if (bundleAnnotation != null) {
                prefix += bundleAnnotation.value();
            }
        }

        List<String> rets = new ArrayList<>();
        String fieldPrefix = IOName;
//        System.err.println("is pin?" + ioParameters.isPin);

        if (ioParameters.isPin) {
            rets.add(constructSingleAssignment(fieldPrefix, dataClass, prefix, ioParameters.isIn, ioParameters.unsigned, insInfo));
        } else {
            // 如果元素是类或接口，获取其字段

            System.err.println("entering class");
            Map<String, VariableElement> allVars = TypeParserHelper.getInstance().collectAllFields(dataTypeElement);
            for (VariableElement enclosedElement : allVars.values()) {
                VariableElement field = enclosedElement;
                processField(field, prefix, insInfo, fieldPrefix, ioParameters, rets);
            }
        }
        return rets;
    }


//    private static List<String> constructIO(String pre, Element element, InstanceDUTTypeInfo insInfo, String IOName, IOParameters ioParameters) {
//        String prefix = pre;
//        TypeMirror dataTypeMirror;
//        boolean isByteArray = false;
//        TypeElement dataTypeElement = null;
//        List<String> laterChecks = new ArrayList<>();
//
//        // 根据 element 类型获得 TypeMirror（可能是方法返回值或参数类型）
//        if (element.getKind() == ElementKind.METHOD) {
//            ExecutableElement methodElement = (ExecutableElement) element;
//            dataTypeMirror = methodElement.getReturnType();
//            Annotation wp = getAnnotationFromType(dataTypeMirror, WatchPoint.class);
//            if (wp != null) {
//                laterChecks = checkWatchPoints(IOName, ((WatchPoint) wp).conditionClassNames(),
//                        ((WatchPoint) wp).conditionMethodNames(), ((WatchPoint) wp).conditionNames());
//            }
//        } else if (element.getKind() == ElementKind.PARAMETER) {
//            dataTypeMirror = ((VariableElement) element).asType();
//        } else {
//            throw new RuntimeException("illegal inputs!");
//        }
//
//        // 检查是否为数组类型，且组件类型为 byte（即 byte[]）
//        if (dataTypeMirror.getKind() == TypeKind.ARRAY) {
//            ArrayType arrayType = (ArrayType) dataTypeMirror;
//            if (arrayType.getComponentType().getKind() == TypeKind.BYTE) {
//                isByteArray = true;
//            } else {
//                // 其他数组类型可根据需要处理
//                dataTypeElement = (TypeElement) processingEnv.getTypeUtils().asElement(dataTypeMirror);
//            }
//        } else {
//            // 非数组类型直接转换为 TypeElement
//            dataTypeElement = (TypeElement) processingEnv.getTypeUtils().asElement(dataTypeMirror);
//        }
//
//        // 如果不是 byte[]，处理 Bundle 注解
//        if (!isByteArray && dataTypeElement != null) {
//            Bundle bundleAnnotation = dataTypeElement.getAnnotation(Bundle.class);
//            if (bundleAnnotation != null) {
//                prefix += bundleAnnotation.value();
//            }
//        }
//
//        List<String> rets = new ArrayList<>();
//        String fieldPrefix = IOName;
//        System.err.println("is pin? " + ioParameters.isPin);
//
//        if (ioParameters.isPin) {
//            // 对于 pin 模式，根据是否为 byte[] 分情况处理
//            if (isByteArray) {
//                // 这里直接传入 "byte[]" 字符串，你也可以根据需要特殊处理
//                rets.add(constructSingleAssignment(fieldPrefix, "byte[]", prefix, ioParameters.isIn, ioParameters.unsigned, insInfo));
//            } else {
//                rets.add(constructSingleAssignment(fieldPrefix, dataTypeElement.getQualifiedName().toString(), prefix, ioParameters.isIn, ioParameters.unsigned, insInfo));
//            }
//        } else {
//            // 非 pin 模式下，如果不是 byte[]，处理类中的字段
//            if (!isByteArray) {
//                System.err.println("entering class");
//                for (Element enclosedElement : dataTypeElement.getEnclosedElements()) {
//                    if (enclosedElement.getKind() == ElementKind.FIELD) {
//                        VariableElement field = (VariableElement) enclosedElement;
//                        processField(field, prefix, insInfo, fieldPrefix, ioParameters, rets);
//                        System.err.println("processed field: " + field.getSimpleName() + " -> results: " + rets);
//                    }
//                }
//            } else {
//                // 对于 byte[] 类型，通常不存在字段可处理
//                System.err.println("byte[] 类型不具备可遍历的字段。");
//            }
//        }
//
//        rets.addAll(laterChecks);
//        return rets;
//    }
//

    private static void processField(VariableElement field, String prefix, InstanceDUTTypeInfo insInfo, String fieldPrefix, IOParameters ioParameters, List<String> rets) {
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
            rets.addAll(constructIO(trueInsPin, field, insInfo, dataWrapperVar, subIOS));
        } else if (field.getAnnotation(SubBundle.class) != null) {
            String subFieldName = fieldPrefix + "." + field.getSimpleName().toString();
            IOParameters subIOS = ioParameters.copy();
            subIOS.isSon = true;
            String pinPrefix = prefix + field.getAnnotation(SubBundle.class).value();
            List<String> subreses = constructIO(pinPrefix, field, insInfo, subFieldName, subIOS);
            rets.addAll(subreses);
        } else if (field.getAnnotation(ListPins.class) != null) {
            // 处理 ListPins 注解
        }
    }
    private static boolean isInteger(TypeMirror typeMirror) {
        if (typeMirror.getKind() == TypeKind.INT) {
            return true;
        }
        return typeMirror.toString().equals("java.lang.Integer");
    }
    private static boolean isLong(TypeMirror typeMirror) {
        if (typeMirror.getKind() == TypeKind.LONG) {
            return true;
        }
        return typeMirror.toString().equals("java.lang.Long");
    }

    private static String getBasicTypeValStr(TypeMirror typeMirror) {
        if (isInteger(typeMirror)) {
            return ".intValue()";
        } else if (isLong(typeMirror)) {
            return ".longValue()";
        } else if (isByteArray(typeMirror)) {
            return ".GetBytes()";
        } else if (typeMirror.toString().equals("java.lang.String")) {
            return ".String()";
        } else if (typeMirror.toString().equals("java.math.BigInteger")) {
            return "";
        }

        return "";
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

    static String constructSingleAssignment(String fieldFullName, TypeMirror fieldType, String pinName, boolean isIn, boolean unsigned, InstanceDUTTypeInfo insInfo) {
        String pinFullName = insInfo.getInstanceName() + "." + pinName;

        if (isIn){
            return pinFullName + ".Set(" + fieldFullName + ");\n";
        } else {
            String signedGet = unsigned? "U()": "S()";
            return fieldFullName + " = " + pinFullName + "." + signedGet  + getBasicTypeValStr(fieldType) + ";\n";
        }
    }

    static String constructSingleAssignment(String fieldFullName, Class<?> fieldType, String pinName, boolean isIn, boolean unsigned, InstanceDUTTypeInfo insInfo) {
        String pinFullName = insInfo.getInstanceName() + "." + pinName;

        if (isIn){
            return pinFullName + ".Set(" + fieldFullName + ");\n";
        } else {
            String signedGet = unsigned? "U()": "S()";
            return fieldFullName + " = " + pinFullName + "." + signedGet  + getBasicTypeValStr(fieldType) + ";\n";
        }
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

    private static boolean isByteArray(TypeMirror typeMirror) {
        if (typeMirror.getKind() != TypeKind.ARRAY) {
            return false;
        }

        ArrayType arrayType = (ArrayType) typeMirror;
        TypeMirror componentType = arrayType.getComponentType();
        return componentType.getKind() == TypeKind.BYTE;
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




    static TypeMirror getInheritingType(TypeElement fieldType, Class<?> inheritingClass) {
        Types typeUtils = processingEnv.getTypeUtils();
        Elements elementUtils = processingEnv.getElementUtils();

        // 获取 DUTWrapper 的类型
        TypeElement dutWrapperElement = elementUtils.getTypeElement(inheritingClass.getCanonicalName()); // 替换为 DUTWrapper 的全限定名
        if (dutWrapperElement == null) {
            throw new IllegalStateException("DUTWrapper not found in the classpath");
        }
        DeclaredType dutWrapperType = (DeclaredType) dutWrapperElement.asType();

        // 检查接口是否直接继承 DUTWrapper
        for (TypeMirror superInterface : fieldType.getInterfaces()) {
            if (typeUtils.isAssignable(typeUtils.erasure(superInterface), typeUtils.erasure(dutWrapperType))) {
                // 检查泛型信息
                if (superInterface instanceof DeclaredType) {
                    DeclaredType declaredType = (DeclaredType) superInterface;
                    if (declaredType.getTypeArguments().size() == 1) {
                        // 添加更多泛型验证逻辑（如果需要）
                        return declaredType.getTypeArguments().get(0);
                    } else {
                        throw new IllegalStateException("DUTDao interface must have exactly one type argument");
                    }
                }
            }
        }
        throw new IllegalStateException("not extends from DUTDao");
    }



}
