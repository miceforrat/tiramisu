package org.xaspect;

import com.google.auto.service.AutoService;
import com.squareup.javapoet.*;

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
    }

    @Override
    public Set<String> getSupportedAnnotationTypes() {
        return Collections.singleton(AutoDUT.class.getCanonicalName());
    }

    @Override
    public SourceVersion getSupportedSourceVersion() {
        return SourceVersion.latestSupported();
    }

    @Override
    public boolean process(Set<? extends TypeElement> annotations, RoundEnvironment roundEnv) {
        for (Element element : roundEnv.getElementsAnnotatedWith(AutoDUT.class)) {
            if (element.getKind() == ElementKind.FIELD) {
                processField((VariableElement) element);
            }
        }
        return true;
    }

    private void processField(VariableElement field) {
//        String fieldName = field.getSimpleName().toString();
        TypeElement fieldType = elementUtils.getTypeElement(field.asType().toString());
        System.out.println(field.asType());
        TypeMirror dutType = getInheritingDUTWrapperType(fieldType);
        TypeName dutTypeName = ClassName.bestGuess(dutType.toString());
        String packageName = processingEnv.getElementUtils().getPackageOf(fieldType).getQualifiedName().toString();
        System.out.println(packageName);
        // 获取字段类型和注解信息
        AutoDUT autoDUT = field.getAnnotation(AutoDUT.class);
        String prefix = autoDUT.value();
        String dutId = autoDUT.id();

        // 生成实现类名
        String implClassName = fieldType.getSimpleName() + "Impl" + dutId;
        System.out.println(implClassName);
        if (doesClassExist(packageName, implClassName)){
            System.out.println("Class " + implClassName + " already exists, skipping.");
            return;
        }

        AnnotationSpec annotation = AnnotationSpec.builder(AspectIgnore.class)
                .build();
        // 构建实现类
        TypeSpec.Builder implClassBuilder = TypeSpec.classBuilder(implClassName)
                .addModifiers(Modifier.PUBLIC)
                .addAnnotation(annotation)
                .addSuperinterface(ClassName.get(fieldType));

        // 添加字段和构造方法
        String instanceFieldName = "dutInstance" + dutId;
        FieldSpec dutField = FieldSpec.builder(dutTypeName, instanceFieldName, Modifier.PRIVATE)
                .build();
        implClassBuilder.addField(dutField);


        MethodSpec constructor = MethodSpec.constructorBuilder()
                .addModifiers(Modifier.PUBLIC)
                .addStatement("this.$N = new $T()", instanceFieldName, dutTypeName)
                .build();
        implClassBuilder.addMethod(constructor);

        addMethodsToImplClass(implClassBuilder, fieldType, instanceFieldName, prefix);


        // 动态实现方法（可以补充具体逻辑）

        // 获取`@AutoDUT`修饰类的包路径
        // 写入生成的类到相同包路径
        JavaFile javaFile = JavaFile.builder(packageName, implClassBuilder.build())
                .build();

        try {
            javaFile.writeTo(filer);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private TypeMirror getInheritingDUTWrapperType(TypeElement fieldType) {
        Types typeUtils = processingEnv.getTypeUtils();
        Elements elementUtils = processingEnv.getElementUtils();

        // 获取 DUTWrapper 的类型
        TypeElement dutWrapperElement = elementUtils.getTypeElement(DUTWrapper.class.getCanonicalName()); // 替换为 DUTWrapper 的全限定名
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
                        // 检查泛型参数是否符合预期
//                        TypeMirror genericArgument = declaredType.getTypeArguments().get(0);
                        // 添加更多泛型验证逻辑（如果需要）
                        return declaredType.getTypeArguments().get(0);
                    } else {
                        throw new IllegalStateException("DUTWrapper interface must have exactly one type argument");
                    }
                }
            }
        }
        throw new IllegalStateException("not extends from DUTWrapper");
    }

    private void addMethodsToImplClass(TypeSpec.Builder implClassBuilder, TypeElement fieldType, String instanceFieldName, String prefix) {
        for (Element enclosedElement : fieldType.getEnclosedElements()) {
            if (enclosedElement.getKind() == ElementKind.METHOD) {
                ExecutableElement method = (ExecutableElement) enclosedElement;

                // 获取方法名称、返回类型、参数类型等
                String methodName = method.getSimpleName().toString();
                TypeMirror returnType = method.getReturnType();

                MethodSpec.Builder methodBuilder = MethodSpec.methodBuilder(methodName)
                        .addModifiers(Modifier.PUBLIC)
                        .returns(ClassName.get(returnType));

                // 添加方法参数
                for (VariableElement parameter : method.getParameters()) {
                    methodBuilder.addParameter(
                            ClassName.get(parameter.asType()),
                            parameter.getSimpleName().toString()
                    );
                }

                //构造方法体
                StringBuilder methodBody = new StringBuilder();
                if (method.getAnnotation(AgentMethod.class) != null) {
                    List<? extends VariableElement> params = method.getParameters();

                    //校验参数量
                    if (params.size() != 2 && params.size() != 1) {
                        throw new IllegalStateException("DUT method must have exactly two parameters or one parameter!");
                    }

                    //获取公用前缀
                    String withMethodPrefix = prefix + method.getAnnotation(AgentMethod.class).value();
                    String inputBundleName = params.get(0).getSimpleName().toString();
                    String waitingTimeName = "";
                    if (params.size() == 2) {

                        if (!isInteger(getClassFromTypeMirror(params.get(1).asType()))) {
                            throw new IllegalStateException("if DUT agent method has two parameters, the second one must be an integer showing the cycles to step!");
                        }

                        waitingTimeName = params.get(1).getSimpleName().toString();
                    }

                    IOParameters ios = new IOParameters();
                    ios.isIn = true;
                    String inputPrefix = withMethodPrefix;
//                    ios.isPin = hasAnnotationSelf(params.get(0).getAnnotationMirrors(), Pin.class.getCanonicalName());
                    Annotation innerPinAnnotation = getAnnotationFromType(params.get(0).asType(), Pin.class);

                    ios.isPin = innerPinAnnotation != null;
                    Annotation innerBundleAnnotation = getAnnotationFromType(params.get(0).asType(), InBundle.class);
                    //更新前缀和unsigned设置
                    if (innerBundleAnnotation != null) {
                        InBundle inBundle = (InBundle) innerBundleAnnotation;
                        inputPrefix += inBundle.value();
                        ios.coveringUnsigned = inBundle.coveringUnsigned();
                        ios.unsigned = inBundle.unsigned();
                    } else if (innerPinAnnotation != null) {
                        inputPrefix += ((Pin) innerPinAnnotation).value();
                        ios.unsigned = ((Pin) innerPinAnnotation).unsigned();
                    }

                    List<String> inputsAssigns = constructIO(inputPrefix, getClassFromTypeMirror(params.get(0).asType()), instanceFieldName, inputBundleName, ios);
                    for (String inputAssign : inputsAssigns) {
                        methodBody.append(inputAssign);
                    }

                    //构造时钟步进
                    // TODO： 加入异步化代码
                    String stepSentence = "this." + instanceFieldName + ".Step("+waitingTimeName + ");\n";
                    methodBody.append(stepSentence);

                    String outputPrefix = withMethodPrefix;

                    ios.isIn = false;
                    Annotation outerPinAnnotation = getAnnotationFromType(method.getReturnType(), Pin.class);
                    System.err.println(ios.isPin);
                    Annotation outerBundleAnnotation = getAnnotationFromType(method.getReturnType(), OutBundle.class);
                    if (outerBundleAnnotation != null) {
                        OutBundle outerBundle = (OutBundle) outerBundleAnnotation;
                        outputPrefix += outerBundle.value();
                        ios.coveringUnsigned = outerBundle.coveringUnsigned();
                        ios.unsigned = outerBundle.unsigned();
                    } else if (outerPinAnnotation != null){
                        outputPrefix += ((Pin) outerPinAnnotation).value();
                    }
                    ios.isPin = outerPinAnnotation != null;

                    String outerName = "ret" + inputBundleName.substring(0, 1).toUpperCase() + inputBundleName.substring(1);
                    System.err.println(outerName);
                    List<String> outputAssigns = constructIO(outputPrefix, getClassFromTypeMirror(method.getReturnType()), instanceFieldName, outerName, ios);

                    for (String outputAssign : outputAssigns) {
                        methodBody.append(outputAssign);
                    }


                } else {
                    // 构造方法体
                    methodBody.append("System.out.println(\"Calling method: ").append(methodName).append("\");\n");
                    if (!returnType.toString().equals("void")) {
                        methodBody.append("return null; // Replace with actual implementation\n");
                    }
                }
                methodBuilder.addCode(methodBody.toString());

                // 添加方法到实现类
                implClassBuilder.addMethod(methodBuilder.build());
            }
        }
    }

    private boolean doesClassExist(String packageName, String className) {
        String resourcePath = packageName.replace('.', '/') + "/" + className + ".java";
        try {
            processingEnv.getFiler().getResource(StandardLocation.SOURCE_OUTPUT, "", resourcePath);
            return true; // 文件已存在
        } catch (IOException e) {
            return false; // 文件不存在，可以生成
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
        String typeName = dataClass.getTypeName();
        String fieldPrefix;
        fieldPrefix = IOName;

        //如果是输出，初始化待返回结果
        if ((!ioParameters.isIn) && (!ioParameters.isSon)) {
            String initializr = typeName + " " + fieldPrefix ;
            if (!ioParameters.isPin) {
                initializr += " = new " + typeName + "()";
            }
            initializr += ";\n";
            rets.add(initializr);
            System.err.println(initializr);
        }

        if (ioParameters.isPin) {
            String trueInsPin = "this." + insName + "." + prefix;
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

                    String trueInsPin = "this." + insName + "." + prefix + pinName;
                    String dataWrapperVar = fieldPrefix + "." + varName;
                    rets.add(constructSingleAssignment(dataWrapperVar, pin.getType(), trueInsPin, ioParameters.isIn, unsignedPin));
                } else if (pin.isAnnotationPresent(SubBundle.class)) {
                    String subFieldName = fieldPrefix + "." + pin.getName();
                    IOParameters subIOS = ioParameters.copy();
                    subIOS.isSon = true;
                    String pinPrefix = prefix + pin.getAnnotation(SubBundle.class).value();
                    List<String> subreses = constructIO(pinPrefix, pin.getType(), insName, subFieldName, subIOS);
                    rets.addAll(subreses);
                }
            }
        }

        //输出方法，增加返回值
        if (!ioParameters.isIn){
            rets.add("return " + fieldPrefix + ";\n");
        }
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




}
