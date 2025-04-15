package org.xaspect;

import co.paralleluniverse.strands.SuspendableRunnable;
import com.squareup.javapoet.CodeBlock;
import com.squareup.javapoet.MethodSpec;
import com.squareup.javapoet.TypeSpec;

import javax.lang.model.element.TypeElement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface DUTManagerBuilder {

    String CLOCK_MANAGER_NAME="xclockManager";

    void buildConstructor(TypeSpec.Builder implClassBuilder, TypeElement dutManagerElement, AutoDUT dutInfo);

//    void buildStep(String term, MethodSpec.Builder methodBuilder);
//
//    void buildStep(MethodSpec.Builder methodBuilder);

    void buildGetDUT(MethodSpec.Builder methodBuilder);

//    void buildStart(MethodSpec.Builder methodBuilder);

//    void buildAddSuspendableRunnable(MethodSpec.Builder methodBuilder);

    void buildFinish(MethodSpec.Builder methodBuilder);

    default void buildGetXClockManager(MethodSpec.Builder methodBuilder){
        methodBuilder.addStatement("return this.$L", CLOCK_MANAGER_NAME);
    }

    void buildGetServiceRunner(MethodSpec.Builder methodBuilder);

    TypeSpec build(TypeSpec.Builder implClassBuilder);

    default CodeBlock defaultUtils(String instanceFieldName, AutoDUT dutInfo){
        CodeBlock.Builder builder = CodeBlock.builder();

        String clockName = dutInfo.clockName();
        if (!clockName.isEmpty()){
            builder.addStatement("this.$L.InitClock($S)", instanceFieldName, clockName);

//            initializeClockStr = "this." + instanceFieldName + ".InitClock(\"" + clockName + "\");";
        }
//
//        resetPinName = dutInfo.value() + dutInfo.resetName();
//        String resetStmt = "";
//        if (!resetPinName.isEmpty()){
//            resetStmt = "this.reset();";
//        }
//
        String fstSetStmt = "";
        String fstFileName = dutInfo.waveFileName();
        if (!fstFileName.isEmpty()){
            builder.addStatement("this.$L.SetWaveform($S)", instanceFieldName, fstFileName);
//            fstSetStmt = "this." + instanceFieldName + ".SetWaveform(\"" + fstFileName + "\");\n";
        }
//        builder.add(fstSetStmt);
        String covSetStmt = "";
        String covFileName = dutInfo.covFileName();
        if (!covFileName.isEmpty()){
            builder.addStatement("this.$L.SetCoverage($S)", instanceFieldName, covFileName);
//            covSetStmt = "this." + instanceFieldName + ".SetCoverage(\"" + covFileName + "\");\n";
        }
//        builder.add(covSetStmt);
        return builder.build();
    }
}
