package org.xaspect;

import com.squareup.javapoet.CodeBlock;
import com.xspcomm.XData;
import org.xaspect.datas.*;

import javax.annotation.processing.ProcessingEnvironment;
import javax.lang.model.element.*;
import javax.lang.model.type.DeclaredType;
import javax.lang.model.type.TypeKind;
import javax.lang.model.type.TypeMirror;
import javax.lang.model.util.Elements;
import javax.lang.model.util.Types;
import java.util.*;

import static org.xaspect.TypeParserHelper.*;

public class DUTBindingTool {

    static ProcessingEnvironment processingEnv;
    static CodeBlock constructGetMethod(
            ExecutableElement method,
            String prefix,
            InstanceDUTTypeInfo instanceFieldType,
            String outerName,
            GetMethod getMethod){
        IOParameters ios = new IOParameters(instanceFieldType, method.getReturnType());
        ios.fieldName = outerName;
        ios.isIn = false;
        ios.isPin = false;
        ios.prefixPattern = prefix + getMethod.prefix();
        ios.isSon = false;
        List<? extends AnnotationMirror> annotationMirrors = method.getAnnotationMirrors();
//        if (TypeParserHelper.getInstance().getAnnotation(method, Pin.class).isEmpty() &&
//        TypeParserHelper.getInstance().getAnnotation(method, Bundle.class).isEmpty() &&
//                TypeParserHelper.getInstance().getAnnotation(method, ListedXComponent.class).isEmpty()){
//            throw new RuntimeException("Method decorated with @GetMethod should also be decorated with @Pin, @Bundle or @ListedXComponent");
//        }

        XComponentConnector componentConnector = ConnectorFactory.buildConnector(ios, annotationMirrors);
        if (componentConnector == null) {
            throw new RuntimeException("Method decorated with @GetMethod should also be decorated with @Pin, @Bundle or @ListedXComponent");
        }
        return componentConnector.connect();
    }
//    static List<String> constructGetMethod(
//            ExecutableElement method,
//            String prefix,
//            InstanceDUTTypeInfo instanceFieldType,
//            String outerName,
//            GetMethod getMethod) {
//
//        String outputPrefix = prefix + getMethod.prefix();
//        List<String> ret = new ArrayList<>();
//
//        IOParameters ios = new IOParameters(instanceFieldType, method.getReturnType());
//        ios.isIn = false;
//
//        // ✅ 新的判断方式
//        XComponentType compType = getMethod.componentType();
//        ios.isPin = compType == XComponentType.PIN;
//
//        if (!ios.isPin) {
//            ios.coveringUnsigned = getMethod.coveringUnsigned();
//            ios.unsigned = getMethod.unsigned();
//        } else {
//            ios.unsigned = getMethod.unsigned();
//        }
//
//        TypeMirror typeName = method.getReturnType();
//
//        // ✅ 初始化输出变量（PIN 不需要 new）
//        CodeBlock.Builder builder = CodeBlock.builder();
//        builder.add("$T $L", typeName, outerName);
//        if (compType != XComponentType.PIN) {
//            builder.add(" = new $T()", typeName);
//        }
//        builder.add(";\n");
//        ret.add(builder.build().toString());
//
//        // ✅ 调用结构构建
//        List<String> outputAssigns = constructIO(outputPrefix, method, instanceFieldType, outerName, ios);
//        ret.addAll(outputAssigns);
//        return ret;
//    }
    static CodeBlock constructOneParamBinding(String prefix, VariableElement param, String inputBundleName,
                                              InstanceDUTTypeInfo instanceField) {
        IOParameters ios = new IOParameters(instanceField, param.asType());

        ios.isIn = true;
        ios.isSon = false;
        ios.prefixPattern = prefix;
        ios.fieldName = param.getSimpleName().toString();
        ios.defaultPinNameFromFieldName = ios.fieldName;
        XComponentConnector componentConnector = ConnectorFactory.buildConnector(ios, param.getAnnotationMirrors());
        if (componentConnector == null) {
            throw new RuntimeException("param in method decorated by @PostMethod should be decorated with @Pin, @Bundle or @ListedXComponent");
        }
        return componentConnector.connect();
    }

//    static List<String> constructOneParamBinding(String prefix, VariableElement param, String inputBundleName, InstanceDUTTypeInfo instanceField) {
//        IOParameters ios = new IOParameters(instanceField, param.asType());
//
//        ios.isIn = true;
//
//        // 本地变量 inputPrefix 保留原样
//        String inputPrefix = prefix;
//
//        Optional<AnnotationMirror> innerPinAnnotation = TypeParserHelper.getInstance().getAnnotation(param, Pin.class);
//        Optional<AnnotationMirror> innerBundleAnnotation = TypeParserHelper.getInstance().getAnnotation(param, InBundle.class);
//
//        // 保留原 inputPrefix 拼接逻辑
//        if (innerBundleAnnotation.isPresent()) {
//            String value = (String) TypeParserHelper.getInstance().getAnnotationValue(innerBundleAnnotation.get(), "value");
//            Boolean coveringUnsigned = (Boolean) TypeParserHelper.getInstance().getAnnotationValue(innerBundleAnnotation.get(), "coveringUnsigned");
//            Boolean unsigned = (Boolean) TypeParserHelper.getInstance().getAnnotationValue(innerBundleAnnotation.get(), "unsigned");
//
//            if (value != null) inputPrefix += value;
//            if (coveringUnsigned != null) ios.coveringUnsigned = coveringUnsigned;
//            if (unsigned != null) ios.unsigned = unsigned;
//        } else if (innerPinAnnotation.isPresent()) {
//            String value = (String) TypeParserHelper.getInstance().getAnnotationValue(innerPinAnnotation.get(), "value");
//            Boolean unsigned = (Boolean) TypeParserHelper.getInstance().getAnnotationValue(innerPinAnnotation.get(), "unsigned");
//
//            if (value == null || value.isEmpty()) {
//                inputPrefix += param.getSimpleName().toString();
//            } else {
//                inputPrefix += value;
//            }
//
//            ios.isPin = true;
//            if (unsigned != null) ios.unsigned = unsigned;
//        }
//
//        return constructIO(inputPrefix, param, instanceField, inputBundleName, ios);
//    }



