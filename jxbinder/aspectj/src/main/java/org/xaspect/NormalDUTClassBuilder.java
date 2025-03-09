package org.xaspect;

import com.squareup.javapoet.FieldSpec;
import com.squareup.javapoet.MethodSpec;
import com.squareup.javapoet.TypeName;
import com.squareup.javapoet.TypeSpec;

import javax.lang.model.element.ExecutableElement;
import javax.lang.model.element.Modifier;
import javax.lang.model.element.TypeElement;
import javax.lang.model.element.VariableElement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.xaspect.DUTBindingTool.*;

public class NormalDUTClassBuilder implements DUTClassBuilder{

    private String instanceFieldName = "";

    private String resetPinName = "";

    @Override
    public void buildConstructor(TypeSpec.Builder implClassBuilder, TypeElement typeElement, AutoDUT dutInfo) {
        String dutId = dutInfo.id();
        TypeName dutTypeName = DUTBindingTool.getTypeNameFromTypeElement(typeElement);
        this.instanceFieldName = dutTypeName.toString().replace(".", "") + "Instance" + dutId;
        FieldSpec dutField = FieldSpec.builder(dutTypeName, instanceFieldName, Modifier.PRIVATE)
                .initializer("new $T()", dutTypeName)
                .build();
        implClassBuilder.addField(dutField);
        String initializeClockStr = "";

        String clockName = dutInfo.value() + dutInfo.clockName();
        if (!clockName.isEmpty()){
            initializeClockStr = "this." + instanceFieldName + ".InitClock(\"" + clockName + "\");";
        }

        resetPinName = dutInfo.value() + dutInfo.resetName();
        String resetStmt = "";
        if (!resetPinName.isEmpty()){
            resetStmt = "this.reset();";
        }

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

        FieldSpec wpField = FieldSpec.builder(getWatchPointTypeName(),WATCHPOINT_MAP_NAME,Modifier.PRIVATE)
                .initializer("new $T<>()", HashMap.class)
                .build();
        implClassBuilder.addField(wpField);

        MethodSpec constructor = MethodSpec.constructorBuilder()
                .addModifiers(Modifier.PUBLIC)
//                .addStatement("this.$N = new $T()", instanceFieldName, dutTypeName)
                .addStatement(initializeClockStr)
                .addStatement(resetStmt)
                .addStatement(fstSetStmt)
                .addStatement(covSetStmt)
                .build();
        implClassBuilder.addMethod(constructor);
    }

    @Override
    public void buildFinish(MethodSpec.Builder methodBuilder) {
        methodBuilder.addStatement("this." + instanceFieldName + ".Finish();\n");
        methodBuilder.addStatement("        for (String wpName: $N.keySet()){\n" +
                "            System.err.println(wpName +\": \" + $N.get(wpName));\n" +
                "        }", WATCHPOINT_MAP_NAME, WATCHPOINT_MAP_NAME);
//        Map<String, Integer> watchPointMap = new HashMap<>();
//        for (String wpName: watchPointMap.keySet()){
//            System.out.println(watchPointMap.get(wpName));
//        }
    }

    @Override
    public void buildStep(String term, MethodSpec.Builder methodBuilder) {
        methodBuilder.addCode("this." + instanceFieldName + ".Step(" + term + ");\n");
    }

    @Override
    public void buildReset(MethodSpec.Builder methodBuilder) {
        if (!resetPinName.isEmpty()){
            methodBuilder.addCode("this." + instanceFieldName + "." + resetPinName + ".Set(1);\n");
        }
    }

    @Override
    public void buildStep(MethodSpec.Builder methodBuilder) {
        methodBuilder.addCode("this." + instanceFieldName + ".Step();\n");
//        methodBuilder.addCode("AfterStep();\n");

    }

    @Override
    public void buildGetMethod(MethodSpec.Builder methodBuilder, String prefix, ExecutableElement method) {
        String getPrefix = prefix + method.getAnnotation(GetMethod.class).prefix();
        String outerName = "outBundle";
        List<String> res = constructGetMethod(method, getPrefix, instanceFieldName, outerName);
        res.forEach(methodBuilder::addCode);
        methodBuilder.addCode("return " + outerName + ";\n");
    }


    @Override
    public void buildPostMethod(MethodSpec.Builder methodBuilder, String prefix, ExecutableElement method) {
        String postPrefix = prefix + method.getAnnotation(PostMethod.class).prefix();
//        List<String> res = constructPostMethod(method, postPrefix, instanceFieldName);
        constructPostMethod(method, postPrefix).forEach(methodBuilder::addCode);
    }


    private List<String> constructPostMethod(ExecutableElement method, String prefix) {
        List<? extends VariableElement> params = method.getParameters();
        List<String> ret = new ArrayList<>();
        for (VariableElement param : params) {
            //获取公用前缀
            String inputBundleName = param.getSimpleName().toString();

//            IOParameters ios = new IOParameters();
//            ios.isIn = true;
//            String inputPrefix = prefix;
//            Annotation innerPinAnnotation = getAnnotationFromType(param.asType(), Pin.class);
//
//            ios.isPin = innerPinAnnotation != null;
//            Annotation innerBundleAnnotation = getAnnotationFromType(param.asType(), InBundle.class);
//            //更新前缀和unsigned设置
//            if (innerBundleAnnotation != null) {
//                InBundle inBundle = (InBundle) innerBundleAnnotation;
//                inputPrefix += inBundle.value();
//                ios.coveringUnsigned = inBundle.coveringUnsigned();
//                ios.unsigned = inBundle.unsigned();
//            } else if (innerPinAnnotation != null) {
//                Pin pinAnnotation = (Pin) innerPinAnnotation;
//                if (pinAnnotation.value().isEmpty()){
//                    inputPrefix += param.getSimpleName().toString();
//                } else {
//                    inputPrefix += pinAnnotation.value();
//                }
//                ios.unsigned = pinAnnotation.unsigned();
//            }
//
//            List<String> inputsAssigns = constructIO(inputPrefix, getClassFromTypeMirror(param.asType()), instanceFieldName, inputBundleName, ios);
            ret.addAll(constructOneParamBinding(prefix, param, inputBundleName, this.instanceFieldName));

        }
        System.out.println("to add:" + ret);
        return ret;
    }


    @Override
    public TypeSpec build(TypeSpec.Builder implClassBuilder) {
//        MethodSpec.Builder builder = MethodSpec.methodBuilder("AfterStep").addModifiers(Modifier.PUBLIC).returns(TypeName.VOID);
//        getWatchpointsStmts().forEach(builder::addStatement);
//        implClassBuilder.addMethod(builder.build());
        return implClassBuilder.build();
    }
}
