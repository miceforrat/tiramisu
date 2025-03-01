package org.xaspect;

import com.squareup.javapoet.FieldSpec;
import com.squareup.javapoet.MethodSpec;
import com.squareup.javapoet.TypeName;
import com.squareup.javapoet.TypeSpec;

import javax.lang.model.element.ExecutableElement;
import javax.lang.model.element.Modifier;
import javax.lang.model.element.VariableElement;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import static org.xaspect.DUTBindingTool.*;

public class NormalDUTClassBuilder implements DUTClassBuilder{

    private String instanceFieldName = "";


    @Override
    public void buildConstructor(TypeSpec.Builder implClassBuilder, TypeName dutTypeName, AutoDUT dutInfo) {
        String dutId = dutInfo.id();
        this.instanceFieldName = dutTypeName.toString().replace(".", "") + "Instance" + dutId;
        FieldSpec dutField = FieldSpec.builder(dutTypeName, instanceFieldName, Modifier.PRIVATE)
                .initializer("new $T()", dutTypeName)
                .build();
        implClassBuilder.addField(dutField);
        String initializeClockStr = "";

        String clockName = dutInfo.clockName();
        if (!clockName.isEmpty()){
            initializeClockStr = "this." + instanceFieldName + ".InitClock(\"" + clockName + "\");";
        }
        MethodSpec constructor = MethodSpec.constructorBuilder()
                .addModifiers(Modifier.PUBLIC)
//                .addStatement("this.$N = new $T()", instanceFieldName, dutTypeName)
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
        String outerName = "outBundle";
        List<String> res = constructGetMethod(method, getPrefix, instanceFieldName, outerName);
        res.forEach(methodBuilder::addCode);
        methodBuilder.addCode("return " + outerName + ";\n");
    }


    @Override
    public void buildPostMethod(MethodSpec.Builder methodBuilder, String prefix, ExecutableElement method) {
        String postPrefix = prefix + method.getAnnotation(PostMethod.class).prefix();
//        List<String> res = constructPostMethod(method, postPrefix, instanceFieldName);
        constructPostMethod(method, postPrefix, instanceFieldName).forEach(methodBuilder::addCode);
    }


    private List<String> constructPostMethod(ExecutableElement method, String prefix, String instanceFieldName) {
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
        return ret;
    }


    @Override
    public TypeSpec build(TypeSpec.Builder implClassBuilder) {
        return implClassBuilder.build();
    }
}
