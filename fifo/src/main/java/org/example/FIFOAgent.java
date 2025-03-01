package org.example;

import com.ut.UT_FIFO;
import org.xaspect.AutoDUT;
import org.xaspect.ConcurrentSupport;

public class FIFOAgent {
//    private UT_FIFO fifo = new UT_FIFO();

    @AutoDUT(clockName = "clk", concurrentSupport = ConcurrentSupport.SEPARATE_THREAD)
    private FIFOWrapper fifo;

    FIFOAgent(){
//        fifo.Step();
    }

    public void setup(){
        fifo.reset(1);
    }

    public FIFOWriteRet write(int wdata){
        fifo.setWData(wdata);
        fifo.setWrEn(1);
        fifo.Step();
        fifo.setWrEn(0);
        return fifo.getAfterWriteStatus();
    }

    public FIFOReadRet read(){
        fifo.setRdEn(1);
        fifo.Step();
        fifo.setRdEn(0);
        fifo.Step();
        return fifo.readDataAndStatus();
    }
}