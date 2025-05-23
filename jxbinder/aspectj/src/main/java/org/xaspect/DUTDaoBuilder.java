package org.xaspect;

import com.squareup.javapoet.MethodSpec;
import com.squareup.javapoet.TypeSpec;

import javax.lang.model.element.ExecutableElement;
import javax.lang.model.element.TypeElement;

public interface DUTDaoBuilder {


    void buildConstructor(TypeSpec.Builder implClassBuilder, TypeElement element, AutoDUTDao daoInfo);


    void buildFinish(MethodSpec.Builder methodBuilder);

    void buildStep(String term, MethodSpec.Builder methodBuilder);

    void buildStep(MethodSpec.Builder methodBuilder);

    void buildGetMethod(MethodSpec.Builder methodBuilder, String prefix, ExecutableElement method );

    void buildPostMethod(MethodSpec.Builder methodBuilder, String prefix, ExecutableElement method );

    void buildReset(MethodSpec.Builder methodBuilder);

    void buildBind(MethodSpec.Builder methodBuilder, ExecutableElement method);

    TypeSpec build(TypeSpec.Builder implClassBuilder);
}
