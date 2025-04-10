package org.xaspect.services;


import java.util.function.Consumer;
import java.util.function.Supplier;

public interface XClockManager {
    void register();

    void register(int priority);

    void unregister();

    void Step();

    void Step(int n);

    void stepRis(Consumer<Long> callBacks );

    void createCond(String condId, Supplier<Boolean> condition);

    void awaitCond(String condId);
}
