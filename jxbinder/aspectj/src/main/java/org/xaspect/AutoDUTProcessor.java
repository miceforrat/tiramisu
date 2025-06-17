package org.xaspect;

import com.google.auto.service.AutoService;
import com.squareup.javapoet.*;

import javax.annotation.processing.*;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.*;
import javax.lang.model.type.*;
import javax.lang.model.util.Elements;
import java.io.IOException;
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
        return Set.of(AutoDUTDao.class.getCanonicalName(), AutoDUT.class.getCanonicalName());
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
//              only process class with 
                processFieldWithAutoDUTDao((VariableElement) element);
            }
        }

        for (Element element : roundEnv.getElementsAnnotatedWith(AutoDUT.class)) {
            if (element.getKind() == ElementKind.FIELD) {
                processFieldWithAutoDUT((VariableElement) element);
            }
        }
        return true;
    }

    public void processFieldWithAutoDUT(VariableElement field) {
        TypeElement fieldType = elementUtils.getTypeElement(field.asType().toString());
        String packageName = processingEnv.getElementUtils().getPackageOf(fieldType).getQualifiedName().toString();
        AutoDUT autoDUT = field.getAnnotation(AutoDUT.class);
        if (fieldType.getKind() != ElementKind.INTERFACE){
            throw new IllegalArgumentException("AutoDUT field must be an interface");
        }
        String implClassName = fieldType.getSimpleName() + "Impl";
        if (doesClassExist(packageName, implClassName)){
            System.err.println("Class " + implClassName + " already exists, skipping.");
            return;
        }

        AnnotationSpec annotation = AnnotationSpec.builder(AspectIgnore.class)
                .build();

        TypeSpec.Builder implClassBuilder = TypeSpec.classBuilder(implClassName)
                .addModifiers(Modifier.PUBLIC)
                .addAnnotation(annotation)
                .addSuperinterface(ClassName.get(fieldType));



        DUTManagerBuilder builder;
        System.err.println("parsing manager: " + field.asType().toString());
        if (TypeParserHelper.getInstance().directlyImplementsInterface(fieldType, DUTCoroutineManager.class)){
            builder = new DUTCoroutineManagerBuilder();
        } else {
            builder = new DUTNormalManagerBuilder();
        }

        TypeMirror managerGenerics = builder.buildConstructor(implClassBuilder, fieldType, autoDUT);
        Map<String, ExecutableElement> executableElementMap = TypeParserHelper.getInstance().collectAllMethods(fieldType);
        Set<String> processedMethods = new HashSet<>();
        for (ExecutableElement method : executableElementMap.values()) {
            String methodSignature = method.getSimpleName().toString() + method.getParameters();
            if (processedMethods.contains(methodSignature)) {
                continue;
            }
            processedMethods.add(methodSignature);

            // 获取方法名称、返回类型、参数类型等
            String methodName = method.getSimpleName().toString();
            TypeMirror returnType = method.getReturnType();

            MethodSpec.Builder methodBuilder = MethodSpec.methodBuilder(methodName)
                    .addModifiers(Modifier.PUBLIC);
//                    .returns(ClassName.get(returnType));

            // 添加返回值
            if (methodName.equals("getDUT")) {
                methodBuilder.returns(TypeName.get(managerGenerics));
            } else {
                methodBuilder.returns(TypeName.get(returnType));
            }

            //添加方法参数
            for (VariableElement parameter : method.getParameters()) {
                methodBuilder.addParameter(
                        TypeName.get(parameter.asType()),
                        parameter.getSimpleName().toString()
                );
            }
//            System.err.println(methodName);
            // 构造方法体
            if (method.getAnnotation(AutoDUTDao.class) != null) {
                String clsName = processMethodWithAutoDUTDao(method);
                builder.buildGetAutoDUTDao(implClassBuilder, clsName, methodBuilder);
            } else if (methodName.equals("finish")) {
                builder.buildFinish(methodBuilder);
            } else if (methodName.equals("getDUT")) {
                builder.buildGetDUT(methodBuilder);
            } else if (methodName.equals("getXClockManager")){
                builder.buildGetXClockManager(methodBuilder);
            }else if (methodName.equals("getServiceRunner")) {
                builder.buildGetServiceRunner(methodBuilder);
            } else {
                methodBuilder.addCode("System.out.println(\"Calling method: " + methodName + "\");\n");
                if (!returnType.toString().equals("void")) {
                    methodBuilder.addCode("return null; // Replace with actual implementation\n");
                }
            }
//                    methodBuilder.addCode(methodBody.toString());

            // 添加方法到实现类
            implClassBuilder.addMethod(methodBuilder.build());
        }
        JavaFile javaFile = JavaFile.builder(packageName, builder.build(implClassBuilder))
                .build();
//        System.err.println(javaFile);
        try {
            javaFile.writeTo(filer);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void processFieldWithAutoDUTDao(VariableElement field){
        TypeElement fieldType = elementUtils.getTypeElement(field.asType().toString());

        AutoDUTDao autoDUTDao = field.getAnnotation(AutoDUTDao.class);
        processFieldWithAutoDUTDao(fieldType, autoDUTDao);
    }

    private String processMethodWithAutoDUTDao(ExecutableElement method){
        TypeElement retVal = elementUtils.getTypeElement(method.getReturnType().toString());
        AutoDUTDao autoDUTDao = method.getAnnotation(AutoDUTDao.class);
        return processFieldWithAutoDUTDao(retVal, autoDUTDao);
    }

    private String processFieldWithAutoDUTDao(TypeElement fieldType, AutoDUTDao autoDUTDao) {
//        String fieldName = field.getSimpleName().toString();
        String packageName = processingEnv.getElementUtils().getPackageOf(fieldType).getQualifiedName().toString();
//        System.out.println(packageName);
        // 获取字段类型和注解信息
        String prefix = autoDUTDao.value();

        // 生成实现类名
        String implClassName = StringUtils.getDaoNameWithPrefixHash(fieldType.getSimpleName().toString(), prefix);
//                fieldType.getSimpleName() + "ImplWithPrefixHash";
//        if (prefix != null && !prefix.isEmpty()) {
//            int hashRes = prefix.hashCode();
//            implClassName += Integer.toUnsignedString(hashRes).charAt(0) + Integer.toString(hashRes).substring(1);
//        }
        String qualifiedName = packageName + "." + implClassName;
        if (doesClassExist(packageName, implClassName)){
            System.err.println("Class " + implClassName + " already exists, skipping.");
            return qualifiedName;
        }
        AnnotationSpec annotation = AnnotationSpec.builder(AspectIgnore.class)
                .build();
        // 构建实现类
        TypeSpec.Builder implClassBuilder = TypeSpec.classBuilder(implClassName)
                .addModifiers(Modifier.PUBLIC)
                .addAnnotation(annotation)
                .addSuperinterface(ClassName.get(fieldType));
        DUTDaoBuilder classBuilder;
//        if (builderType == ConcurrentSupport.SEPARATE_THREAD){
//            classBuilder = new SeparateThreadDUTClassBuilder();
//        } else {
        classBuilder = new NormalDUTDaoBuilder();

//        }
        classBuilder.buildConstructor(implClassBuilder, fieldType, autoDUTDao);
        // 添加字段和构造方法

        addMethodsToImplClass(implClassBuilder, fieldType, prefix, classBuilder);

        // 获取`@AutoDUT`修饰类的包路径
        // 写入生成的类到相同包路径
        JavaFile javaFile = JavaFile.builder(packageName, classBuilder.build(implClassBuilder))
                .build();
        try {
            javaFile.writeTo(filer);
        } catch (IOException e) {
            e.printStackTrace();
        }
        fullNameSet.add(qualifiedName);
        return qualifiedName;

    }

    private void addMethodsToImplClass(TypeSpec.Builder implClassBuilder, TypeElement fieldType, String prefix, DUTDaoBuilder clsBuilder) {
        Set<String> processedMethods = new HashSet<>(); // 防止重复处理同名方法
        // 遍历当前类型及其父类或接口
        Map<String, ExecutableElement> executableElementMap = TypeParserHelper.getInstance().collectAllMethods(fieldType);
//        for (TypeElement currentElement : getAllSuperTypes(fieldType, typeUtils)) {
        for (ExecutableElement method : executableElementMap.values()) {
//            if (enclosedElement.getKind() == ElementKind.METHOD) {
//                ExecutableElement method = (ExecutableElement) enclosedElement;
                if (method.getModifiers().contains(Modifier.DEFAULT)){
                    continue;
                }
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
//            }
//            }
        }
    }

    /**
     * 获取类型及其所有父类和接口
     */
//    private List<TypeElement> getAllSuperTypes(TypeElement type, Types typeUtils) {
//        List<TypeElement> result = new ArrayList<>();
//        Queue<TypeMirror> toProcess = new LinkedList<>();
//        toProcess.add(type.asType());
//
//        while (!toProcess.isEmpty()) {
//            TypeMirror current = toProcess.poll();
//            TypeElement currentElement = (TypeElement) typeUtils.asElement(current);
//            if (currentElement != null && !result.contains(currentElement)) {
//                result.add(currentElement);
//
//                // 添加直接父类
//                TypeMirror superclass = currentElement.getSuperclass();
//                if (superclass.getKind() != TypeKind.NONE) {
//                    toProcess.add(superclass);
//                }
//
//                // 添加直接接口
//                toProcess.addAll(currentElement.getInterfaces());
//            }
//        }
//        return result;
//    }

    Set<String> fullNameSet = new HashSet<>();

    private boolean doesClassExist(String packageName, String className) {
        String fullName = packageName + "." + className;
        if (fullNameSet.contains(fullName)) {
            return true;
        }

        if (processingEnv.getElementUtils().getTypeElement(fullName) != null){
            fullNameSet.add(fullName);
            return true;
        }
        return false;

    }
    




}
