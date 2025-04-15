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

        FieldSpec clockField = FieldSpec.builder(XClockManager.class, CLOCK_MANAGER_NAME, Modifier.PRIVATE)
                .initializer("$T.getNormalXClockManager($N.xclock)", XClockManagerFactory.class, instanceFieldName)
                .build();
        implClassBuilder.addField(clockField);

        MethodSpec constructor = MethodSpec.constructorBuilder()
                .addModifiers(Modifier.PUBLIC)
                .addCode(defaultUtils(instanceFieldName, dutInfo))
                .build();
        implClassBuilder.addMethod(constructor);
    }

    @Override
    public void buildGetDUT(MethodSpec.Builder methodBuilder) {
        methodBuilder.addStatement("return $L", instanceFieldName);
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
        methodBuilder.addStatement("this.$L.Finish()", instanceFieldName);
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
