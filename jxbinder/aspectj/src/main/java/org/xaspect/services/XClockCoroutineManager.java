package org.xaspect.services;


import co.paralleluniverse.fibers.FiberScheduler;
import co.paralleluniverse.fibers.SuspendExecution;

import java.util.concurrent.ExecutionException;
import java.util.function.Consumer;
import java.util.function.Supplier;

public interface XClockCoroutineManager extends XClockManager {
    void register();

    void register(int num);

    void deregister();

    void start();

    void join() throws InterruptedException, ExecutionException;

    void awaitCond(Supplier<Boolean> condition);
//    void createCond(String condId, Supplier<Boolean> condition);
//
//    void awaitCond(String condId);
}
