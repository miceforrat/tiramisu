package org.xaspect;

import com.squareup.javapoet.ClassName;
import com.squareup.javapoet.TypeName;
import com.sun.source.tree.AnnotatedTypeTree;
import com.sun.source.tree.AnnotationTree;
import com.sun.source.tree.MethodTree;
import com.sun.source.tree.Tree;
import com.sun.source.util.TreePath;
import com.sun.source.util.Trees;
import jdk.dynalink.linker.support.TypeUtilities;

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
import java.util.stream.Collectors;

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

    public Optional<AnnotationMirror> getAnnotation(Element element, Class<?> annotationClass) {
        // 先从 Element 上找（标准 APT 兼容）
//        System.err.println(element.getAnnotationMirrors().size());
        return getAnnotation(element.getAnnotationMirrors(), annotationClass);

    }

    public Optional<AnnotationMirror> getAnnotation(List<? extends AnnotationMirror> mirrors, Class<?> annotationClass) {
        for (AnnotationMirror annotationMirror : mirrors) {
            if (annotationMirror.getAnnotationType().toString().equals(annotationClass.getCanonicalName())) {
                return Optional.of(annotationMirror);
            }
        }
        return Optional.empty();
    }

    public static Optional<AnnotationMirror> findAnnotationWithMetaValueInSet(List<? extends AnnotationMirror> annotations, Class<?> metaAnnotationClass,
            String metaMemberName, String allowedValue) {
        for (AnnotationMirror ann : annotations) {
            List<? extends AnnotationMirror> metaAnns = ann.getAnnotationType().asElement().getAnnotationMirrors();
            for (AnnotationMirror meta : metaAnns) {
                if (!meta.getAnnotationType().toString().equals(metaAnnotationClass.getCanonicalName())) {
                    continue;
                }

                for (Map.Entry<? extends ExecutableElement, ? extends AnnotationValue> e : meta.getElementValues().entrySet()) {
                    if (e.getKey().getSimpleName().contentEquals(metaMemberName)) {
                        Object rawValue = e.getValue().getValue();
                        if (rawValue != null && allowedValue.equals(rawValue.toString())) {
                            return Optional.of(ann); // 找到匹配的注解
                        }
                    }
                }
            }
        }

        return Optional.empty();
    }



    public @Nullable Object getAnnotationValue(AnnotationMirror mirror, String key) {
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

    public boolean isListType(TypeMirror type) {
        Types types = processingEnv.getTypeUtils(); // javax.annotation.processing.ProcessingEnvironment
        Elements elements = processingEnv.getElementUtils();
        TypeMirror listType = elements.getTypeElement("java.util.List").asType();
        return types.isAssignable(types.erasure(type), types.erasure(listType));
    }


    public Optional<TypeMirror> getListElementTypeFromType(TypeMirror fieldType) {
        TypeMirror listType = processingEnv.getElementUtils().getTypeElement("java.util.List").asType();
        Types typeUtils = processingEnv.getTypeUtils();

        // 判断是否是 List 的子类型
        if (typeUtils.isAssignable(typeUtils.erasure(fieldType), typeUtils.erasure(listType))) {
            if (fieldType instanceof DeclaredType) {
                List<? extends TypeMirror> typeArgs = ((DeclaredType) fieldType).getTypeArguments();
                if (!typeArgs.isEmpty()) {
                    return Optional.of(typeArgs.get(0)); // 返回 List<T> 中的 T
                }
            }
        }

        return Optional.empty(); // 不是 List，或者没有泛型参数
    }


    public boolean isByteArray(TypeMirror typeMirror) {
        if (typeMirror.getKind() != TypeKind.ARRAY) {
            return false;
        }

        ArrayType arrayType = (ArrayType) typeMirror;
        TypeMirror componentType = arrayType.getComponentType();
        return componentType.getKind() == TypeKind.BYTE;
    }

    public boolean isInteger(TypeMirror typeMirror) {
        if (typeMirror.getKind() == TypeKind.INT) {
            return true;
        }
        return typeMirror.toString().equals("java.lang.Integer");
    }
    public boolean isLong(TypeMirror typeMirror) {
        if (typeMirror.getKind() == TypeKind.LONG) {
            return true;
        }
        return typeMirror.toString().equals("java.lang.Long");
    }

    public List<Integer> getAnnotationIntList(AnnotationMirror mirror, String name) {
        List<? extends AnnotationValue> values = (List<? extends AnnotationValue>) getAnnotationValue(mirror, name);
        if (values != null) {
            return values.stream()
                    .map(v -> (Integer) v.getValue()).collect(Collectors.toList());
        }
        return Collections.emptyList();
    }

    public List<String> getAnnotationStringList(AnnotationMirror mirror, String name) {
        List<? extends AnnotationValue> values = (List<? extends AnnotationValue>) getAnnotationValue(mirror, name);
        if (values != null) {
            return values.stream()
                    .map(v -> (String) v.getValue()).collect(Collectors.toList());
        }
        return Collections.emptyList();
    }

    public List<Boolean> getAnnotationBooleanList(AnnotationMirror mirror, String name) {
        List<? extends AnnotationValue> values = (List<? extends AnnotationValue>) getAnnotationValue(mirror, name);
        if (values != null) {
            return values.stream()
                    .map(v -> (Boolean) v.getValue()).collect(Collectors.toList());
        }
        return Collections.emptyList();
    }

}
