package org.xaspect.executors.taskflows.impls;

import org.xaspect.executors.taskflows.HWTask;

public class EasyHWTask implements HWTask {

    Runnable runnable;

    EasyHWTask(Runnable runnable) {
        this.runnable = runnable;
    }

    @Override
    public void execute() {
        this.runnable.run();
    }
}
