package org.xaspect.services;

import com.xspcomm.XClock;

import java.util.HashMap;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Set;
import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.function.Consumer;
import java.util.function.Supplier;

public class XClockManagerImpl implements XClockManager {
    private XClock clock;

    private final Lock cntLock = new ReentrantLock();
    private final Condition waitClock = cntLock.newCondition();

    private int clockWaiters = 0;

    XClockManagerImpl(XClock clock) {
        this.clock = clock;
    }


    private final WaitConditionManager conditionManager = new WaitConditionManagerImpl();

    private final Map<String, Boolean> isBlocked = new HashMap();

    private final Map<String, Integer> priorities = new HashMap();

    public void register(){
        register(0);
    }

    public void register(int priority){
        cntLock.lock();
        priorities.put(Thread.currentThread().getName(), priority);
        isBlocked.put(Thread.currentThread().getName(), false);
        cntLock.unlock();
    }

    public void unregister(){
        cntLock.lock();
        priorities.remove(Thread.currentThread().getName());
        check(false, null);
    }

    private void check(boolean stay, Runnable waitAction){
        if (priorities.size() <= 0) {
            cntLock.unlock();
        }else if (clockWaiters >= priorities.size()){
            clockWaiters = 0;
            stepClock();
            waitClock.signalAll();
            cntLock.unlock();
        } else if (stay){
            isBlocked.put(Thread.currentThread().getName(), true);
            assert waitAction != null;
            waitAction.run();
            isBlocked.put(Thread.currentThread().getName(), false);
        } else {
            cntLock.unlock();
        }
    }

    private void stepClock(){
        clock.Step();
        conditionManager.checkAll();
    }

    public void Step(){
        cntLock.lock();
        // TODO: multi waiters need to be check further more
        clockWaiters += 1;
        //进入临界区
        check(true, waitClock::awaitUninterruptibly);
//        }
    }

    public void Step(int n){
        for (int i = 0; i<n; i++){
            Step();
        }
    }

    public void stepRis(Consumer<Long> callBacks ){
        this.clock.StepRis(callBacks);
    }

    @Override
    public void createCond(String condId, Supplier<Boolean> condition) {
        this.conditionManager.createWaitCondition(condId, condition);
    }

    @Override
    public void awaitCond(String condId) {
        //TODO: need to be tested further more
        this.conditionManager.lock(condId);
        while (!conditionManager.check(condId)){
            this.cntLock.lock();
            clockWaiters += 1;
            check(true, ()-> {
                cntLock.unlock();
                conditionManager.waitOn(condId);
            });
            this.conditionManager.lock(condId);
        }
        this.conditionManager.unlock(condId);
    }
}
