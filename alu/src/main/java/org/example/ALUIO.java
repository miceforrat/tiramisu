package org.example;

//import org.xaspect.Pin;
import org.xaspect.datas.SubBundle;


public class ALUIO{

    @SubBundle
    ALUSubBundleAB ab = new ALUSubBundleAB();
//    @Pin
//    int a;
//    @Pin()
//    int b;
//    @Pin("alu_sel")
//    Integer sel;
    @SubBundle("alu_")
    ALUSingleSel sel = new ALUSingleSel();
//    @Pin("alu_out")
    int out;

}
