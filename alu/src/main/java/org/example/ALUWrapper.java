package org.example;
import com.ut.UT_ALU;
import org.xaspect.AgentMethod;
import org.xaspect.AutoDUTDao;
import org.xaspect.services.XClockManager;


public class ALUWrapper {
//    @AutoDUT("1")
    UT_ALU alu = new UT_ALU();

    XClockManager cm = XClockManager.getXClockWrapper(alu.xclock);

    @AutoDUTDao()
    ALUDutDao aluDutDao;
//    ALUTestWrapper aluTestWrapper = new ALUTestWrapperImpl1();

    ALUWrapper() {
        aluDutDao.bind(alu);
    }

    public void clear(){
        this.aluDutDao.finish();

    }

    @AgentMethod(refClazz = ALURef.class, refMethodName = "refModel")
    public int process(ALUIO in) {

        aluDutDao.postIn(in);
        cm.Step();
        int res = aluDutDao.getOut();
        return res;
    }


}