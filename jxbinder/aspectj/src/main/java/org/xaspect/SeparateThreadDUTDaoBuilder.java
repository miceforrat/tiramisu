package org.xaspect;

import com.squareup.javapoet.MethodSpec;
import com.squareup.javapoet.TypeName;
import com.squareup.javapoet.TypeSpec;

import javax.lang.model.element.ExecutableElement;
import javax.lang.model.element.Modifier;
import javax.lang.model.element.TypeElement;
import javax.lang.model.element.VariableElement;
import java.util.*;

import static org.xaspect.DUTBindingTool.*;


public class SeparateThreadDUTDaoBuilder implements DUTDaoBuilder {

    private String instanceFieldName;

    private static final String WAITER_CNT_VAR_NAME = "WAITERS";

    private static final String RUNNING_STATUS_VAR_NAME = "running";

    private static final String REQ_BLOCKING_QUEUE_VAR_NAME = "reqs";

    private static final String SEMAPHORE_MAP_VAR_NAME = "semaphoreMap";

    private static final String CONSUMER_MAP_VAR_NAME = "consumerMap";

    private static final String WAIT_ON_STEPS = "waitOnSteps";

    private int spareEventIdx = 2; // 0 for nothing and 1 for step, other events are for input event

    private Map<String, MethodSpec> outFunctionNames = new HashMap<>();

    private static final String OUT_VALUE_BUNDLES = "outValueMap";

    private String resetPinName = "";


    @Override
    public void buildReset(MethodSpec.Builder methodBuilder) {
        if (!resetPinName.isEmpty()) {

            methodBuilder.addCode("if (!$N.containsKey("+spareEventIdx + " )){\n" +
                    "            $N.put(" + spareEventIdx +", reqx -> {\n" +
                    "               this.$N.$N.Set(1);\n" +
                    "            });\n" +
                    "        } ", CONSUMER_MAP_VAR_NAME, CONSUMER_MAP_VAR_NAME, instanceFieldName, resetPinName);

            methodBuilder.addCode("$T<?> req = new $T<Void>(" + spareEventIdx +");\n", DUTReq.class, DUTReq.class)
                    .addCode("$N.add(req);\n", REQ_BLOCKING_QUEUE_VAR_NAME);

            spareEventIdx += 1;
        }
    }

    @Override
    public void buildBind(MethodSpec.Builder methodBuilder, ExecutableElement method) {

    }

