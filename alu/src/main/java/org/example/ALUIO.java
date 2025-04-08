package org.example;

//import org.xaspect.Pin;
import org.xaspect.datas.Bundle;
import org.xaspect.datas.Pin;
import org.xaspect.datas.SubBundle;

@Bundle
public class ALUIO {
    @Pin
    int a;
    @Pin()
    int b;
    @Pin("alu_sel")
    Integer sel;

    int out;
}
