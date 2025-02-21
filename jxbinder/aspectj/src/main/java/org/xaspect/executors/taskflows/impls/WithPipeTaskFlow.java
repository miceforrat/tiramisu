package org.xaspect.executors.taskflows.impls;


import org.xaspect.executors.taskflows.TaskFlow;

import java.util.ArrayList;
import java.util.Map;
import java.util.List;

public class WithPipeTaskFlow implements TaskFlow {

    List<PipeTask> pipeTaskList = new ArrayList<>();

    List<Integer> steps = new ArrayList<>();

    int currentTaskIdx = 0;

    int constructorStep = 0;

    @Override
    public void nextTask(int step) {
        if (steps.isEmpty())return;
        while (currentTaskIdx < steps.size() && steps.get(currentTaskIdx) <= step) {
            pipeTaskList.get(currentTaskIdx).doExecute();
            currentTaskIdx++;
        }
    }

    public WithPipeTaskFlow adds(PipeTask task){
        pipeTaskList.add(task);
        steps.add(constructorStep);
        return this;
    }

    public WithPipeTaskFlow step(){
        this.constructorStep += 1;
        return this;
    }

    public WithPipeTaskFlow step(int steps){
        this.constructorStep += steps;
        return this;
    }

    public WithPipeTaskFlow cloneTasks(int copies){
        List<PipeTask> clonedTasks = new ArrayList<>();
        List<Integer> clonedSteps = new ArrayList<>();

        for (int i = 0; i < copies; i++) {
            for (int j = 0; j < steps.size(); j++) {
                clonedTasks.add(pipeTaskList.get(j));
                clonedSteps.add(steps.get(j) + constructorStep * (i + 1) );
            }
        }

        constructorStep *= copies;
        pipeTaskList.addAll(clonedTasks);
        steps.addAll(clonedSteps);
        return this;
    }



    private interface PipeTask{
        void doExecute();
    }

    public abstract class OutputPipeTask<O> implements PipeTask{
        DataPipe<O> outputPipe;

        String name;

        OutputPipeTask(DataPipe<O> outputPipe, String name) {
            this.outputPipe = outputPipe;
            this.name = name;
        }

        abstract O execute();

        @Override
        public void doExecute() {
            outputPipe.data.put(name, execute());
        }
    }

    public abstract class InputPipeTask<T> implements PipeTask{
        DataPipe<T> inputPipe;

        String name;

        InputPipeTask(DataPipe<T> inputPipe, String name) {
            this.inputPipe = inputPipe;
            this.name = name;
        }

        abstract void execute(T input);

        @Override
        public void doExecute() {
            execute(inputPipe.data.get(name));
        }
    }

    public abstract class BiDirectionPipeTask<T, O> implements PipeTask{

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

        abstract O execute(T params);

        @Override
        public void doExecute(){
            outputPipe.data.put(outputName, execute(inputPipe.data.get(inputName)));
        }
    }

    public static class DataPipe<T>{
        Map<String, T> data;

        boolean valueEquals(String key1, String key2) {
            return data.get(key1).equals(data.get(key2));
        }
    }


}
