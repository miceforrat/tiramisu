package org.xaspect;

import co.paralleluniverse.fibers.FiberExecutorScheduler;
import co.paralleluniverse.fibers.FiberScheduler;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class SingleThreadExecutorScheduler {
    private final ExecutorService singleThreadExecutor;
    private final FiberScheduler scheduler;

    private static final Map<String, SingleThreadExecutorScheduler> instanceMap = new HashMap<String, SingleThreadExecutorScheduler>();

    public static SingleThreadExecutorScheduler getSingleThreadExecutorScheduler(String name) {
        if (instanceMap.get(name) == null) {
            instanceMap.put(name, new SingleThreadExecutorScheduler(name));
        }
        return instanceMap.get(name);
    }

    private SingleThreadExecutorScheduler(String name) {
        singleThreadExecutor = Executors.newSingleThreadExecutor();
        scheduler = new FiberExecutorScheduler(String.format("single-thread-%s", name), singleThreadExecutor);
    }

    public void finish(){
        singleThreadExecutor.shutdown();
        try {
            singleThreadExecutor.awaitTermination(1, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public FiberScheduler getScheduler() {
        return scheduler;
    }
}
