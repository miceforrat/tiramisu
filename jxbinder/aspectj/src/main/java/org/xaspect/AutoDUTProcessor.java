package org.xaspect;

import com.google.auto.service.AutoService;
import com.squareup.javapoet.*;
import org.xaspect.datas.*;

import javax.annotation.processing.*;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.*;
import javax.lang.model.type.*;
import javax.lang.model.util.Elements;
import javax.lang.model.util.Types;
import javax.tools.StandardLocation;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.math.BigInteger;
import java.util.*;


@AutoService(Processor.class)
public class AutoDUTProcessor extends AbstractProcessor {

    private Filer filer;
    private Elements elementUtils;


    @Override
    public synchronized void init(ProcessingEnvironment processingEnv) {
        super.init(processingEnv);
        filer = processingEnv.getFiler();
        elementUtils = processingEnv.getElementUtils();
        DUTBindingTool.processingEnv = processingEnv;
        TypeParserHelper.processingEnv = processingEnv;
    }

    @Override
    public Set<String> getSupportedAnnotationTypes() {
        return Collections.singleton(AutoDUTDao.class.getCanonicalName());
    }

    @Override
    public SourceVersion getSupportedSourceVersion() {
        return SourceVersion.latestSupported();
    }

    @Override
    public boolean process(Set<? extends TypeElement> annotations, RoundEnvironment roundEnv) {
        if (processingEnv.getClass().equals(org.aspectj.org.eclipse.jdt.internal.compiler.apt.dispatch.BatchProcessingEnvImpl.class)){
            return true;
        }
        for (Element element : roundEnv.getElementsAnnotatedWith(AutoDUTDao.class)) {
            if (element.getKind() == ElementKind.FIELD) {
                processField((VariableElement) element);
            }
        }
        return true;
    }

