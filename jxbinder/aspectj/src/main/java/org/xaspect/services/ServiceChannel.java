package org.xaspect.services;

import java.util.ArrayList;
import java.util.List;

public class ServiceChannel {

    XClockManager mainClock = null;

    private interface ServiceInChannel {
        void run();
        XClockManager getServiceClock();
    }

    private static class NormalXService implements ServiceInChannel {
        private final XService service;
        private final List<Object> params;

        NormalXService(XService service, List<Object> params) {
            this.service = service;
            this.params = params;
        }

        @Override
        public void run() {
            this.service.run(params);
        }

        @Override
        public XClockManager getServiceClock() {
            return service.getClockManager();
        }
    }


    private static class RunnableXService implements ServiceInChannel {
        private final Runnable runnable;
        private final XClockManager clockManager;
        RunnableXService(Runnable runnable, XClockManager clockManager) {

            this.runnable = runnable;
            this.clockManager = clockManager;
        }

        @Override
        public void run() {
            this.runnable.run();
        }

        @Override
        public XClockManager getServiceClock() {
            return this.clockManager;
        }
    }


    //这个类是内部使用，用于主时钟的Step
    private static class StepXService implements ServiceInChannel {
        XClockManager clockManager;
        int step;
        StepXService(XClockManager clockManager, int step) {
            this.clockManager = clockManager;
            this.step = step;
        }

        @Override
        public void run() {
            this.clockManager.Step(step);
        }

        @Override
        public XClockManager getServiceClock() {
            return null;
        }
    }

    private final List<ServiceInChannel> serviceInChannels = new ArrayList<>();

    ServiceChannel() {}

    ServiceChannel(XClockManager mainClock) {
        this.mainClock = mainClock;
    }

    public ServiceChannel addXService(XService service) {
        checkMainClock(mainClock);
        this.serviceInChannels.add(new NormalXService(service, null));
        return this;
    }

    public ServiceChannel addXService(XService service, List<Object> params) {
        checkMainClock(service.getClockManager());
        this.serviceInChannels.add(new NormalXService(service, params));
        return this;
    }

    public ServiceChannel addRunnable(Runnable runnable, XClockManager clock) {
        checkMainClock(clock);
        this.serviceInChannels.add(new RunnableXService(runnable, clock));
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

    void run(){
        for (ServiceInChannel serviceInChannel : serviceInChannels) {
            serviceInChannel.run();
        }
        this.mainClock.unregister();
    }

    void checkMainClock(XClockManager clock) {
        if (mainClock == null) {
            mainClock = clock;
        } else {
            if (!mainClock.equals(clock)) {
                throw new IllegalStateException("channel clock is not the same as new clock");
            }
        }
    }



}