    private static List<String> constructIO(String pre, Element element, InstanceDUTTypeInfo insInfo, String IOName, IOParameters ioParameters) {
        String prefix = pre;
        TypeElement dataTypeElement;

        TypeMirror typeMirror;
        if (element.getKind() == ElementKind.METHOD) {

            typeMirror = ((ExecutableElement) element).getReturnType();

        } else {
            typeMirror = element.asType();

        }

        dataTypeElement = TypeParserHelper.getInstance().getTypeElementFromTypeMirror(typeMirror);
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
            rets.add(constructAssignmentWithCheck(fieldPrefix, typeMirror, prefix, ioParameters, insInfo));
        } else {
            // 如果元素是类或接口，获取其字段
            System.err.println(dataTypeElement + "???");
            System.err.println(element.getSimpleName() + "!!!");
            Map<String, VariableElement> allVars = TypeParserHelper.getInstance().collectAllFields(dataTypeElement);
            for (VariableElement enclosedElement : allVars.values()) {
                VariableElement field = enclosedElement;
                processField(field, prefix, insInfo, fieldPrefix, ioParameters, rets);
            }
        }
        return rets;
    }

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
//        } else if (field.getAnnotation(ListedXComponent.class) != null) {
//            // 处理 ListPins 注解
//            ListedXComponent listPinAnnotation = field.getAnnotation(ListedXComponent.class);
//            int start = listPinAnnotation.start();
//            boolean allSignalsUnsigned = listPinAnnotation.unsigned();
//            String arrPrefix = prefix + listPinAnnotation.prefix();
//            if (start < 0){
//                System.err.println("start smaller than 0 in @" + ListedXComponent.class.getSimpleName() + "of field " + field.getSimpleName());
//                start = 0;
//            }
//            int maxIdx = listPinAnnotation.maxIdx();
//            if (maxIdx < start){
//                throw new RuntimeException("max smaller than start in @" + ListedXComponent.class.getSimpleName() + " of field " + field.getSimpleName());
//            }
//
//            Optional<TypeMirror> getListType = TypeParserHelper.getInstance().getListElementType(field);
//            if (!getListType.isPresent()) {
//                throw new RuntimeException("non list type decorated with @" + ListedXComponent.class.getSimpleName());
//            }
//            TypeMirror listType = getListType.get();
//            if (!ioParameters.isIn){
//                rets.add(CodeBlock.builder().addStatement("$L.$N = new $T<>($L)", fieldPrefix, field.getSimpleName(), ArrayList.class, maxIdx).build().toString());
//            }
//
//            String arrFullName = fieldPrefix + "." + field.getSimpleName();
//
//            for (int i = start; i <= maxIdx; i++) {
//
//                IOParameters subIOS = ioParameters.copy();
//                String trueArrElementPin = arrPrefix + i;
//                String tmpArrVar = arrPrefix + "__tmp__" + i;
//                subIOS.isSon = true;
//                subIOS.isPin = listPinAnnotation.isPin();
//                subIOS.unsigned = allSignalsUnsigned;
//                if (!subIOS.isPin){
//                    subIOS.coveringUnsigned = listPinAnnotation.coveringUnsigned();
//                    trueArrElementPin += listPinAnnotation.listBundlePrefix();
//                }
//                CodeBlock.Builder builder = CodeBlock.builder();
//                if (subIOS.isIn) {
//                    builder.addStatement("$T $N = $L.get($L)", listType, tmpArrVar, arrFullName, i);
//                } else {
//                    if (subIOS.isPin){
//                        builder.addStatement("$T $N", listType, tmpArrVar);
//                    } else {
//                        builder.addStatement("$T $N = new $T()", listType, tmpArrVar, listType);
//                    }
//                }
//                rets.add(builder.build().toString());
//                rets.addAll(constructIO(trueArrElementPin, field, insInfo, arrFullName, subIOS));
//                if (!subIOS.isIn){
//                    rets.add(CodeBlock.builder().addStatement("$L.set($L, $N)", arrFullName, i, tmpArrVar).build().toString());
//                }
//            }

        }
    }



    private static String getBasicTypeValStr(TypeMirror typeMirror, String signedBefore) {
        if (TypeParserHelper.getInstance().isInteger(typeMirror)) {
            return signedBefore + ".intValue()";
        } else if (TypeParserHelper.getInstance().isLong(typeMirror)) {
            return signedBefore + ".longValue()";
        } else if (TypeParserHelper.getInstance().isByteArray(typeMirror)) {
            return ".GetBytes()";
        } else if (typeMirror.toString().equals("java.lang.String")) {
            return ".String()";
        } else if (typeMirror.toString().equals("java.math.BigInteger")) {
            return signedBefore;
        }

        return "";
    }

    private static String constructAssignmentWithCheck(String fieldFullName, TypeMirror fieldType, String pinNamePattern, IOParameters ios, InstanceDUTTypeInfo insInfo) {
        if (insInfo.getFields().containsKey(pinNamePattern)){
            //存在这个变量，而且是XData，就不需要后续的正则检查
            String pinFullName = insInfo.getInstanceName() + "." + pinNamePattern;

            if (mirrorEqualsClass(insInfo.getFields().get(pinNamePattern).asType(), XData.class)) {
                return constructSimpleAssignment(pinFullName, fieldFullName, ios, fieldType);
            }
        } else {
            boolean generated = false;
            String res = "";
            for (Map.Entry<String, VariableElement> entry : insInfo.getFields().entrySet()) {
                if (!mirrorEqualsClass(entry.getValue().asType(), XData.class)) {
                    continue;
                }

                if (!entry.getKey().matches(pinNamePattern)){
                    continue;
                }

                if (!generated){
                    generated = true;
                    String pinFullName = insInfo.getInstanceName() + "." + entry.getKey();

                    res = constructSimpleAssignment(pinFullName, fieldFullName, ios, fieldType);
                } else {
                    System.err.println("\u001B[31mDifferent pins match the same pattern: " + pinNamePattern + ", please check!!! Now we just ignoring those being not the first so that the variable won't connect\u001B[0m");
                }
            }

            if (generated){
                return res;
            }

        }

        System.err.println("pin following pattern: " + pinNamePattern + " is not found, please recheck!");
        return "";
    }

    private static boolean mirrorEqualsClass(TypeMirror typeMirror, Class<?> clazz) {
        return typeMirror.toString().equals(clazz.getCanonicalName());
    }

    private static String constructSimpleAssignment(String pinFullName, String fieldFullName, IOParameters ios, TypeMirror fieldType) {
        if (ios.isIn) {
                return String.format("%s.Set(%s);\n", pinFullName, fieldFullName);
        } else {
            String signedGet = "." + (ios.unsigned ? "U()" : "S()");
            String basicGet = getBasicTypeValStr(fieldType, signedGet);
            return String.format("%s = %s%s;\n", fieldFullName, pinFullName, basicGet);

        }
    }

    static TypeMirror getInheritingType(TypeElement fieldType, Class<?> inheritingClass) {
        Elements elementUtils = processingEnv.getElementUtils();
        TypeElement targetElement = elementUtils.getTypeElement(inheritingClass.getCanonicalName());
        if (targetElement == null) {
            throw new IllegalStateException("Target class not found: " + inheritingClass.getCanonicalName());
        }

        Queue<TypeMirror> queue = new LinkedList<>();
        Set<String> visited = new HashSet<>();

        queue.add(fieldType.asType());

        while (!queue.isEmpty()) {
            TypeMirror current = queue.poll();
            String currentStr = current.toString();
            if (!visited.add(currentStr)) continue;

            if (current instanceof DeclaredType) {
                DeclaredType declaredType = (DeclaredType) current;
                TypeElement element = (TypeElement) declaredType.asElement();

                // ✅ 精确匹配接口本体（不使用 isAssignable）
                if (element.getQualifiedName().contentEquals(targetElement.getQualifiedName())) {
                    List<? extends TypeMirror> args = declaredType.getTypeArguments();
                    if (args.size() == 1) {
                        return args.get(0);
                    } else {
                        throw new IllegalStateException("Target interface must have exactly one type parameter");
                    }
                }

                // 添加父接口
                queue.addAll(element.getInterfaces());

                // 添加父类（跳过 java.lang.Object）
                TypeMirror superClass = element.getSuperclass();
                if (superClass != null && superClass.getKind() != TypeKind.NONE) {
                    queue.add(superClass);
                }
            }
        }

        throw new IllegalStateException(fieldType.getQualifiedName() + " does not directly or indirectly implement " + inheritingClass.getSimpleName());
    }



