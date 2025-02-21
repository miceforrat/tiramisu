package org.example;

import com.ea.async.Async;
import com.ut.UT_ALU;
import com.xspcomm.XClock;
import org.xaspect.datas.Pin;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.*;

public class ALUTestWrapperImpl1 implements ALUTestWrapper {
    private UT_ALU alu;

    private static boolean asyncInit = false;

    private final ExecutorService executor = Executors.newSingleThreadExecutor();

    private final int WAITERS = 1;

//    private volatile Set<Semaphore> sems = new HashSet<>();


    private boolean running = true;

    private CompletableFuture<Void> task;

    private boolean inited = false;

    private final BlockingQueue<DUTReq<?>> reqs = new LinkedBlockingQueue<>();

    private Map<DUTEvent, Semaphore> semaphoreMap = new HashMap<>();

    ALUTestWrapperImpl1() {
        semaphoreMap.put(DUTEvent.POST_IN, new Semaphore(0));

        semaphoreMap.put(DUTEvent.OUT, new Semaphore(0));

        semaphoreMap.put(DUTEvent.STEP, new Semaphore(0));


        if (!asyncInit) {
            asyncInit = true;
            Async.init();
        }

        task = CompletableFuture.runAsync(() -> {
            alu = new UT_ALU();
            inited = true;
            int currentWait = 0;
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
        }, executor);

        while(!inited);
//        reqs.add(new DUTReq<Object>(null, DUTEvent.));


    }

    @Override
    public void postIn(ALUIO in) {
//        DUTReq<Void> req = new DUTReq<>(new FutureTask<>(() -> {
//            alu.a.Set(in.ab.a);
//            alu.b.Set(in.ab.b);
//            alu.alu_sel.Set(in.sel.sel);
////            System.out.println(Thread.currentThread().getName() + " posting aluio");
//        }, null), DUTEvent.XDATAS);
//        reqs.add(req);
        DUTReq<ALUIO> req = new DUTReq<>(DUTEvent.POST_IN);
        req.result = in;
        reqs.add(req);
//        try {
//            req.latch.await();
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }

//        try {
//            req.future.get();
//        } catch (InterruptedException | ExecutionException e) {
//            e.printStackTrace();
////            throw new RuntimeException(e);
//        }

    }

    @Override
    public @Pin int getOut() {
//        DUTReq<Integer> req = new DUTReq<>(new FutureTask<>(new Callable<>() {
//            @Override
//            public Integer call() {
//                return alu.alu_out.U().intValue();
//            }
//        }), DUTEvent.XDATAS);
//        reqs.add(req);
//        try {
//            return req.future.get();
//        } catch (ExecutionException | InterruptedException e) {
//            e.printStackTrace();
////            throw new RuntimeException(e);
//        }
        DUTReq<Integer> req = new DUTReq<>(DUTEvent.OUT);
        reqs.add(req);
        try {
            semaphoreMap.get(DUTEvent.OUT).acquire();
            return req.result;
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
//        try {
//            req.latch.await();
//            return req.result;
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
//        return 0;
//        return alu.alu_out.U().intValue();
    }

    @Override
    public void Step() {
//        Semaphore sem = new Semaphore(0);
//        sems.add(sem);
        DUTReq<?> req = new DUTReq<Void>(DUTEvent.STEP);
        reqs.add(req);

        try {
            semaphoreMap.get(DUTEvent.STEP).acquire();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

//        try {
//            req.latch.await();
//        } catch (InterruptedException | RuntimeException e) {
//            e.printStackTrace();
//        }
//        sems.remove(sem);
    }

    @Override
    public void Step(int term) {
        for (int i = 0; i < term; i++){
            this.Step();
        }
    }

    @Override
    public XClock getXClock() {
        return alu.xclock;
    }

    @Override
    public void finish() {
        this.running = false;
        this.reqs.add(new DUTReq(DUTEvent.NOTHING));
        task.join();

        executor.shutdown();

    }

    private enum DUTEvent{
        NOTHING, STEP, POST_IN, OUT
    }

    private static class DUTReq<T>{
//        Future<T> future;
        DUTEvent event;
        T result;

        DUTReq(DUTEvent event){
            this.event = event;
        }
//        DUTReq(Future<T> runnable, DUTEvent event){
//            this.future = runnable;
//            this.event = event;
//        }
    }

}
