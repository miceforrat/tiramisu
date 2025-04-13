package org.xaspect;

import com.squareup.javapoet.FieldSpec;
import com.squareup.javapoet.MethodSpec;
import com.squareup.javapoet.TypeName;
import com.squareup.javapoet.TypeSpec;

import javax.lang.model.element.Modifier;
import javax.lang.model.element.TypeElement;
import javax.lang.model.type.TypeMirror;

public class DUTManagerNormalBuilder implements DUTManagerBuilder {

    private String instanceFieldName = "";

    @Override
    public void buildConstructor(TypeSpec.Builder implClassBuilder, TypeElement dutManagerElement, AutoDUT dutInfo) {
        TypeMirror mirror = DUTBindingTool.getInheritingType(dutManagerElement, DUTManager.class);
        TypeName dutTypeName = TypeName.get(mirror);
        this.instanceFieldName = dutTypeName.toString().replace(".", "") + "Instance";
        FieldSpec dutField = FieldSpec.builder(dutTypeName, instanceFieldName, Modifier.PRIVATE)
                .initializer("new $T()", dutTypeName)
                .build();
        implClassBuilder.addField(dutField);
        String initializeClockStr = "";

        String clockName = dutInfo.clockName();
        if (!clockName.isEmpty()){
            initializeClockStr = "this." + instanceFieldName + ".InitClock(\"" + clockName + "\");";
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
            fstSetStmt = "this." + instanceFieldName + ".SetWaveform(\"" + fstFileName + "\");\n";
        }
        String covSetStmt = "";
        String covFileName = dutInfo.covFileName();
        if (!covFileName.isEmpty()){
            covSetStmt = "this." + instanceFieldName + ".SetCoverage(\"" + covFileName + "\");\n";
        }

        MethodSpec constructor = MethodSpec.constructorBuilder()
                .addModifiers(Modifier.PUBLIC)
                .addStatement(initializeClockStr)
//                .addStatement(resetStmt)
                .addStatement(fstSetStmt)
                .addStatement(covSetStmt)
                .build();
        implClassBuilder.addMethod(constructor);
    }

    @Override
    public void buildStep(String term, MethodSpec.Builder methodBuilder) {
        methodBuilder.addCode("this." + instanceFieldName + ".Step(" + term + ");\n");
    }

    @Override
    public void buildStep(MethodSpec.Builder methodBuilder) {
        methodBuilder.addCode("this." + instanceFieldName + ".Step();\n");
    }

    @Override
    public void buildGetDUT(MethodSpec.Builder methodBuilder) {
        methodBuilder.addStatement("return $L", instanceFieldName);
    }

    @Override
    public void buildStart(MethodSpec.Builder methodBuilder) {
        throw new UnsupportedOperationException("normal dut manager does not support start(), please do not claim this method signature");
    }

    @Override
    public void buildAddSuspendableRunnable(MethodSpec.Builder methodBuilder) {
        throw new UnsupportedOperationException("normal dut manager does not support addSuspendableRunnable(), please do not claim this method signature");
    }

    @Override
    public void buildFinish(MethodSpec.Builder methodBuilder) {
        methodBuilder.addCode("this." + instanceFieldName + ".Finish();\n");
    }

    @Override
    public TypeSpec build(TypeSpec.Builder implClassBuilder) {
        return implClassBuilder.build();
    }
}