//    static TypeMirror getInheritingType(TypeElement fieldType, Class<?> inheritingClass) {
//        Types typeUtils = processingEnv.getTypeUtils();
//        Elements elementUtils = processingEnv.getElementUtils();
//
//        TypeElement targetElement = elementUtils.getTypeElement(inheritingClass.getCanonicalName());
//        if (targetElement == null) {
//            throw new IllegalStateException("Target class not found: " + inheritingClass.getCanonicalName());
//        }
//
//        TypeMirror targetType = targetElement.asType();
//
//        // 广度优先遍历所有父接口/类
//        Queue<TypeMirror> toCheck = new LinkedList<>();
//        Set<TypeMirror> visited = new HashSet<>();
//        toCheck.add(fieldType.asType());
//
//        while (!toCheck.isEmpty()) {
//            TypeMirror current = toCheck.poll();
//            if (!visited.add(current)) continue;
//
//            // 如果是 declared 类型才可能有类型参数
//            if (current instanceof DeclaredType) {
//                DeclaredType declaredType = (DeclaredType) current;
//                TypeMirror erased = typeUtils.erasure(declaredType);
//                if (typeUtils.isAssignable(erased, typeUtils.erasure(targetType))) {
//                    List<? extends TypeMirror> args = declaredType.getTypeArguments();
//                    if (args.size() == 1) {
//                        return args.get(0);
//                    } else {
//                        System.err.println(args);
//                        throw new IllegalStateException("Interface " + current + " must have exactly one type argument but args " + args);
//                    }
//                }
//
//                // 将其父接口加入队列
//                TypeElement declaredElement = (TypeElement) declaredType.asElement();
//                toCheck.addAll(declaredElement.getInterfaces());
//
//                // 加入父类（如果不是 Object）
//                TypeMirror superclass = declaredElement.getSuperclass();
//                if (superclass != null && superclass.getKind() != TypeKind.NONE) {
//                    toCheck.add(superclass);
//                }
//            }
//        }
//
//        throw new IllegalStateException(fieldType.getQualifiedName() + " does not implement " + inheritingClass.getSimpleName());
//    }


