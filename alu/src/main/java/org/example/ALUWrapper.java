package org.example;
import com.ut.UT_ALU;
import org.xaspect.AgentMethod;
import org.xaspect.AutoDUTDao;
import org.xaspect.services.XClockManager;
import org.xaspect.services.XClockManagerFactory;
import org.xaspect.testSupports.RefWithInsMethod;
import org.xaspect.testSupports.RefWithStaticMethod;

import java.math.BigInteger;


public class ALUWrapper {
//    @AutoDUT("1")
    UT_ALU alu = new UT_ALU();

    XClockManager cm = XClockManagerFactory.getXClockWrapper(alu.xclock);

    @AutoDUTDao()
    ALUDutDao aluDutDao;
//    ALUTestWrapper aluTestWrapper = new ALUTestWrapperImpl1();

    ALUWrapper() {
        aluDutDao.bind(alu);
    }

    public void clear(){
        this.alu.Finish();

    }

//    @AgentMethod(refClazz = ALURef.class, refMethodName = "refModel")
    @RefWithInsMethod(modelId = "a", methodId = "alu")
    public int process(ALUIO in) {

        aluDutDao.postIn(in);
        cm.Step();
        int res = aluDutDao.getOut();
        return res;
    }


}