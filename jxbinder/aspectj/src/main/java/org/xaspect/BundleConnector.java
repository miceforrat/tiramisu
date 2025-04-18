package org.xaspect;


import com.squareup.javapoet.CodeBlock;

import javax.lang.model.element.AnnotationMirror;
import javax.lang.model.element.TypeElement;
import javax.lang.model.element.VariableElement;
import javax.lang.model.type.TypeMirror;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BundleConnector implements XComponentConnector{

    private final List<XComponentConnector> subConnectors;

    private final boolean isOut;

    private final boolean isSon;

    private final String fullVarName;

    private final TypeMirror bundleType;

    public BundleConnector(IOParameters io) {
        TypeElement typeEl = TypeParserHelper.getInstance().getTypeElementFromTypeMirror(io.varType);
        Map<String, VariableElement> allFields = TypeParserHelper.getInstance().collectAllFields(typeEl);
        isOut = !io.isIn;
        subConnectors = new ArrayList<>();
        bundleType = io.varType;
        isSon = io.isSon;
        fullVarName = io.getFullVarName();
        for (VariableElement field : allFields.values()) {
            IOParameters sub = io.copy();
            sub.varType = field.asType();
            sub.varNamePrefixLastDot = fullVarName;
            sub.fieldName = field.getSimpleName().toString();
            sub.defaultPinNameFromFieldName = sub.fieldName;
            sub.isSon = true;
            List<? extends AnnotationMirror> fieldAnnotations = field.getAnnotationMirrors();
            XComponentConnector subConn = ConnectorFactory.buildConnector(sub, fieldAnnotations);

            if (subConn != null) {
                subConnectors.add(subConn);
            }
        }

    }

    @Override
    public CodeBlock connect() {
        CodeBlock.Builder builder = CodeBlock.builder();


        // ✅ 如果是输出（非子结构），需要初始化变量
        if (isOut) {
            if (!isSon) {
                builder.addStatement("$T $L = new $T()", bundleType, fullVarName, bundleType);
            } else {
                builder.addStatement("$L = new $T()", fullVarName, bundleType);
            }
        }

        // ✅ 拼接所有子连接器生成的代码
        for (XComponentConnector sub : subConnectors) {
            builder.add(sub.connect());
        }

        return builder.build();
    }
}
