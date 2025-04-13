package org.example;
import com.ut.UT_ALU;
import org.xaspect.AgentMethod;
import org.xaspect.AutoDUT;
import org.xaspect.AutoDUTDao;
import org.xaspect.services.XClockManager;
import org.xaspect.services.XClockManagerFactory;
import org.xaspect.testSupports.RefWithInsMethod;
import org.xaspect.testSupports.RefWithStaticMethod;

import java.math.BigInteger;
import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;


public class ALUWrapper {
//    UT_ALU alu = new UT_ALU();
//    UT_ALU alu;

    @AutoDUT
    ALUManager aluManager;

//    XClockManager cm = XClockManagerFactory.getXClockManager(alu.xclock);

    @AutoDUTDao()
    ALUDutDao aluDutDao;
//    ALUTestWrapper aluTestWrapper = new ALUTestWrapperImpl1();

    ALUWrapper() {
//        Semaphore sem = new Semaphore(0);
//        new Thread(() -> {
//            this.alu = new UT_ALU();
//            sem.release();
//        }).start();
//        sem.acquireUninterruptibly();
        aluDutDao.bind(aluManager.getDUT());

    }

    public void clear(){
        this.aluManager.finish();

    }

//    @AgentMethod(refClazz = ALURef.class, refMethodName = "refModel")
    @RefWithInsMethod(modelId = "a", methodId = "alu")
    public int process(ALUIO in) {

        aluDutDao.setAb(in.a, in.b);
        aluDutDao.setSel(in.sel);
        aluManager.step();
//        cm.Step();
        int res = aluDutDao.getOut();
        return res;
    }

    public int mainFunc(int a, int b){
//        aluDutDao.setAb(a, b);
//        cm.Step();
//        alu.Step();
        return 1;
    }

    public void anotherFunc(int sel){
//        aluDutDao.setSel(sel);
//        cm.Step();
    }

}