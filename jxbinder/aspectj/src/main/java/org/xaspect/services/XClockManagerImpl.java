package org.xaspect.services;

import co.paralleluniverse.fibers.SuspendExecution;
import com.xspcomm.XClock;

import java.util.function.Consumer;

public class XClockManagerImpl implements XClockManager {
    private final XClock clock;

    XClockManagerImpl(XClock clock) {
        this.clock = clock;
    }

    @Override
    public void step() {
        clock.Step();
    }

    @Override
    public void step(int n) {
        clock.Step(n);
    }

    @Override
    public void stepRis(Consumer<Long> callBacks) {
        clock.StepRis(callBacks);
    }
}
