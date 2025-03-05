package org.example;
import com.ut.UT_Counter;
import org.xaspect.AutoDUT;
import org.xaspect.ConcurrentSupport;


public class CounterDriver {
//    private UT_Counter dut = new UT_Counter();

    @AutoDUT(clockName = "clk")
    private UTCounterWrapper wrapper;

    CounterDriver(){
    }

    public void finish(){
        wrapper.finish();
    }

    public int tick(){
        wrapper.Step();
        return wrapper.getCnt();
//        dut.Step();
//        return dut.count.U64().intValue();
    }

    public void reset(){
        wrapper.setRst(1);
        wrapper.Step();
        wrapper.setRst(0);
//        dut.rst.Set(1);
//        dut.Step();
//        dut.rst.Set(0);
    }
}

