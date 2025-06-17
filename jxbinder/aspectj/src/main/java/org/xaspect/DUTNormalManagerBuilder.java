package org.xaspect;

import com.squareup.javapoet.FieldSpec;
import com.squareup.javapoet.MethodSpec;
import com.squareup.javapoet.TypeName;
import com.squareup.javapoet.TypeSpec;
import org.xaspect.services.XClockManager;
import org.xaspect.services.XClockManagerFactory;

import javax.lang.model.element.Modifier;
import javax.lang.model.element.TypeElement;
import javax.lang.model.type.TypeMirror;

public class DUTNormalManagerBuilder implements DUTManagerBuilder {


    @Override
    public TypeMirror buildConstructor(TypeSpec.Builder implClassBuilder, TypeElement dutManagerElement, AutoDUT dutInfo) {
        TypeMirror mirror = DUTBindingTool.getInheritingType(dutManagerElement, DUTManager.class);
        TypeName dutTypeName = TypeName.get(mirror);
        FieldSpec dutField = FieldSpec.builder(dutTypeName, DUT_INSTANCE_NAME, Modifier.PRIVATE)
                .initializer("new $T()", dutTypeName)
                .build();
        implClassBuilder.addField(dutField);

        FieldSpec clockField = FieldSpec.builder(XClockManager.class, CLOCK_MANAGER_NAME, Modifier.PRIVATE)
                .initializer("$T.getNormalXClockManager($N.xclock)", XClockManagerFactory.class, DUT_INSTANCE_NAME)
                .build();
        implClassBuilder.addField(clockField);

        MethodSpec constructor = MethodSpec.constructorBuilder()
                .addModifiers(Modifier.PUBLIC)
                .addCode(defaultUtils(dutInfo))
                .build();
        implClassBuilder.addMethod(constructor);
        return mirror;
    }

//    @Override
//    public void buildStart(MethodSpec.Builder methodBuilder) {
//        throw new UnsupportedOperationException("normal dut manager does not support start(), please do not claim this method signature");
//    }
//
//    @Override
//    public void buildAddSuspendableRunnable(MethodSpec.Builder methodBuilder) {
//        throw new UnsupportedOperationException("normal dut manager does not support addSuspendableRunnable(), please do not claim this method signature");
//    }

    @Override
    public void buildFinish(MethodSpec.Builder methodBuilder) {
        methodBuilder.addStatement("this.$L.Finish()", DUT_INSTANCE_NAME);
    }

    @Override
    public TypeSpec build(TypeSpec.Builder implClassBuilder) {
        return implClassBuilder.build();
    }

    @Override
    public void buildGetServiceRunner(MethodSpec.Builder methodBuilder) {
        throw new UnsupportedOperationException("normal dut manager does not support getServiceRunner(), please do not claim this method signature");
    }
}