    @Override
    public void buildConstructor(TypeSpec.Builder implClassBuilder, TypeElement typeElement, AutoDUTDao dutInfo) {
//        String dutId = dutInfo.id();

//        TypeName typeName = DUTBindingTool.getTypeNameFromTypeElement(typeElement);
//        this.instanceFieldName = typeName.toString().replace(".", "") + "Instance";
//        FieldSpec dutField = FieldSpec.builder(typeName, instanceFieldName, Modifier.PRIVATE)
//                .build();
//        implClassBuilder.addField(dutField);
//
//
//        int waitersCnt = 1;
//        FieldSpec waiterCntField = FieldSpec.builder(TypeName.INT, WAITER_CNT_VAR_NAME, Modifier.PRIVATE)
//                .initializer(String.valueOf(waitersCnt))
//                .build();
//        implClassBuilder.addField(waiterCntField);
//
//
//        FieldSpec waiterOnStepField = FieldSpec.builder(TypeName.INT, WAIT_ON_STEPS, Modifier.PRIVATE)
//                .initializer("0")
//                .build();
//        implClassBuilder.addField(waiterOnStepField);
//
//        FieldSpec runningStatus = FieldSpec.builder(TypeName.BOOLEAN, RUNNING_STATUS_VAR_NAME, Modifier.PRIVATE)
//                .initializer("true")
//                .build();
//        implClassBuilder.addField(runningStatus);
//
//        ParameterizedTypeName blockingQueueOfDUTReq = ParameterizedTypeName.get(
//                ClassName.get(BlockingQueue.class),
//                ClassName.get(DUTReq.class)
//        );
//
//        FieldSpec reqBlockingQueue = FieldSpec.builder(blockingQueueOfDUTReq, REQ_BLOCKING_QUEUE_VAR_NAME, Modifier.PRIVATE)
//                .initializer("new $T<>()", LinkedBlockingQueue.class)
//                .build();
//        implClassBuilder.addField(reqBlockingQueue);
//
//        ParameterizedTypeName INTMapOfSemaphore = ParameterizedTypeName.get(
//                ClassName.get(Map.class),
//                ClassName.get(Integer.class),
//                ClassName.get(Semaphore.class)
//        );
//
//        FieldSpec semMap = FieldSpec.builder(INTMapOfSemaphore, SEMAPHORE_MAP_VAR_NAME, Modifier.PRIVATE)
//                .initializer("new $T<>()", HashMap.class)
//                .build();
//        implClassBuilder.addField(semMap);
//
//        ParameterizedTypeName INTMapOfDUTConsumer = ParameterizedTypeName.get(
//                ClassName.get(Map.class),
//                ClassName.get(Integer.class),
//                ClassName.get(DUTConsumer.class)
//        );
//
//        FieldSpec consumerMap = FieldSpec.builder(INTMapOfDUTConsumer, CONSUMER_MAP_VAR_NAME, Modifier.PRIVATE)
//                .initializer("new $T<>()", HashMap.class)
//                .build();
//        implClassBuilder.addField(consumerMap);
//
//        ParameterizedTypeName StringMapOfObj= ParameterizedTypeName.get(
//                ClassName.get(Map.class),
//                ClassName.get(String.class),
//                ClassName.get(Object.class)
//        );
//
//        FieldSpec outValMap = FieldSpec.builder(StringMapOfObj, OUT_VALUE_BUNDLES, Modifier.PRIVATE)
//                .initializer("new $T<>()", HashMap.class)
//                .build();
//        implClassBuilder.addField(outValMap);
//
//        String initializeClockStr = "";
//
//        String clockName = dutInfo.value() + dutInfo.clockName();
//        if (!clockName.isEmpty()){
//            initializeClockStr = "this." + instanceFieldName + ".InitClock(\"" + clockName + "\");";
//        }
//
//        resetPinName = dutInfo.value() + dutInfo.resetName();
//        String resetStmt = "";
//        if (!resetPinName.isEmpty()){
//            resetStmt = "this." + instanceFieldName + "." + resetPinName+".Set(1);\n";
//        }
//
//        String fstSetStmt = "";
//        String fstFileName = dutInfo.waveFileName();
//        if (!fstFileName.isEmpty()){
//            fstSetStmt = "this." + instanceFieldName + ".SetWaveform(\"" + fstFileName + "\");\n";
//        }
//
//        String covSetStmt = "";
//        String covFileName = dutInfo.covFileName();
//        if (!covFileName.isEmpty()){
//            covSetStmt = "this." + instanceFieldName + ".SetCoverage(\"" + covFileName + "\");\n";
//        }
//
//
//        implClassBuilder.addMethod(MethodSpec.constructorBuilder()
//                .addModifiers(Modifier.PUBLIC)
//                .addCode("$N.put(1, new $T(0));\n", SEMAPHORE_MAP_VAR_NAME, Semaphore.class)
//                .addCode("$N.put(1, req -> {\n" +
//                        "$N += 1;\n" +
//                        "if ($N >= WAITERS) {" +
//                        "   $N.Step();\n" +
//                        "   this.AfterStep();\n" +
//                        "   $N.get(1).release(WAITERS);\n}\n" +
//                        "});\n", CONSUMER_MAP_VAR_NAME,  WAIT_ON_STEPS, WAIT_ON_STEPS, instanceFieldName, SEMAPHORE_MAP_VAR_NAME)
//                .addCode("$N.put(0, req -> {\n" +
//                        "\n" +
//                        "}\n);", CONSUMER_MAP_VAR_NAME)
//                .addCode("Thread aluThread = new Thread(() -> {\n" +
//                        "     $N = new $T();\n" + initializeClockStr + resetStmt + fstSetStmt + covSetStmt +
//                        "     while (running) {\n" +
//                        "         try {\n" +
//                        "             $T<?> req = reqs.take();\n" +
//                        "             $N.get(req.event).dealWithReq(req);\n" +
//                        "         } catch (InterruptedException  e) {\n" +
//                        "              e.printStackTrace();\n" +
//                        "         }\n" +
//                        "     }\n" +
//                        "     $N.Finish();\n" +
//                        " });\n" +
//                        " aluThread.start();", instanceFieldName, typeName, DUTReq.class, CONSUMER_MAP_VAR_NAME, instanceFieldName).build());
    }


    @Override
    public void buildFinish(MethodSpec.Builder methodBuilder) {
        methodBuilder.addCode("this.$N= false;\n", RUNNING_STATUS_VAR_NAME)
                .addCode("this.$N.add(new $T(0));", REQ_BLOCKING_QUEUE_VAR_NAME, DUTReq.class);
    }

    @Override
    public void buildStep(String term, MethodSpec.Builder methodBuilder) {
        methodBuilder.addCode("for (int i = 0; i < $N; i++){\n" +
                "     this.Step();\n" +
                "}", term);
    }

