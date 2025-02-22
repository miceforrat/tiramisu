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

//    @AgentMethod(refClazz = ALURef.class, refMethodName = "refModel")
    public int process(ALUIO in) {

        aluTestWrapper.postIn(in);
        aluTestWrapper.Step();
        int res = aluTestWrapper.getOut();
        return res;
    }


}