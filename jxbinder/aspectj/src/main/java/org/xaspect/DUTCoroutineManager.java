package org.xaspect;

import co.paralleluniverse.fibers.Suspendable;
import co.paralleluniverse.strands.SuspendableRunnable;

public interface DUTCoroutineManager<DUT> extends DUTManager<DUT> {
    void start();

    @Suspendable
    void addSuspendableRunnable(SuspendableRunnable suspendableRunnable);
}
