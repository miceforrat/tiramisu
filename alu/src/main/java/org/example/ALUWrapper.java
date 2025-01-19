package org.example;
import com.ut.UT_ALU;
import org.xaspect.AgentMethod;
import org.xaspect.AutoDUT;
import org.xaspect.clocks.DUTClockManager;

import java.math.BigInteger;
//import org.xbinder.annotations.AutoDUT;

public class ALUWrapper {
//    @AutoDUT("1")
//    UT_ALU alu = new UT_ALU();

//    DUTClockManager cm;

    @AutoDUT()
    ALUTestWrapper aluTestWrapper;

    ALUWrapper(){
//        cm = new DUTClockManager(alu.xclock) ;
//        alu.a.AsImmWrite();
//        alu.b.AsImmWrite();
//        alu.alu_sel.AsImmWrite();
    }

    public void clear(){
        this.aluTestWrapper.finish();

//        this.cm.shutdown();
//        this.alu.Finish();
    }

    @AgentMethod(refClazz = ALURef.class, refMethodName = "refModel")
    public int process(ALUIO in) {
//        alu.a.Set(in.ab.a);
//        alu.b.Set(in.ab.b);
//        alu.alu_sel.Set(in.sel.sel);
//        cm.waitForSteps("alu", 1);
//        alu.Step(term);
//        return alu.alu_out.U().intValue();
        aluTestWrapper.postIn(in);
        aluTestWrapper.Step();
        return aluTestWrapper.getOut();
    }


}