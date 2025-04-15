package org.xaspect.services;

import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.fibers.FiberScheduler;
import co.paralleluniverse.fibers.SuspendExecution;
import co.paralleluniverse.fibers.Suspendable;
import co.paralleluniverse.strands.SuspendableRunnable;

import java.util.ArrayList;
import java.util.List;

public class ServiceChannel implements SuspendableRunnable{

    XClockCoroutineManager mainClock = null;

    private interface ServiceInChannel extends SuspendableRunnable {
//        void run();
//        XClockCoroutineManager getServiceClock();
    }


    private static class RunnableXService implements ServiceInChannel {
        private final SuspendableRunnable runnable;
//        private final XClockCoroutineManager clockManager;
        RunnableXService(SuspendableRunnable runnable) {

            this.runnable = runnable;
//            this.clockManager = clockManager;
        }

        @Override
        public void run() throws SuspendExecution, InterruptedException {
            this.runnable.run();
        }

//        @Override
//        public XClockCoroutineManager getServiceClock() {
//            return this.clockManager;
//        }
    }


    //这个类是内部使用，用于主时钟的Step
    private static class StepXService implements ServiceInChannel {
        XClockCoroutineManager clockManager;
        int step;
        StepXService(XClockCoroutineManager clockManager) {
            this(clockManager, 1);
        }

        StepXService(XClockCoroutineManager clockManager, int step) {
            this.clockManager = clockManager;
            this.step = step;
        }

        @Override
        public void run() throws SuspendExecution, InterruptedException {
            this.clockManager.step(step);
        }

//        @Override
//        public XClockCoroutineManager getServiceClock() {
//            return clockManager;
//        }
    }

    private final List<ServiceInChannel> serviceInChannels = new ArrayList<>();

    ServiceChannel() {}

    ServiceChannel(XClockCoroutineManager mainClock) {
        this.mainClock = mainClock;
    }


    public ServiceChannel addSuspendableRunnable(SuspendableRunnable runnable) {
//        checkMainClock(clock);
        this.serviceInChannels.add(new RunnableXService(runnable));
        return this;
    }

    public ServiceChannel step(){
        if (mainClock == null){
            throw new IllegalStateException("mainClock is null, set it before step");
        }
        this.serviceInChannels.add(new StepXService(mainClock, 1));
        return this;
    }

    public ServiceChannel step(int term){
        if (mainClock == null){
            throw new IllegalStateException("mainClock is null, set it before step");
        }
        this.serviceInChannels.add(new StepXService(mainClock, term));
        return this;
    }

    void register(){
        this.mainClock.register();
    }

    @Override
    @Suspendable
    public void run() throws SuspendExecution, InterruptedException {
        for (ServiceInChannel serviceInChannel : serviceInChannels) {
            serviceInChannel.run();
        }
        mainClock.deregister();
    }

    //    void run(){
//        for (ServiceInChannel serviceInChannel : serviceInChannels) {
//            try {
//                serviceInChannel.run();
//            } catch (SuspendExecution | InterruptedException e) {
//                throw new RuntimeException(e);
//            }
//        }
//
//    }

    void checkMainClock(XClockCoroutineManager clock) {
        if (mainClock == null) {
            mainClock = clock;
        } else {
            if (!mainClock.equals(clock)) {
                throw new IllegalStateException("channel clock is not the same as new clock");
            }
        }
    }



}