//    static TypeMirror getInheritingType(TypeElement fieldType, Class<?> inheritingClass) {
//        Types typeUtils = processingEnv.getTypeUtils();
//        Elements elementUtils = processingEnv.getElementUtils();
//
//        // 获取类型
//        TypeElement dutWrapperElement = elementUtils.getTypeElement(inheritingClass.getCanonicalName()); // 替换全限定名
//        if (dutWrapperElement == null) {
//            throw new IllegalStateException("DUTWrapper not found in the classpath");
//        }
//        DeclaredType dutWrapperType = (DeclaredType) dutWrapperElement.asType();
//
//        // 检查接口是否直接继承 DUTDao
//        for (TypeMirror superInterface : fieldType.getInterfaces()) {
//            if (typeUtils.isAssignable(typeUtils.erasure(superInterface), typeUtils.erasure(dutWrapperType))) {
//                // 检查泛型信息
//                if (superInterface instanceof DeclaredType) {
//                    DeclaredType declaredType = (DeclaredType) superInterface;
//                    if (declaredType.getTypeArguments().size() == 1) {
//                        // 添加更多泛型验证逻辑（如果需要）
//                        return declaredType.getTypeArguments().get(0);
//                    } else {
//                        throw new IllegalStateException("DUTDao interface must have exactly one type argument");
//                    }
//                }
//            }
//        }
//        throw new IllegalStateException("not extends from DUTDao");
//    }



}