    @Override
    public void buildStep(MethodSpec.Builder methodBuilder) {
        methodBuilder.addCode("$T<?> req = new $T<Void>(1);\n", DUTReq.class, DUTReq.class)
                .addCode("$N.add(req);\n", REQ_BLOCKING_QUEUE_VAR_NAME)
                .addCode(
                "        try {\n" +
                "            $N.get(1).acquire();\n" +
                "        } catch (InterruptedException e) {\n" +
                "            throw new RuntimeException(e);\n" +
                "        }", SEMAPHORE_MAP_VAR_NAME);
    }

    @Override
    public void buildGetMethod(MethodSpec.Builder methodBuilder, String prefix, ExecutableElement method) {
        String getPrefix = prefix + method.getAnnotation(GetMethod.class).prefix();
        String methodName = method.getSimpleName().toString();
        String outerName = getOutBundleByRaw(methodName);
        MethodSpec.Builder afterStepBuilder = MethodSpec.methodBuilder(getAfterStepFunctionNameByRaw(methodName)).addModifiers(Modifier.PUBLIC).returns(TypeName.VOID);
        List<String> res = constructGetMethod(method, getPrefix, new InstanceDUTTypeInfo(instanceFieldName, null), outerName);
        res.forEach(afterStepBuilder::addCode);
        afterStepBuilder.addCode("this.$N.put(\"" + methodName +"\", $N);\n", OUT_VALUE_BUNDLES, outerName);

        outFunctionNames.put(methodName, afterStepBuilder.build());

        methodBuilder.addCode("return ($T)this.$N.get(\"" + methodName + "\");\n", TypeParserHelper.getInstance().getClassFromTypeMirror(method.getReturnType()), OUT_VALUE_BUNDLES);
    }
    private String getOutBundleByRaw(String raw){
        return raw + "outBundle";
    }
    private String getAfterStepFunctionNameByRaw(String raw){
        return raw + "AfterStep";
    }

    @Override
    public void buildPostMethod(MethodSpec.Builder methodBuilder, String prefix, ExecutableElement method) {
        String postPrefix = prefix + method.getAnnotation(PostMethod.class).prefix();
        List<String> outsideTasks = new ArrayList<>();
        List<? extends VariableElement> params = method.getParameters();
        int curIdx = this.spareEventIdx;
        methodBuilder.addCode(" if (!$N.containsKey(" + curIdx +")){\n", CONSUMER_MAP_VAR_NAME)
                .addCode("$N.put(" + curIdx +", req -> {\n", CONSUMER_MAP_VAR_NAME)
                .addCode("Map<Integer, Object> paramMap = (HashMap) req.result;", Map.class, HashMap.class);
        outsideTasks.add("DUTReq<Map<Integer, Object>> req = new DUTReq<>(" + curIdx +");\n" +
                "req.result = new HashMap<>();\n");
        int paramIdx = 0;
        for (VariableElement param : params) {
            //获取公用前缀
            String inputBundleName = param.getSimpleName().toString();
            outsideTasks.add("req.result.put(" + paramIdx + "," + inputBundleName + ");\n");
            Class<?> paramTypeName = TypeParserHelper.getInstance().getClassFromTypeMirror(param.asType());

            String trueBundleName = inputBundleName + paramIdx;

            methodBuilder.addCode("$T $N = ($T) paramMap.get(" + paramIdx + ");\n", paramTypeName, trueBundleName, paramTypeName);
            constructOneParamBinding(postPrefix, param, trueBundleName, new InstanceDUTTypeInfo(instanceFieldName, null)).forEach(methodBuilder::addCode);
            paramIdx++;
        }
        methodBuilder.addCode("});\n}");
        outsideTasks.forEach(methodBuilder::addCode);
        methodBuilder.addCode("$N.add(req);\n", REQ_BLOCKING_QUEUE_VAR_NAME);


        spareEventIdx += 1;
    }

    @Override
    public TypeSpec build(TypeSpec.Builder implClassBuilder) {
        MethodSpec.Builder builder = MethodSpec.methodBuilder("AfterStep").addModifiers(Modifier.PUBLIC).returns(TypeName.VOID);
        for (String outFunction: outFunctionNames.keySet()) {
            builder.addCode("$N();\n", getAfterStepFunctionNameByRaw(outFunction));
            implClassBuilder.addMethod(outFunctionNames.get(outFunction));
        }
        implClassBuilder.addMethod(builder.build());
//        implClassBuilder.addMethod(constructorBuilder.build());


        return implClassBuilder.build();
    }
}
