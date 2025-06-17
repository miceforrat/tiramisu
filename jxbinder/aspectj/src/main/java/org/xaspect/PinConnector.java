package org.xaspect;

import com.squareup.javapoet.CodeBlock;
import com.xspcomm.XData;

import javax.lang.model.element.VariableElement;
import javax.lang.model.type.TypeMirror;
import java.math.BigInteger;
import java.util.Map;

public class PinConnector implements XComponentConnector {

    private final String fieldFullName;
    private final TypeMirror fieldType;
    private final String prefixPattern;
    private final InstanceDUTTypeInfo insInfo;

    private final boolean isIn;
    private final boolean isSon;
    private final boolean unsigned;

    public PinConnector(IOParameters io) {
        this.fieldFullName = (io.varNamePrefixLastDot.isEmpty() ? "" : io.varNamePrefixLastDot + "." ) + io.fieldName;
        this.fieldType = io.varType;
        this.prefixPattern = io.prefixPattern;
        this.insInfo = io.instanceDUTTypeInfo;
        this.isIn = io.isIn;
        this.isSon = io.isSon;
        this.unsigned = io.unsigned;
    }

    @Override
    public CodeBlock connect() {
        CodeBlock.Builder builder = CodeBlock.builder();
        if (!isIn && !isSon){
            builder.addStatement("$T $N", fieldType, fieldFullName);
        }
        return builder.add(constructAssignmentWithCheck()).build();
    }

    private CodeBlock constructAssignmentWithCheck() {
        CodeBlock cb = CodeBlock.builder().build();

        if (insInfo.getFields().containsKey(prefixPattern)){
            //存在这个变量，而且是XData，就不需要后续的正则检查
            String pinFullName = insInfo.getInstanceName() + "." + prefixPattern;

            if (mirrorEqualsClass(insInfo.getFields().get(prefixPattern).asType(), XData.class)) {
                return constructSimpleAssignment(pinFullName, fieldFullName, fieldType);
            }
        } else {
            boolean generated = false;

            for (Map.Entry<String, VariableElement> entry : insInfo.getFields().entrySet()) {
                if (!mirrorEqualsClass(entry.getValue().asType(), XData.class)) {
                    continue;
                }
                if (!entry.getKey().matches(prefixPattern)){
                    continue;
                }
                if (!generated){
                    generated = true;
                    String pinFullName = insInfo.getInstanceName() + "." + entry.getKey();
                    cb = constructSimpleAssignment(pinFullName, fieldFullName, fieldType);
                } else {
                    System.err.println("\u001B[31mDifferent pins match the same pattern: " + prefixPattern + ", please check!!! Now we just ignoring those being not the first so that the variable won't connect\u001B[0m");
                }
            }

            if (generated){
                return cb;
            }
        }

        System.err.println("pin following pattern: " + prefixPattern + " is not found, please recheck!");
        return CodeBlock.builder().addStatement("$N = $L", fieldFullName, getDefaultTypeAssignment(fieldType)).build();
    }

    private boolean mirrorEqualsClass(TypeMirror typeMirror, Class<?> clazz) {
        return typeMirror.toString().equals(clazz.getCanonicalName());
    }

    private CodeBlock constructSimpleAssignment(String pinFullName, String fieldFullName, TypeMirror fieldType) {
        if (isIn) {
            return CodeBlock.of("$L.Set($L);\n", pinFullName, fieldFullName);
        } else {
            String signedGet = "." + (unsigned ? "U()" : "S()");
            String basicGet = getBasicTypeBindingStr(fieldType, signedGet);
            return CodeBlock.of("$L = $L$L;\n", fieldFullName, pinFullName, basicGet);
        }
    }

    private String getBasicTypeBindingStr(TypeMirror typeMirror, String signedBefore) {
        SupportedBasicType type = SupportedBasicType.getSupportedBasicTypes(typeMirror);
        switch (type) {
            case INT:
                return signedBefore + ".intValue()";
            case LONG:
                return signedBefore + ".longValue()";
            case STRING:
                return ".String()";
            case BYTES:
                return ".GetBytes()";
            case BIG_INTEGER:
                return signedBefore;
            default:
                return "";
        }
    }

    private String getDefaultTypeAssignment(TypeMirror typeMirror) {
        SupportedBasicType type = SupportedBasicType.getSupportedBasicTypes(typeMirror);
        switch (type) {
            case INT:
                return "0";
            case LONG:
                return "0L";
            case STRING:
                return "\"\"";
            case BYTES:
                return "new byte[0]";
            case BIG_INTEGER:
                return "BigInteger.valueOf(0L)";
            default:
                return "0";
        }
    }


    private enum SupportedBasicType{
        INT, LONG, BYTES, STRING, BIG_INTEGER;

        static SupportedBasicType getSupportedBasicTypes(TypeMirror typeMirror) {
            if (TypeParserHelper.getInstance().isInteger(typeMirror)) {
                return INT;
            } else if (TypeParserHelper.getInstance().isLong(typeMirror)) {
                return LONG;
            } else if (TypeParserHelper.getInstance().isByteArray(typeMirror)) {
                return BYTES;
            } else if (typeMirror.toString().equals("java.lang.String")) {
                return STRING;
            } else if (typeMirror.toString().equals("java.math.BigInteger")) {
                return BIG_INTEGER;
            }
            return INT;
        }
    }
}
