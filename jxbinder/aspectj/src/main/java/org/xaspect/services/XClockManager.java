package org.xaspect.services;

import co.paralleluniverse.fibers.SuspendExecution;

import java.util.function.Consumer;

public interface XClockManager {
    void step();

    void step(int n);

    void stepRis(Consumer<Long> callBacks );
}
