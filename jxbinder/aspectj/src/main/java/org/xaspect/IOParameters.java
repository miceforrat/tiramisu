package org.xaspect;

import javax.lang.model.type.TypeMirror;

public class IOParameters {

    boolean isIn = true;
    boolean isSon = false;

    int listIdx = 0;

    // pin related
    boolean unsigned = true;
    boolean coveringUnsigned = false;
    boolean isPin = false;
    String prefixPattern = "";
    String defaultPinNameFromFieldName = "";

    //var related
    String varNamePrefixLastDot = "";
    String fieldName = "";
    TypeMirror varType;

    //dut related
    final InstanceDUTTypeInfo instanceDUTTypeInfo;

    IOParameters(InstanceDUTTypeInfo instanceDUTTypeInfo, TypeMirror varType) {
        this.instanceDUTTypeInfo = instanceDUTTypeInfo;
        this.varType = varType;
    }


    public IOParameters copy() {
        IOParameters cloned = new IOParameters(instanceDUTTypeInfo, varType);
        cloned.coveringUnsigned = coveringUnsigned;
        cloned.isIn = isIn;
        cloned.unsigned = unsigned;
        cloned.isPin = isPin;
        cloned.isSon = isSon;
        cloned.prefixPattern = prefixPattern;
        cloned.varNamePrefixLastDot = varNamePrefixLastDot;
        cloned.fieldName = fieldName;
        cloned.defaultPinNameFromFieldName = defaultPinNameFromFieldName;
        cloned.listIdx = listIdx;
        return cloned;
    }

    public String getFullVarName() {
        return varNamePrefixLastDot.isEmpty() ? fieldName : varNamePrefixLastDot + "." + fieldName;
    }

}
