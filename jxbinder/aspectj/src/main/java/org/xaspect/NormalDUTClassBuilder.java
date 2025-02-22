package org.xaspect;

import com.squareup.javapoet.FieldSpec;
import com.squareup.javapoet.MethodSpec;
import com.squareup.javapoet.TypeName;
import com.squareup.javapoet.TypeSpec;
import org.xaspect.datas.InBundle;
import org.xaspect.datas.OutBundle;
import org.xaspect.datas.Pin;

import javax.lang.model.element.ExecutableElement;
import javax.lang.model.element.Modifier;
import javax.lang.model.element.VariableElement;
import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import static org.xaspect.DUTBindingTool.*;

public class NormalDUTClassBuilder implements DUTClassBuilder{

    private String instanceFieldName = "";


    @Override
    public void buildConstructor(TypeSpec.Builder implClassBuilder, TypeName dutTypeName, AutoDUT dutInfo) {
        String dutId = dutInfo.id();
        this.instanceFieldName = dutTypeName.toString().replace(".", "") + "Instance" + dutId;
        FieldSpec dutField = FieldSpec.builder(dutTypeName, instanceFieldName, Modifier.PRIVATE)
                .build();
        implClassBuilder.addField(dutField);
        String initializeClockStr = "";

        String clockName = dutInfo.clockName();
        if (!clockName.isEmpty()){
            initializeClockStr = "this." + instanceFieldName + ".InitClock(\"" + clockName + "\");";
        }
        MethodSpec constructor = MethodSpec.constructorBuilder()
                .addModifiers(Modifier.PUBLIC)
                .addStatement("this.$N = new $T()", instanceFieldName, dutTypeName)
                .addStatement(initializeClockStr)
                .build();
        implClassBuilder.addMethod(constructor);
    }

    @Override
    public void buildFinish(MethodSpec.Builder methodBuilder) {
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
    public void buildGetMethod(MethodSpec.Builder methodBuilder, String prefix, ExecutableElement method) {
        String getPrefix = prefix + method.getAnnotation(GetMethod.class).prefix();
        List<String> res = constructGetMethod(method, getPrefix, instanceFieldName);
        res.forEach(methodBuilder::addCode);
    }

    private List<String> constructGetMethod(ExecutableElement method, String prefix, String instanceFieldName){
        String outputPrefix = prefix;
        List<String> ret = new ArrayList<>();

        IOParameters ios = new IOParameters();
        ios.isIn = false;
        Annotation outerPinAnnotation =  getAnnotationFromType(method.getReturnType(), Pin.class);
        Annotation outerBundleAnnotation =  getAnnotationFromType(method.getReturnType(), OutBundle.class);
        if (outerBundleAnnotation != null) {
            OutBundle outerBundle = (OutBundle) outerBundleAnnotation;
            outputPrefix += outerBundle.value();
            ios.coveringUnsigned = outerBundle.coveringUnsigned();
            ios.unsigned = outerBundle.unsigned();
        } else if (outerPinAnnotation != null){
            outputPrefix += ((Pin) outerPinAnnotation).value();
        }
        ios.isPin = outerPinAnnotation != null;

        String outerName = "retBundle";

        Class<?> returnTypeCls = getClassFromTypeMirror(method.getReturnType());
        String typeName = returnTypeCls.getTypeName();
        String initializr = typeName + " " + outerName ;
        if (!ios.isPin) {
            initializr += " = new " + typeName + "()";
        }
        initializr += ";\n";
        ret.add(initializr);
        List<String> outputAssigns = constructIO(outputPrefix, returnTypeCls, instanceFieldName, outerName, ios);

        ret.addAll(outputAssigns);

        ret.add("return " + outerName + ";\n");

        return ret;
    }

    @Override
    public void buildPostMethod(MethodSpec.Builder methodBuilder, String prefix, ExecutableElement method) {
        String postPrefix = prefix + method.getAnnotation(PostMethod.class).prefix();
        List<String> res = constructPostMethod(method, postPrefix, instanceFieldName);
        res.forEach(methodBuilder::addCode);
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
}
