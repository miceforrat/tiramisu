package org.xaspect;

import com.squareup.javapoet.CodeBlock;

import javax.lang.model.element.AnnotationMirror;
import javax.lang.model.type.TypeMirror;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ListedXComponentConnector implements XComponentConnector {


    private final List<XComponentConnector> elementConnectors;
    private final boolean isOut;
    private final String fullVarName;
    private final TypeMirror elementType;
    private final List<String> toInitTmp = new ArrayList<>();
    private final boolean isSon;

    public ListedXComponentConnector(IOParameters io, int start, int max, List<? extends AnnotationMirror> extendedAnnotations) {
        this.elementConnectors = new ArrayList<>();
        this.isOut = !io.isIn;
        this.fullVarName = io.getFullVarName();
        isSon = io.isSon;

        // 获取下一层元素的类型（List<T> -> T）
        Optional<TypeMirror> elementOpt = TypeParserHelper.getInstance().getListElementTypeFromType(io.varType);
        if (elementOpt.isEmpty()) {
            throw new IllegalArgumentException("ListXComponentConnector received a non-list type: " + io.varType);
        }
        this.elementType = elementOpt.get();

        for (int i = start; i <= max; i++) {
            IOParameters sub = io.copy();
            sub.varType = elementType;
            sub.varNamePrefixLastDot = ""; // 清空，确保临时变量独立
            sub.fieldName = fullVarName.replace('.', '_') + "__at_" + i;
            sub.defaultPinNameFromFieldName = Integer.toString(i);
            sub.isSon = false;
            // Prefix pattern已经在工厂中设置完毕
            XComponentConnector connector = ConnectorFactory.buildConnector(sub, extendedAnnotations);
            if (connector != null) {
                elementConnectors.add(connector);
                toInitTmp.add(sub.fieldName);
            }
        }
    }


    @Override
    public CodeBlock connect() {
        if (elementConnectors.size() != toInitTmp.size()) {
            throw new IllegalStateException("Mismatch between connectors and init variable list");
        }

        CodeBlock.Builder builder = CodeBlock.builder();

        if (isOut) {
            if (!isSon){
                builder.addStatement("$T $L = new $T<>()", List.class, fullVarName, ArrayList.class);
            } else {
                builder.addStatement("$L = new $T<>()", fullVarName, ArrayList.class);
            }
        }

        for (int i = 0; i < elementConnectors.size(); i++) {
            String tmpVar = toInitTmp.get(i);
            XComponentConnector connector = elementConnectors.get(i);

            if (!isOut) {
                builder.addStatement("$T $L = $L.get($L)", elementType, tmpVar, fullVarName, i);
            }

            builder.add(connector.connect());

            if (isOut) {
                builder.addStatement("$L.add($L)", fullVarName, tmpVar);
            }
        }

        return builder.build();
    }
}