    private void processField(VariableElement field) {
//        String fieldName = field.getSimpleName().toString();
        TypeElement fieldType = elementUtils.getTypeElement(field.asType().toString());
        String packageName = processingEnv.getElementUtils().getPackageOf(fieldType).getQualifiedName().toString();
//        System.out.println(packageName);
        // 获取字段类型和注解信息
        AutoDUTDao autoDUT = field.getAnnotation(AutoDUTDao.class);
        String prefix = autoDUT.value();

        // 生成实现类名
        String implClassName = fieldType.getSimpleName() + "ImplWithPrefix" + prefix;
        if (doesClassExist(packageName, implClassName)){
            System.err.println("Class " + implClassName + " already exists, skipping.");
            return;
        }
        AnnotationSpec annotation = AnnotationSpec.builder(AspectIgnore.class)
                .build();
        // 构建实现类
        TypeSpec.Builder implClassBuilder = TypeSpec.classBuilder(implClassName)
                .addModifiers(Modifier.PUBLIC)
                .addAnnotation(annotation)
                .addSuperinterface(ClassName.get(fieldType));
        DUTClassBuilder classBuilder;
//        if (builderType == ConcurrentSupport.SEPARATE_THREAD){
//            classBuilder = new SeparateThreadDUTClassBuilder();
//        } else {
        classBuilder = new NormalDUTClassBuilder();

//        }
        classBuilder.buildConstructor(implClassBuilder, fieldType, autoDUT);
//        // 添加字段和构造方法
//        String instanceFieldName = dutTypeName.toString().replace(".", "") + "Instance" + dutId;
//        FieldSpec dutField = FieldSpec.builder(dutTypeName, instanceFieldName, Modifier.PRIVATE)
//                .build();
//        implClassBuilder.addField(dutField);
//
//        String initializeClockStr = "";
//
//        if (!clockName.isEmpty()){
//            initializeClockStr = "this." + instanceFieldName + ".InitClock(\"" + clockName + "\");";
//        }
//
//        MethodSpec constructor = MethodSpec.constructorBuilder()
//                .addModifiers(Modifier.PUBLIC)
//                .addStatement("this.$N = new $T()", instanceFieldName, dutTypeName)
//                .addStatement(initializeClockStr)
//                .build();
//        implClassBuilder.addMethod(constructor);

        addMethodsToImplClass(implClassBuilder, fieldType, prefix, processingEnv.getTypeUtils(), classBuilder);

        // 获取`@AutoDUT`修饰类的包路径
        // 写入生成的类到相同包路径
        JavaFile javaFile = JavaFile.builder(packageName, classBuilder.build(implClassBuilder))
                .build();

        try {
            javaFile.writeTo(filer);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void addMethodsToImplClass(TypeSpec.Builder implClassBuilder, TypeElement fieldType, String prefix, Types typeUtils, DUTClassBuilder clsBuilder) {
        Set<String> processedMethods = new HashSet<>(); // 防止重复处理同名方法
//        String instanceFieldName = constantNames.instanceName;
        // 遍历当前类型及其父类或接口
        for (TypeElement currentElement : getAllSuperTypes(fieldType, typeUtils)) {
            for (Element enclosedElement : currentElement.getEnclosedElements()) {
                if (enclosedElement.getKind() == ElementKind.METHOD) {
                    ExecutableElement method = (ExecutableElement) enclosedElement;

                    // 防止覆盖同名方法
                    String methodSignature = method.getSimpleName().toString() + method.getParameters();
                    if (processedMethods.contains(methodSignature)) {
                        continue;
                    }
                    processedMethods.add(methodSignature);

                    // 获取方法名称、返回类型、参数类型等
                    String methodName = method.getSimpleName().toString();
                    TypeMirror returnType = method.getReturnType();

                    MethodSpec.Builder methodBuilder = MethodSpec.methodBuilder(methodName)
                            .addModifiers(Modifier.PUBLIC)
                            .returns(ClassName.get(returnType));

                    // 添加方法参数
                    if (!methodName.equals("bind")) {
                        for (VariableElement parameter : method.getParameters()) {
                            methodBuilder.addParameter(
                                    TypeName.get(parameter.asType()),
                                    parameter.getSimpleName().toString()
                            );
                        }
                    } else {
                        methodBuilder.addParameter(TypeName.get(DUTBindingTool.getInheritingType(fieldType, DUTDao.class)),
                                method.getParameters().get(0).getSimpleName().toString());
                    }

                    // 构造方法体


//                    StringBuilder methodBody = new StringBuilder();

                    if (method.getAnnotation(PostMethod.class) != null) {
//                        String postPrefix = prefix + method.getAnnotation(PostMethod.class).prefix();
//                        List<String> res = constructPostMethod(method, postPrefix, instanceFieldName);
//                        res.forEach(methodBody::append);
                        clsBuilder.buildPostMethod(methodBuilder, prefix, method);
                    } else if (method.getAnnotation(GetMethod.class) != null) {
//                        List<String> res = constructGetMethod(method, getPrefix, instanceFieldName);
//                        res.forEach(methodBody::append);
                        clsBuilder.buildGetMethod(methodBuilder, prefix, method);
                    } else if (methodName.equals("Step")) {
//                        String stepTime = "1";
                        if (method.getParameters().size() == 1) {
                            String stepTime = method.getParameters().get(0).getSimpleName().toString();
                            clsBuilder.buildStep(stepTime, methodBuilder);
                        } else {
                            clsBuilder.buildStep(methodBuilder);
                        }
//                        methodBody.append("this." +  clkManagerName + ".waitForSteps(\"" + instanceFieldName +"\", " + stepTime + ");\n");
                    } else if (methodName.equals("finish")) {
                        clsBuilder.buildFinish(methodBuilder);
//                        methodBody.append("this." + clkManagerName + ".shutdown();\n").append("this." + instanceFieldName + ".Finish();\n");
                    } else if (methodName.equals("reset")) {
                        clsBuilder.buildReset(methodBuilder);
                    } else if (methodName.equals("bind")) {
                        clsBuilder.buildBind(methodBuilder, method);
                    }else {
                        methodBuilder.addCode("System.out.println(\"Calling method: " + methodName + "\");\n");
                        if (!returnType.toString().equals("void")) {
                            methodBuilder.addCode("return null; // Replace with actual implementation\n");
                        }
                    }
//                    methodBuilder.addCode(methodBody.toString());

                    // 添加方法到实现类
                    implClassBuilder.addMethod(methodBuilder.build());
                }
            }
        }
    }

    /**
     * 获取类型及其所有父类和接口
     */
    private List<TypeElement> getAllSuperTypes(TypeElement type, Types typeUtils) {
        List<TypeElement> result = new ArrayList<>();
        Queue<TypeMirror> toProcess = new LinkedList<>();
        toProcess.add(type.asType());

        while (!toProcess.isEmpty()) {
            TypeMirror current = toProcess.poll();
            TypeElement currentElement = (TypeElement) typeUtils.asElement(current);
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

    private List<String> constructPostMethod(ExecutableElement method, String prefix, String instanceFieldName) {
        List<? extends VariableElement> params = method.getParameters();
        List<String> ret = new ArrayList<>();
        for (VariableElement param : params) {
            //获取公用前缀
            String inputBundleName = param.getSimpleName().toString();

            IOParameters ios = new IOParameters();
            ios.isIn = true;
            String inputPrefix = prefix;
//                    ios.isPin = hasAnnotationSelf(params.get(0).getAnnotationMirrors(), Pin.class.getCanonicalName());
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

            List<String> inputsAssigns = constructIO(inputPrefix, getClassFromTypeMirror(param.asType()), instanceFieldName, inputBundleName, ios);
            ret.addAll(inputsAssigns);

        }
        return ret;
    }

//    private List<String> constructGetMethod(ExecutableElement method, String prefix, String instanceFieldName){
//        String outputPrefix = prefix;
//        List<String> ret = new ArrayList<>();
//
//        IOParameters ios = new IOParameters();
//        ios.isIn = false;
//        Annotation outerPinAnnotation = getAnnotationFromType(method.getReturnType(), Pin.class);
//        Annotation outerBundleAnnotation = getAnnotationFromType(method.getReturnType(), ReturnsBundle.class);
//        if (outerBundleAnnotation != null) {
//            ReturnsBundle outerBundle = (ReturnsBundle) outerBundleAnnotation;
//            outputPrefix += outerBundle.value();
//            ios.coveringUnsigned = outerBundle.coveringUnsigned();
//            ios.unsigned = outerBundle.unsigned();
//        } else if (outerPinAnnotation != null){
//            outputPrefix += ((Pin) outerPinAnnotation).value();
//        }
//        ios.isPin = outerPinAnnotation != null;
//
//        String outerName = "retBundle";
//
//        Class<?> returnTypeCls = getClassFromTypeMirror(method.getReturnType());
//        String typeName = returnTypeCls.getTypeName();
//        String initializr = typeName + " " + outerName ;
//        if (!ios.isPin) {
//            initializr += " = new " + typeName + "()";
//        }
//        initializr += ";\n";
//        ret.add(initializr);
//        List<String> outputAssigns = constructIO(outputPrefix, returnTypeCls, instanceFieldName, outerName, ios);
//
//        ret.addAll(outputAssigns);
//
//        ret.add("return " + outerName + ";\n");
//
//        return ret;
//    }

    private boolean doesClassExist(String packageName, String className) {
        String resourcePath = packageName.replace('.', '/') + "/" + className + ".java";
        try {
            processingEnv.getFiler()
                    .getResource(StandardLocation.SOURCE_OUTPUT, "", resourcePath)
                    .openInputStream() // 💥 实际读取才会抛错
                    .close(); // 确实存在时能打开关闭
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    private Annotation getAnnotationFromType(TypeMirror type, Class<?> annotationClass) {
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


    private List<String> constructIO(String pre, Class<?> dataClass, String insName, String IOName, IOParameters ioParameters) {
        String prefix = pre;
        //bundle类内生的prefix处理
        if (dataClass.isAnnotationPresent(Bundle.class)){
            prefix += dataClass.getAnnotation(Bundle.class).value();
        }

        List<String> rets = new ArrayList<>();
//        String typeName = dataClass.getTypeName();
        String fieldPrefix;
        fieldPrefix = IOName;

        //如果是输出，初始化待返回结果
//        if ((!ioParameters.isIn) && (!ioParameters.isSon)) {
//            String initializr = typeName + " " + fieldPrefix ;
//            if (!ioParameters.isPin) {
//                initializr += " = new " + typeName + "()";
//            }
//            initializr += ";\n";
//            rets.add(initializr);
//        }
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
//                    System.err.println("pin prefix" + pinPrefix);
                    List<String> subreses = constructIO(pinPrefix, pin.getType(), insName, subFieldName, subIOS);
                    rets.addAll(subreses);
                } else if (pin.isAnnotationPresent(ListPins.class)){

                }
            }
        }

        //输出方法，增加返回值
//        if (!ioParameters.isIn){
//            rets.add("return " + fieldPrefix + ";\n");
//        }
        return rets;
    }

    private String constructSingleAssignment(String fieldFullName, Class<?> fieldType, String pinFullName, boolean isIn, boolean unsigned){
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
        } else if (fieldType.getCanonicalName().equals(String.class.getCanonicalName())) {
            if (isIn) {
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

    private boolean isInteger(Class<?> fieldType){
        String typeName = fieldType.getName();
        if (fieldType.isPrimitive()){
            return typeName.equals("int");
        }
        return typeName.equals("java.lang.Integer");
    }

    private boolean isLong(Class<?> fieldType){
        String typeName = fieldType.getName();
        if (fieldType.isPrimitive()){
            return typeName.equals("long");
        }
        return typeName.equals("java.lang.Long");
    }

    private boolean isByteArray(Class<?> fieldType){
        if (!fieldType.isArray()){
            return false;
        }

        return fieldType.getComponentType() == byte.class;
    }


    private Class<?> getClassFromTypeMirror(TypeMirror typeMirror) {
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

    private static class IOParameters{
        boolean isIn = true;
        boolean unsigned = true;
        boolean coveringUnsigned = false;
        boolean isPin = false;
        boolean isSon = false;


        public IOParameters copy() {
            IOParameters cloned = new IOParameters();
            cloned.coveringUnsigned = coveringUnsigned;
            cloned.isIn = isIn;
            cloned.unsigned = unsigned;
            cloned.isPin = isPin;
            cloned.isSon = isSon;
            return cloned;
        }
    }

    private static class ConstantNames{
        String instanceName;
        String clockManagerName;
        public ConstantNames(String instanceName, String clockManagerName){
            this.instanceName = instanceName;
            this.clockManagerName = clockManagerName;
        }
    }




}
