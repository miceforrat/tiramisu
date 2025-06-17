package org.xaspect;

import com.squareup.javapoet.*;

import javax.lang.model.element.Modifier;
import javax.lang.model.element.TypeElement;
import javax.lang.model.type.TypeMirror;

public interface DUTManagerBuilder {

    String CLOCK_MANAGER_NAME="xclockManager";

    String DUT_INSTANCE_NAME="dutInstance";

    TypeMirror buildConstructor(TypeSpec.Builder implClassBuilder, TypeElement dutManagerElement, AutoDUT dutInfo);

//    void buildStep(String term, MethodSpec.Builder methodBuilder);
//
//    void buildStep(MethodSpec.Builder methodBuilder);

//    void buildStart(MethodSpec.Builder methodBuilder);

//    void buildAddSuspendableRunnable(MethodSpec.Builder methodBuilder);

    default void buildGetAutoDUTDao(TypeSpec.Builder implClassBuilder, String dutClsName, MethodSpec.Builder builder) {
        String daoFieldName = dutClsName.replace('.', '_') + "dao";

        // 1. 构造 ClassName 类型
        ClassName dutType = ClassName.bestGuess(dutClsName);

        // 2. 添加字段
        FieldSpec daoField = FieldSpec.builder(dutType, daoFieldName, Modifier.PRIVATE).build();
        implClassBuilder.addField(daoField);

        // 3. 添加方法体：判空 + 初始化
        builder.beginControlFlow("if (this.$N == null)", daoFieldName)
                .addStatement("this.$N = new $T()", daoFieldName, dutType) // 你可以后续自定义替换这里
                 .addStatement("this.$N.bind($N)", daoFieldName, DUT_INSTANCE_NAME)       // 扩展处理放这里
                .endControlFlow();

        builder.addStatement("return this.$N", daoFieldName);
    }

    default void buildGetDUT(MethodSpec.Builder methodBuilder) {
        methodBuilder.addStatement("return $N", DUT_INSTANCE_NAME);
    }


    void buildFinish(MethodSpec.Builder methodBuilder);

    default void buildGetXClockManager(MethodSpec.Builder methodBuilder){
        methodBuilder.addStatement("return this.$L", CLOCK_MANAGER_NAME);
    }

    void buildGetServiceRunner(MethodSpec.Builder methodBuilder);

    TypeSpec build(TypeSpec.Builder implClassBuilder);

    default CodeBlock defaultUtils(AutoDUT dutInfo){
        CodeBlock.Builder builder = CodeBlock.builder();

        String clockName = dutInfo.clockName();
        if (!clockName.isEmpty()){
            builder.addStatement("this.$L.InitClock($S)", DUT_INSTANCE_NAME, clockName);

//            initializeClockStr = "this." + instanceFieldName + ".InitClock(\"" + clockName + "\");";
        }
//
//        resetPinName = dutInfo.value() + dutInfo.resetName();
//        String resetStmt = "";
//        if (!resetPinName.isEmpty()){
//            resetStmt = "this.reset();";
//        }
//
        String fstFileName = dutInfo.waveFileName();
        if (!fstFileName.isEmpty()){
            builder.addStatement("this.$L.SetWaveform($S)", DUT_INSTANCE_NAME, fstFileName);
//            fstSetStmt = "this." + instanceFieldName + ".SetWaveform(\"" + fstFileName + "\");\n";
        }
//        builder.add(fstSetStmt);
        String covFileName = dutInfo.covFileName();
        if (!covFileName.isEmpty()){
            builder.addStatement("this.$L.SetCoverage($S)", DUT_INSTANCE_NAME, covFileName);
//            covSetStmt = "this." + instanceFieldName + ".SetCoverage(\"" + covFileName + "\");\n";
        }

        String[] imms = dutInfo.immediatePins();
        String[] immInitials = dutInfo.immPinInitials();
        if (imms.length > 0){
            if (immInitials.length != imms.length){
                throw new IllegalArgumentException("immediates must have the same length");
            }

            for (int i = 0; i < immInitials.length; i++){
                builder.addStatement("this.$N.$N.AsImmWrite()", DUT_INSTANCE_NAME, imms[i])
                        .addStatement("this.$N.$N.Set($L)", DUT_INSTANCE_NAME, imms[i], immInitials[i]);
            }
        }

        String resetName = dutInfo.resetName();
        if (!resetName.isEmpty()){
            builder.addStatement("this.$N.$L.Set($L)", DUT_INSTANCE_NAME, resetName, dutInfo.resetValue())
                    .addStatement("this.$N.Step()", DUT_INSTANCE_NAME)
                    .addStatement("this.$N.$L.Set($L)", DUT_INSTANCE_NAME, resetName, dutInfo.banResetValue());
        }


//        builder.add(covSetStmt);
        return builder.build();
    }
}
