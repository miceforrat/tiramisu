package org.xaspect.services;

import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.fibers.FiberScheduler;
import co.paralleluniverse.fibers.SuspendExecution;
import org.xaspect.InnerThreadPool;

import java.util.*;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.Semaphore;

public class ServiceRunner {

    public ServiceRunner(XClockCoroutineManager xClockCoroutineManager, FiberScheduler fiberScheduler) {
        this.coroutineManager = xClockCoroutineManager;
        this.scheduler = fiberScheduler;
    }

    private ServiceChannel currentChannel;
    private final Map<String, ServiceChannel> serviceChannelMap = new HashMap<>();
    private final XClockCoroutineManager coroutineManager;
    private final FiberScheduler scheduler;

    public ServiceChannel getChannel(String id){
        if (!serviceChannelMap.containsKey(id)){
            serviceChannelMap.put(id, new ServiceChannel(coroutineManager));
        }

        currentChannel = serviceChannelMap.get(id);
        return serviceChannelMap.get(id);
    }


    public void runAll(){

        int size = serviceChannelMap.size();
        coroutineManager.register(size);
        coroutineManager.start();

        for (ServiceChannel serviceChannel : serviceChannelMap.values()) {
            new Fiber<>(scheduler, serviceChannel).start();
        }

        try {
            coroutineManager.join();
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException(e);
        }

    }

    public void clear(){
        serviceChannelMap.clear();
    }


}
