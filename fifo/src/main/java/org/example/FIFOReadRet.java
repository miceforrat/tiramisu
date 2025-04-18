package org.example;


import org.xaspect.datas.Bundle;
import org.xaspect.datas.Pin;

public class FIFOReadRet{
    @Pin
    int rdata;

    @Bundle
    CtrlInfos ctrls;

    FIFOReadRet(){

    }

    FIFOReadRet(int rdata, int empty, int full){
        this.rdata = rdata;
        this.ctrls=new CtrlInfos(empty, full);
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof FIFOReadRet) {
            FIFOReadRet other = (FIFOReadRet) obj;
            return rdata == other.rdata && ctrls.equals(other.ctrls);
        }
        return false;
    }
};
