package org.xaspect;

import co.paralleluniverse.strands.SuspendableRunnable;
import com.squareup.javapoet.MethodSpec;
import com.squareup.javapoet.TypeSpec;

import javax.lang.model.element.TypeElement;
import java.util.Map;

public interface DUTManagerBuilder {

    void buildConstructor(TypeSpec.Builder implClassBuilder, TypeElement dutManagerElement, AutoDUT dutInfo);

    void buildStep(String term, MethodSpec.Builder methodBuilder);

    void buildStep(MethodSpec.Builder methodBuilder);

    void buildGetDUT(MethodSpec.Builder methodBuilder);

    void buildStart(MethodSpec.Builder methodBuilder);

    void buildAddSuspendableRunnable(MethodSpec.Builder methodBuilder);

    void buildFinish(MethodSpec.Builder methodBuilder);

    TypeSpec build(TypeSpec.Builder implClassBuilder);
}
