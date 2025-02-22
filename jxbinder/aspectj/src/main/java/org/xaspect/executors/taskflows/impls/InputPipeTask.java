package org.xaspect.executors.taskflows.impls;

import org.xaspect.executors.taskflows.HWTask;

public abstract class InputPipeTask<T> implements HWTask {
    DataPipe<T> inputPipe;

    String name;

    InputPipeTask(DataPipe<T> inputPipe, String name) {
        this.inputPipe = inputPipe;
        this.name = name;
    }

    abstract void doExecute(T input);

    @Override
    public void execute() {
        doExecute(inputPipe.data.get(name));
    }
}