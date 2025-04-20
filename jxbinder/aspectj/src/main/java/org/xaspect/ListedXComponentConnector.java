package org.xaspect;

import com.squareup.javapoet.CodeBlock;

import javax.lang.model.element.AnnotationMirror;
import javax.lang.model.type.ArrayType;
import javax.lang.model.type.TypeKind;
import javax.lang.model.type.TypeMirror;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ListedXComponentConnector implements XComponentConnector {

    private enum ContainerKind { LIST, ARRAY }

    private static final class ContainerTemplates {
        final String initDeclNotSon;
        final String initAssignSon;
        final String getInput;
        final String putOutput;

        ContainerTemplates(String initDeclNotSon, String initAssignSon, String getInput, String putOutput) {
            this.initDeclNotSon = initDeclNotSon;
            this.initAssignSon = initAssignSon;
            this.getInput = getInput;
            this.putOutput = putOutput;
        }
    }

    private static final Map<ContainerKind, ContainerTemplates> TEMPLATES = Map.of(
            ContainerKind.LIST, new ContainerTemplates(
                    "$T<$T> $L = new $T<>()",        // initDeclNotSon
                    "$L = new $T<>()",               // initAssignSon
                    "$T $L = $L.get($L)",            // getInput
                    "$L.add($L)"                     // putOutput
            ),
            ContainerKind.ARRAY, new ContainerTemplates(
                    "$T[] $L = new $T[$L]",          // initDeclNotSon
                    "$L = new $T[$L]",               // initAssignSon
                    "$T $L = $L[$L]",                // getInput
                    "$L[$L] = $L"                    // putOutput
            )
    );

    private final List<XComponentConnector> elementConnectors = new ArrayList<>();
    private final List<String> toInitTmp = new ArrayList<>();
    private final ContainerKind containerKind;
    private final boolean isOut;
    private final boolean isSon;
    private final String fullVarName;
    private final TypeMirror elementType;

    public ListedXComponentConnector(IOParameters io, int start, int max, List<? extends AnnotationMirror> extendedAnnotations) {
        this.isOut = !io.isIn;
        this.isSon = io.isSon;
        this.fullVarName = io.getFullVarName();

        TypeParserHelper helper = TypeParserHelper.getInstance();

        if (helper.isListType(io.varType)) {
            this.containerKind = ContainerKind.LIST;
            this.elementType = helper.getListElementTypeFromType(io.varType)
                    .orElseThrow(() -> new IllegalArgumentException("Invalid List<T>: " + io.varType));
        } else if (io.varType.getKind() == TypeKind.ARRAY) {
            this.containerKind = ContainerKind.ARRAY;
            this.elementType = ((ArrayType) io.varType).getComponentType();
        } else {
            throw new IllegalArgumentException("Expected List<T> or T[], got: " + io.varType);
        }

        for (int i = start; i <= max; i++) {
            IOParameters sub = io.copy();
            sub.varType = elementType;
            sub.varNamePrefixLastDot = "";
            sub.fieldName = fullVarName.replace('.', '_') + "__at_" + i;
            sub.defaultPinNameFromFieldName = "";
            sub.prefixPattern += i;
            sub.isSon = false;

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
            throw new IllegalStateException("Connector count mismatch");
        }

        CodeBlock.Builder builder = CodeBlock.builder();
        int size = elementConnectors.size();
        ContainerTemplates tpl = TEMPLATES.get(containerKind);

        // Step 1: 输出容器初始化
        if (isOut) {
            if (!isSon) {
                if (containerKind == ContainerKind.LIST) {
                    builder.addStatement(tpl.initDeclNotSon, List.class, elementType, fullVarName, ArrayList.class);
                } else {
                    builder.addStatement(tpl.initDeclNotSon, elementType, fullVarName, elementType, size);
                }
            } else {
                if (containerKind == ContainerKind.LIST) {
                    builder.addStatement(tpl.initAssignSon, fullVarName, ArrayList.class);
                } else {
                    builder.addStatement(tpl.initAssignSon, fullVarName, elementType, size);
                }
            }
        }

        // Step 2: 每个元素单独绑定
        for (int i = 0; i < size; i++) {
            String tmpVar = toInitTmp.get(i);
            XComponentConnector connector = elementConnectors.get(i);

            if (!isOut) {
                builder.addStatement(tpl.getInput, elementType, tmpVar, fullVarName, i);
            }

            builder.add(connector.connect());

            if (isOut) {
                if (containerKind == ContainerKind.LIST) {
                    builder.addStatement(tpl.putOutput, fullVarName, tmpVar);
                } else {
                    builder.addStatement(tpl.putOutput, fullVarName, i, tmpVar);
                }
            }
        }

        return builder.build();
    }
}
