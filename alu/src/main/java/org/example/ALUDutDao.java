package org.example;

import com.ut.UT_ALU;
import org.xaspect.datas.*;
import org.xaspect.*;

import java.math.BigInteger;

public interface ALUDutDao
        extends DUTDao <UT_ALU> {

    @PostMethod
    void postIn(ALUIO in);

    @GetMethod(prefix = "alu_out")
    @ReturnsPin
    int getOut();
}
