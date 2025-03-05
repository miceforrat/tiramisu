package org.example;

import com.ut.UT_ALU;
import com.xspcomm.XClock;
import com.xspcomm.XData;
import org.xaspect.datas.Pin;

import java.util.*;
import java.util.concurrent.*;
import java.util.function.Supplier;

public class ALUTestWrapperImpl1 implements ALUTestWrapper {

    private UT_ALU alu;

    private final int WAITERS = 1;

    @Override
    public void reset() {

    }

    private boolean running = true;

    private final BlockingQueue<DUTReq<?>> reqs = new LinkedBlockingQueue<>();

    private Map<DUTEvent, Semaphore> semaphoreMap = new HashMap<>();

    private Map<DUTEvent, DUTConsumer> consumerMap = new HashMap<>();

    private int waitOnStep = 0;

    private int out = 0;

    private List<Supplier<?>> afterStep = new ArrayList<>();

    ALUTestWrapperImpl1() {


        semaphoreMap.put(DUTEvent.STEP, new Semaphore(0));
        consumerMap.put(DUTEvent.STEP, req -> {
            waitOnStep += 1;
            if (waitOnStep >= WAITERS) {
                alu.Step();
                out = alu.alu_out.U().intValue();
                semaphoreMap.get(DUTEvent.STEP).release(WAITERS);
            }
        });

        consumerMap.put(DUTEvent.NOTHING, req -> {

        });
        Thread aluThread = new Thread(() -> {
            alu = new UT_ALU();
            while (running) {
                try {
                    DUTReq<?> req = reqs.take();
                    consumerMap.get(req.event).dealWithReq(req);
//                    if (req.event == DUTEvent.POST_IN){
//                        ALUIO io = (ALUIO) req.result;
//                        alu.a.Set(io.ab.a);
//                        alu.b.Set(io.ab.b);
//                        alu.alu_sel.Set(io.sel.sel);
//                    } else if (req.event == DUTEvent.STEP){
//                        alu.Step();
//                        semaphoreMap.get(DUTEvent.STEP).release(WAITERS);
//                    } else if (req.event == DUTEvent.OUT){
//                        ((DUTReq<Integer>) req).result = alu.alu_out.U().intValue();
//                        semaphoreMap.get(DUTEvent.OUT).release();
//                    }
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

        if (!consumerMap.containsKey(DUTEvent.POST_IN)){

            consumerMap.put(DUTEvent.POST_IN, req -> {
                Map<Integer, Object> map = (HashMap) req.result;
                ALUIO io = (ALUIO) map.get(0);
                alu.a.Set(io.ab.a);
                alu.b.Set(io.ab.b);
                alu.alu_sel.Set(io.sel.sel);
            });
        }

        DUTReq<Map<Integer, Object>> req = new DUTReq<>(DUTEvent.POST_IN);
        req.result = new HashMap<>();
        req.result.put(0, in);
        reqs.add(req);
    }





    @Override
    public @Pin int getOut() {

//        if (!consumerMap.containsKey(DUTEvent.OUT)){
//            semaphoreMap.put(DUTEvent.OUT, new Semaphore(0));
//            consumerMap.put(DUTEvent.OUT, new DUTConsumer() {
//                @Override
//                public void dealWithReq(DUTReq<?> req) {
//                    ((DUTReq<Integer>) req).result = alu.alu_out.U().intValue();
//                    semaphoreMap.get(DUTEvent.OUT).release();
//                }
//            });
//        }
//
//
//        DUTReq<Integer> req = new DUTReq<>(DUTEvent.OUT);
//        reqs.add(req);
//        try {
//            semaphoreMap.get(DUTEvent.OUT).acquire();
//            return req.result;
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        return this.out;
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

    private interface DUTConsumer{
        void dealWithReq(DUTReq<?> req);
    }

}
