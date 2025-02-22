package org.xaspect.executors.taskflows.impls;

import org.xaspect.executors.taskflows.HWTask;

public abstract class OutputPipeTask<O> implements HWTask {
    DataPipe<O> outputPipe;

    String name;

    OutputPipeTask(DataPipe<O> outputPipe, String name) {
        this.outputPipe = outputPipe;
        this.name = name;
    }

    abstract O doExecute();

    @Override
    public void execute() {
        outputPipe.data.put(name, doExecute());
    }
}
