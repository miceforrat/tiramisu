package org.example;

import com.ut.UT_ALU;
import org.xaspect.datas.*;
import org.xaspect.*;

import java.math.BigInteger;

public interface ALUTestWrapper extends DUTWrapper<UT_ALU> {

//    @AgentMethod()
//    public @Pin(value = "alu_out") BigInteger process(ALUIO in, int is);

    @PostMethod
    public void postIn(ALUIO in);


    @GetMethod(prefix = "alu_out")
    public @Pin int getOut();

}
