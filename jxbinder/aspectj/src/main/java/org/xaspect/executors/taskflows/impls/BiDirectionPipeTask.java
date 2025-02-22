package org.xaspect.executors.taskflows.impls;

import org.xaspect.executors.taskflows.HWTask;

public abstract class BiDirectionPipeTask<T, O> implements HWTask {

    DataPipe<T> inputPipe;

    DataPipe<O> outputPipe;

    String inputName;

    String outputName;

    BiDirectionPipeTask(DataPipe<T> inputPipe, DataPipe<O> outputPipe, String inputName, String outputName) {
        this.inputPipe = inputPipe;
        this.outputPipe = outputPipe;
        this.inputName = inputName;
        this.outputName = outputName;
    }

    abstract O doExecute(T params);

    @Override
    public void execute(){
        outputPipe.data.put(outputName, doExecute(inputPipe.data.get(inputName)));
    }
}
