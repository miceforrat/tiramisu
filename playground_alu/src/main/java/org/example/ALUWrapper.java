package org.example;
import com.ut.UT_ALU;
import org.xaspect.AgentMethod;
import org.xaspect.AutoDUT;
import org.xaspect.AutoDUTDao;
//import org.xaspect.services.XClockManager;
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

    @AutoDUT(covFileName = "1.dat", waveFileName = "1.fst")
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
    @RefWithInsMethod(methodId = "alu")
    public int process(ALUIO in) {

        aluDutDao.setAb(in.a, in.b);
        aluDutDao.setSel(in.sel);
        aluManager.getXClockManager().step();
//        cm.Step();
        int res = aluDutDao.getOut();
        return res;
    }


}