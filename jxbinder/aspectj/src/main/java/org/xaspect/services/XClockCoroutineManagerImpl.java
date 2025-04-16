package org.xaspect.services;

import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.fibers.FiberScheduler;
import co.paralleluniverse.fibers.SuspendExecution;
import co.paralleluniverse.fibers.Suspendable;
import com.xspcomm.XClock;

import java.util.*;
import java.util.concurrent.ExecutionException;
import java.util.function.Consumer;
import java.util.function.Supplier;

public class XClockCoroutineManagerImpl implements XClockCoroutineManager {
    private XClock clock;

    private CoroutinePhaser workingStagePhaser;

    private CoroutinePhaser daemonStagePhaser;

    private boolean launched = false;

    private  Fiber<?> currentFiber;

    private final FiberScheduler scheduler;


//    private int clockWaiters = 0;

    XClockCoroutineManagerImpl(XClock clock, FiberScheduler scheduler) {
        this(clock, 0, scheduler);
    }

    XClockCoroutineManagerImpl(XClock clock, int num, FiberScheduler scheduler) {
        this.clock = clock;
        this.scheduler = scheduler;
        this.workingStagePhaser = new CoroutinePhaser(num, "working_stage_phaser");
        this.daemonStagePhaser = new CoroutinePhaser(num + 1, "daemon_stage_phaser");
    }

    public void register(){
        register(1);
    }

    public void register(int num){
        workingStagePhaser.register(num);
        daemonStagePhaser.register(num);
    }

    @Suspendable
    public void deregister(){
        workingStagePhaser.arriveAndDeregister();
        daemonStagePhaser.arriveAndDeregister();
    }


    @Suspendable
    private void coroutineStep() throws SuspendExecution{
        workingStagePhaser.arriveAndAwaitAdvance();
        daemonStagePhaser.arriveAndAwaitAdvance();
    }

    @Suspendable
    public void step(){
        if (!launched){
            throw new UnsupportedOperationException("PLEASE start the clock by calling start(FiberScheduler) method before you step!\n" +
                    "A more recommended method is to directly declare a class extending the DUTCoroutineManager class and use its start method after adding all the suspendable runnables!");
        }

        try {
            coroutineStep();
        } catch (SuspendExecution e) {
            throw new RuntimeException(e);
        }
    }

    public void step(int n){
        for (int i = 0; i<n; i++){
            step();
        }
    }

    @Override
    public void start() {
        launched = true;
        currentFiber = new Fiber<>(scheduler, this::runHookFiber).start();
    }

    @Suspendable
    private void runHookFiber() throws SuspendExecution, InterruptedException {
        int lastPhase = workingStagePhaser.getPhase();
//        System.out.println("HOOK before:"+lastPhase);
        while (!workingStagePhaser.isTerminated()) {
            int current = workingStagePhaser.awaitAdvance(lastPhase, Fiber.currentFiber());
            clock.Step();
            daemonStagePhaser.arriveAndAwaitAdvance();
            lastPhase = current;
        }
        daemonStagePhaser.arriveAndDeregister();
    }

    @Override
    public void stepRis(Consumer<Long> callBacks ){
        this.clock.StepRis(callBacks);
    }

    @Override
    public void join() throws InterruptedException, ExecutionException {
        this.currentFiber.join();
    }

    @Override
    @Suspendable
    public void awaitCond(Supplier<Boolean> condition) {
        while (!condition.get()) {
            this.step();
        }
    }

    //    @Override
//    public void createCond(String condId, Supplier<Boolean> condition) {
//        this.conditionManager.createWaitCondition(condId, condition);
//    }
//
//    @Override
//    public void awaitCond(String condId) {
//        //TODO: need to be tested further more
//        this.conditionManager.lock(condId);
//        while (!conditionManager.check(condId)){
//            this.cntLock.lock();
//            clockWaiters += 1;
//            check(true, ()-> {
//                cntLock.unlock();
//                conditionManager.waitOn(condId);
//            });
//            this.conditionManager.lock(condId);
//        }
//        this.conditionManager.unlock(condId);
//    }

}
