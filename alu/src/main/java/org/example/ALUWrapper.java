package org.example;
import com.ut.UT_ALU;
import org.xaspect.AgentMethod;
import org.xaspect.AutoDUT;


public class ALUWrapper {
//    @AutoDUT("1")
    UT_ALU alu = new UT_ALU();

//    DUTClockManager cm;

    @AutoDUT()
    ALUTestWrapper aluTestWrapper;
//    ALUTestWrapper aluTestWrapper = new ALUTestWrapperImpl1();

    ALUWrapper(){
    }

    public void clear(){
        this.aluTestWrapper.finish();

    }

//    @AgentMethod(refClazz = ALURef.class, refMethodName = "refModel")
    public int process(ALUIO in) {

        aluTestWrapper.postIn(in);
        aluTestWrapper.Step();
        int res = aluTestWrapper.getOut();
        return res;
    }


}