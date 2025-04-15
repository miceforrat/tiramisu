package org.xaspect;

import com.squareup.javapoet.ClassName;
import com.squareup.javapoet.TypeName;
import com.sun.source.tree.AnnotatedTypeTree;
import com.sun.source.tree.AnnotationTree;
import com.sun.source.tree.MethodTree;
import com.sun.source.tree.Tree;
import com.sun.source.util.TreePath;
import com.sun.source.util.Trees;

import javax.annotation.Nullable;
import javax.annotation.processing.ProcessingEnvironment;
import javax.lang.model.element.*;
import javax.lang.model.type.ArrayType;
import javax.lang.model.type.DeclaredType;
import javax.lang.model.type.TypeKind;
import javax.lang.model.type.TypeMirror;
import javax.lang.model.util.Elements;
import javax.lang.model.util.Types;
import java.util.*;

public class TypeParserHelper {

    private static TypeParserHelper instance;
    private static boolean visited = false;
    static ProcessingEnvironment processingEnv;

    static TypeParserHelper getInstance() {
        if (!visited) {
            instance = new TypeParserHelper();
        }
        return instance;
    }

    public static @Nullable AnnotationMirror getAnnotation(Element element, Class<?> annotationClass) {
        // 先从 Element 上找（标准 APT 兼容）
//        System.err.println(element.getAnnotationMirrors().size());
        for (AnnotationMirror annotationMirror : element.getAnnotationMirrors()) {

            if (annotationMirror.getAnnotationType().toString().equals(annotationClass.getCanonicalName())) {
                return annotationMirror;
            }
        }

        // 如果没找到，再尝试从 type（ECJ 兼容场景）
        // 注意：这部分在 javac 下基本没用
//        if (type instanceof DeclaredType) {
//            Element typeElement = ((DeclaredType) type).asElement();
//            for (AnnotationMirror annotationMirror : typeElement.getAnnotationMirrors()) {
//                if (annotationMirror.getAnnotationType().toString().equals(annotationClass.getCanonicalName())) {
//                    return annotationMirror;
//                }
//            }
//        }

        return null;
    }

    public static @Nullable Object getAnnotationValue(AnnotationMirror mirror, String key) {
        for (Map.Entry<? extends ExecutableElement, ? extends AnnotationValue> entry :
                mirror.getElementValues().entrySet()) {
            if (entry.getKey().getSimpleName().toString().equals(key)) {
                return entry.getValue().getValue();
            }
        }
        return null;
    }

    private List<TypeElement> getAllSuperTypes(TypeElement type) {
        List<TypeElement> result = new ArrayList<>();
        Queue<TypeMirror> toProcess = new LinkedList<>();
        toProcess.add(type.asType());

        while (!toProcess.isEmpty()) {
            TypeMirror current = toProcess.poll();
            TypeElement currentElement = ((TypeElement) processingEnv.getTypeUtils().asElement(current));
            if (currentElement != null && !result.contains(currentElement)) {
                result.add(currentElement);

                // 添加直接父类
                TypeMirror superclass = currentElement.getSuperclass();
                if (superclass.getKind() != TypeKind.NONE) {
                    toProcess.add(superclass);
                }

                // 添加直接接口
                toProcess.addAll(currentElement.getInterfaces());
            }
        }
        return result;
    }

    Map<String, VariableElement> collectAllFields(TypeElement type) {
        Map<String, VariableElement> fieldMap = new HashMap<>();
        for (TypeElement superType : getAllSuperTypes(type)) {
            // 跳过接口（接口中不会有字段）
            if (superType.getKind() == ElementKind.INTERFACE) continue;

            for (Element e : superType.getEnclosedElements()) {
                if (e.getKind() == ElementKind.FIELD) {
                    String name = e.getSimpleName().toString();
                    fieldMap.putIfAbsent(name, (VariableElement) e);
                }
            }
        }
        return fieldMap;
    }

    Map<String, ExecutableElement> collectAllMethods(TypeElement type) {
        Map<String, ExecutableElement> methodMap = new LinkedHashMap<>();
        for (TypeElement superType : getAllSuperTypes(type)) {
            for (Element e : superType.getEnclosedElements()) {
                if (e.getKind() == ElementKind.METHOD) {
                    String nameParams = e.getSimpleName().toString() + ((ExecutableElement) e).getParameters().toString();
                    methodMap.putIfAbsent(nameParams, (ExecutableElement) e);
                }
            }
        }
        return methodMap;
    }


//    Map<String, VariableElement> collectAllFields(TypeElement typeElement){
//        Map<String, VariableElement> fields = new HashMap<>();
//        if (typeElement != null) {
//            collectAllFieldsRecursively(typeElement, fields);
//        }
//        return fields;
//    }
//
//    private void collectAllFieldsRecursively(TypeElement typeElement, Map<String, VariableElement> fieldMap) {
//        // 先处理子类自己的字段
//        for (Element enclosedElement : typeElement.getEnclosedElements()) {
////            System.err.println("  " + enclosedElement);
//            if (enclosedElement.getKind() == ElementKind.FIELD) {
//                String fieldName = enclosedElement.getSimpleName().toString();
//                if (!fieldMap.containsKey(fieldName)) {
//                    fieldMap.put(fieldName, (VariableElement) enclosedElement);
//                }
//            }
//        }
//
//        // 递归处理父类
//        TypeMirror superclass = typeElement.getSuperclass();
//        if (superclass.getKind() != TypeKind.NONE) {
//            Element superElement = ((DeclaredType) superclass).asElement();
//            if (superElement instanceof TypeElement) {
//                collectAllFieldsRecursively((TypeElement) superElement, fieldMap);
//            }
//        }
//    }

    Class<?> getClassFromTypeMirror(TypeMirror typeMirror) {
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
                return java.lang.reflect.Array.newInstance(componentClass, 0).getClass();
            } else {
                throw new IllegalArgumentException("Unsupported type: " + typeMirror);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to get Class<?> from VariableElement", e);
        }
    }

    private Class<?> getPrimitiveClass(TypeKind kind) {
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

    TypeElement getTypeElementFromTypeMirror(TypeMirror mirror){
        return processingEnv.getElementUtils().getTypeElement(mirror.toString());
    }

    public boolean directlyImplementsInterface(TypeElement element, Class<?> interfaceClass) {
        TypeElement targetInterface = processingEnv.getElementUtils().getTypeElement(interfaceClass.getCanonicalName());
        if (targetInterface == null) {
            return false;
        }

        TypeMirror targetErased = processingEnv.getTypeUtils().erasure(targetInterface.asType());

        for (TypeMirror iface : element.getInterfaces()) {
            if (processingEnv.getTypeUtils().isSameType(processingEnv.getTypeUtils().erasure(iface), targetErased)) {
                return true;
            }
        }

        return false;
    }


}
