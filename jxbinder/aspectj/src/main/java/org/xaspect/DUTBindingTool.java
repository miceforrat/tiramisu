package org.xaspect;

import org.xaspect.datas.Bundle;
import org.xaspect.datas.ListPins;
import org.xaspect.datas.Pin;
import org.xaspect.datas.SubBundle;

import javax.lang.model.element.AnnotationMirror;
import javax.lang.model.element.Element;
import javax.lang.model.element.TypeElement;
import javax.lang.model.type.ArrayType;
import javax.lang.model.type.DeclaredType;
import javax.lang.model.type.TypeKind;
import javax.lang.model.type.TypeMirror;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

class DUTBindingTool {

    static List<String> constructIO(String pre, Class<?> dataClass, String insName, String IOName, IOParameters ioParameters) {
        String prefix = pre;
        //bundle类内生的prefix处理
        if (dataClass.isAnnotationPresent(Bundle.class)){
            prefix += dataClass.getAnnotation(Bundle.class).value();
        }

        List<String> rets = new ArrayList<>();
        String typeName = dataClass.getTypeName();
        String fieldPrefix;
        fieldPrefix = IOName;


        if (ioParameters.isPin) {
            String trueInsPin = "this." + insName + "." + prefix;
//            System.err.println("trueInsPin " + trueInsPin);
//            System.err.println("prefix " + prefix);
            String dataWrapperVar = fieldPrefix;
            rets.add(constructSingleAssignment(dataWrapperVar, dataClass, trueInsPin, ioParameters.isIn, ioParameters.unsigned));
        } else {
            for (Field pin : dataClass.getDeclaredFields()) {
                if (pin.isAnnotationPresent(Pin.class)) {
                    String varName = pin.getName();
                    String pinName = pin.getAnnotation(Pin.class).value();
                    boolean unsignedPin = pin.getAnnotation(Pin.class).unsigned();
                    if (ioParameters.coveringUnsigned){
                        unsignedPin = ioParameters.unsigned;
                    }
                    if (pinName.isEmpty()) {
                        pinName = varName;
                    }

//                    String trueInsPin = "this." + insName + "." + prefix + pinName;
                    String dataWrapperVar = fieldPrefix + "." + varName;
                    String trueInsPin = prefix + pinName;
                    IOParameters subIOS = ioParameters.copy();
                    subIOS.isSon = true;
                    subIOS.isPin = true;
                    subIOS.unsigned = unsignedPin;
                    rets.addAll(constructIO(trueInsPin, pin.getType(), insName, dataWrapperVar, subIOS));
//                    rets.add(constructSingleAssignment(dataWrapperVar, pin.getType(), trueInsPin, ioParameters.isIn, unsignedPin));
                } else if (pin.isAnnotationPresent(SubBundle.class)) {
                    String subFieldName = fieldPrefix + "." + pin.getName();
                    IOParameters subIOS = ioParameters.copy();
                    subIOS.isSon = true;
                    String pinPrefix = prefix + pin.getAnnotation(SubBundle.class).value();
                    System.err.println("pin prefix" + pinPrefix);
                    List<String> subreses = constructIO(pinPrefix, pin.getType(), insName, subFieldName, subIOS);
                    rets.addAll(subreses);
                } else if (pin.isAnnotationPresent(ListPins.class)){

                }
            }
        }
        
        return rets;
    }

    static String constructSingleAssignment(String fieldFullName, Class<?> fieldType, String pinFullName, boolean isIn, boolean unsigned){
        if (isInteger(fieldType)){
            if (isIn){
                return pinFullName + ".Set(" + fieldFullName + ");\n";

            } else {

                String signedGet = unsigned? "U()": "S()";
                String getIntString = signedGet + ".intValue()";
                return fieldFullName + " = " + pinFullName + "." + getIntString + ";\n";
            }
        } else if (isLong(fieldType)){
            if (isIn){
                return pinFullName + ".Set(" + fieldFullName + ");\n";
            } else {
                String signedGet = unsigned? "U()": "S()";
                String getLongString = signedGet + ".longValue()";
                return fieldFullName + " = " + pinFullName + "." + getLongString + ";\n";
            }
        } else if (isByteArray(fieldType)){
            if (isIn){
                return pinFullName + ".Set(" + fieldFullName + ");\n";
            } else {
                return fieldFullName + " = " + pinFullName + ".GetBytes();\n";
            }
        } else if (fieldType.getCanonicalName().equals(String.class.getCanonicalName())){
            if (isIn){
                return pinFullName + ".Set(" + fieldFullName + ");\n";
            } else {
                return fieldFullName + " = " + pinFullName + ".String();\n";
            }
        } else if (fieldType.getCanonicalName().equals(BigInteger.class.getCanonicalName())){
            if (isIn){
                return pinFullName + ".Set(" + fieldFullName + ");\n";
            } else {
                String signedGet = unsigned? "U()": "S()";
                return fieldFullName + " = " + pinFullName + "." + signedGet  + ";\n";
            }

        }

        return "";
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
