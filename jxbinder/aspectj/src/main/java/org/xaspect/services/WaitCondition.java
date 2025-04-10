package org.xaspect.services;


import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.function.Supplier;

public class WaitCondition {
    private final Supplier<Boolean> conditionSupplier;
    private final Lock lock = new ReentrantLock();
    private final Condition condition = lock.newCondition();


    WaitCondition(Supplier<Boolean>condRunnable) {
        if (condRunnable == null) {
            throw new IllegalArgumentException("condRunnable is null");
        }
        this.conditionSupplier = condRunnable;
    }

    void lock(){
        lock.lock();
    }

    void unlock(){
        lock.unlock();
    }

    boolean check(){
        return conditionSupplier.get();
    }

    void await() {
        this.condition.awaitUninterruptibly();
    }

    void signalAll(){
        this.condition.signalAll();
    }

//    void waitCondition() {
//        lock.lock();
//        try {
//            boolean firstWait = true;
//            while (!conditionSupplier.get()) {
//                if (firstWait) {
//                    waitConditionManager.registerWaitCondition(this); // ✅ 只有真的需要等时才通知
//                    firstWait = false;
//                }
//                condition.awaitUninterruptibly();
//            }
//        } finally {
//            lock.unlock();
//        }
//    }
//
//    void checkConditionWithSignal(){
//        lock.lock();
//        if (conditionSupplier.get()) {
//            condition.signalAll();
//        }
//        lock.unlock();
//    }
//
//    boolean checkCondition() {
//        lock.lock();
//        boolean res = conditionSupplier.get();
//        lock.unlock();
//        return res;
//    }

}
