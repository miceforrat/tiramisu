package org.xaspect;

import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.fibers.FiberScheduler;
import com.squareup.javapoet.*;
import org.xaspect.services.ServiceRunner;
import org.xaspect.services.XClockCoroutineManager;
import org.xaspect.services.XClockManagerFactory;

import javax.lang.model.element.Modifier;
import javax.lang.model.element.TypeElement;
import javax.lang.model.type.TypeMirror;
import java.util.concurrent.ExecutionException;

public class DUTCoroutineManagerBuilder implements DUTManagerBuilder {

    private String instanceFieldName;

    private static final String SERVICE_RUNNER_NAME = "serviceRunner";

    private static final String SINGLE_THREAD_EXECUTOR_SERVICE_NAME = "singleThreadExecutorScheduler";

    @Override
    public void buildConstructor(TypeSpec.Builder implClassBuilder, TypeElement dutManagerElement, AutoDUT dutInfo) {
        implClassBuilder.addJavadoc("⚠ This class depends on the Quasar runtime.\n" +
                "Ensure your project includes the following dependency:\n\n" +
                "        <dependency>\n" +
                "            <groupId>co.paralleluniverse</groupId>\n" +
                "            <artifactId>quasar-core</artifactId>\n" +
                "            <version>0.8.0</version>\n" +
                "        </dependency>" +
                "        also, add java agent of quasar to your test argLine if needed" +
                "See: https://github.com/puniverse/quasar");

        // 1. 提取类型
        TypeMirror mirror = DUTBindingTool.getInheritingType(dutManagerElement, DUTManager.class);
        TypeName dutTypeName = TypeName.get(mirror);
        String dutNameRemovePoint = dutTypeName.toString().replace(".", "");
        instanceFieldName = dutNameRemovePoint + "Instance";

        // 2. 添加字段：DUT 实例
        FieldSpec dutField = FieldSpec.builder(dutTypeName, instanceFieldName, Modifier.PRIVATE)
                .build();
        implClassBuilder.addField(dutField);

        FieldSpec executorField = FieldSpec.builder(SingleThreadExecutorScheduler.class, SINGLE_THREAD_EXECUTOR_SERVICE_NAME, Modifier.PRIVATE)
                .initializer("$T.get$L($S)", SingleThreadExecutorScheduler.class, SingleThreadExecutorScheduler.class.getSimpleName(), dutNameRemovePoint)
                .build();
        implClassBuilder.addField(executorField);

        final String SCHEDULER_NAME = "scheduler";

        FieldSpec schedulerField = FieldSpec.builder(FiberScheduler.class, SCHEDULER_NAME, Modifier.PRIVATE)
                .initializer("$N.getScheduler()", SINGLE_THREAD_EXECUTOR_SERVICE_NAME)
                .build();
        implClassBuilder.addField(schedulerField);

        FieldSpec clockManagerField = FieldSpec.builder(XClockCoroutineManager.class, CLOCK_MANAGER_NAME, Modifier.PRIVATE)
                .build();
        implClassBuilder.addField(clockManagerField);

        FieldSpec serviceRunnerField = FieldSpec.builder(ServiceRunner.class, SERVICE_RUNNER_NAME, Modifier.PRIVATE).build();
        implClassBuilder.addField(serviceRunnerField);

        MethodSpec constructor = MethodSpec.constructorBuilder()
                .addModifiers(Modifier.PUBLIC)
                .addCode(CodeBlock.builder()
                        .addStatement("$T<?> creator = new $T<>(scheduler, () -> {", Fiber.class, Fiber.class)
                        .indent()
                        .addStatement("$L = new $T()", instanceFieldName, dutTypeName)
                        .addStatement("System.err.println(Thread.currentThread().getName())")
                        .addStatement("$N = $T.getXClockCoroutineManager($N.xclock, $N)", CLOCK_MANAGER_NAME, XClockManagerFactory.class, instanceFieldName, SCHEDULER_NAME)
                        .addStatement("$N = new $T($N, $N)", SERVICE_RUNNER_NAME, ServiceRunner.class, CLOCK_MANAGER_NAME, SCHEDULER_NAME)
                        .add(defaultUtils(instanceFieldName, dutInfo))
                        .unindent()
                        .addStatement("}).start()")
                        .beginControlFlow("try")
                        .addStatement("creator.join()")
                        .nextControlFlow("catch ($T | $T e)", ExecutionException.class, InterruptedException.class)
                        .addStatement("throw new RuntimeException(e)")
                        .endControlFlow()
                        .build())
                .build();
        implClassBuilder.addMethod(constructor);
    }

    @Override
    public void buildGetDUT(MethodSpec.Builder methodBuilder) {
        methodBuilder.addStatement("return $N", instanceFieldName);
    }

    @Override
    public void buildFinish(MethodSpec.Builder methodBuilder) {
        String finisherName = "finisher";
        methodBuilder.addCode(CodeBlock.builder()
                .addStatement("$T<?> $N = new $T<>(scheduler, () -> {", Fiber.class, finisherName, Fiber.class)
                .indent()
                .addStatement("$N.Finish()", instanceFieldName)
                .unindent()
                .addStatement("}).start()")
                .beginControlFlow("try")
                .addStatement("$N.join()", finisherName)
                .nextControlFlow("catch ($T | $T e)", ExecutionException.class, InterruptedException.class)
                .addStatement("throw new RuntimeException(e)")
                .endControlFlow()
                .addStatement("$N.finish()", SINGLE_THREAD_EXECUTOR_SERVICE_NAME)
                .build());
    }

    @Override
    public void buildGetServiceRunner(MethodSpec.Builder methodBuilder) {
        methodBuilder.addStatement("return $N", SERVICE_RUNNER_NAME);
    }

    @Override
    public TypeSpec build(TypeSpec.Builder implClassBuilder) {
        return implClassBuilder.build();
    }
}
