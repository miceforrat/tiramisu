package org.xaspect;

class IOParameters {

    boolean isIn = true;
    boolean unsigned = true;
    boolean coveringUnsigned = false;
    boolean isPin = false;
    boolean isSon = false;
    int arrIdx = -1;


    public IOParameters copy() {
        IOParameters cloned = new IOParameters();
        cloned.coveringUnsigned = coveringUnsigned;
        cloned.isIn = isIn;
        cloned.unsigned = unsigned;
        cloned.isPin = isPin;
        cloned.isSon = isSon;
        cloned.arrIdx = arrIdx;
        return cloned;
    }
}
