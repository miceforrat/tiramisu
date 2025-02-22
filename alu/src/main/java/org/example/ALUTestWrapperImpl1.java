package org.example;

import com.ut.UT_ALU;
import com.xspcomm.XClock;
import org.xaspect.datas.Pin;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.*;

public class ALUTestWrapperImpl1 implements ALUTestWrapper {

    private final int WAITERS = 1;

    private boolean running = true;

    private final BlockingQueue<DUTReq<?>> reqs = new LinkedBlockingQueue<>();

    private Map<DUTEvent, Semaphore> semaphoreMap = new HashMap<>();

    ALUTestWrapperImpl1() {

        semaphoreMap.put(DUTEvent.OUT, new Semaphore(0));

        semaphoreMap.put(DUTEvent.STEP, new Semaphore(0));

        Thread aluThread = new Thread(() -> {
            UT_ALU alu = new UT_ALU();
            while (running) {
                try {
                    DUTReq<?> req = reqs.take();
                    if (req.event == DUTEvent.POST_IN){
                        ALUIO io = (ALUIO) req.result;
                        alu.a.Set(io.ab.a);
                        alu.b.Set(io.ab.b);
                        alu.alu_sel.Set(io.sel.sel);
                    } else if (req.event == DUTEvent.STEP){
                        alu.Step();
                        semaphoreMap.get(DUTEvent.STEP).release(WAITERS);
                    } else if (req.event == DUTEvent.OUT){
                        ((DUTReq<Integer>) req).result = alu.alu_out.U().intValue();
                        semaphoreMap.get(DUTEvent.OUT).release();
                    }
                } catch (InterruptedException  e) {
                    e.printStackTrace();
                }
            }
            alu.Finish();
        });
        aluThread.start();


    }

    @Override
    public void postIn(ALUIO in) {
        DUTReq<ALUIO> req = new DUTReq<>(DUTEvent.POST_IN);
        req.result = in;
        reqs.add(req);
    }

    @Override
    public @Pin int getOut() {
        DUTReq<Integer> req = new DUTReq<>(DUTEvent.OUT);
        reqs.add(req);
        try {
            semaphoreMap.get(DUTEvent.OUT).acquire();
            return req.result;
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void Step() {
        DUTReq<?> req = new DUTReq<Void>(DUTEvent.STEP);
        reqs.add(req);

        try {
            semaphoreMap.get(DUTEvent.STEP).acquire();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void Step(int term) {
        for (int i = 0; i < term; i++){
            this.Step();
        }
    }

    @Override
    public void finish() {
        this.running = false;
        this.reqs.add(new DUTReq(DUTEvent.NOTHING));
    }

    private enum DUTEvent{
        NOTHING, STEP, POST_IN, OUT
    }

    private static class DUTReq<T>{
        DUTEvent event;
        T result;

        DUTReq(DUTEvent event){
            this.event = event;
        }
    }

}
