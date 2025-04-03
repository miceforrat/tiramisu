package org.example;

import com.ut.UT_ALU;
import org.xaspect.datas.*;
import org.xaspect.*;

public interface ALUDutDao
        extends DUTDao <UT_ALU> {

    @PostMethod
    void postIn(ALUIO in);

    @GetMethod(prefix = "alu_out")
    @Pin int getOut();
}
