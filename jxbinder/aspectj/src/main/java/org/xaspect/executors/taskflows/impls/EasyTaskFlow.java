package org.xaspect.executors.taskflows.impls;

import org.xaspect.executors.taskflows.TaskFlow;

import java.util.ArrayList;
import java.util.List;

public class EasyTaskFlow implements TaskFlow {
    private List<Runnable> runnables = new ArrayList<>();

    private List<Integer> runnableSteps = new ArrayList<>();

    private int currentTask = 0;

    private int constructorStep = 0;

    @Override
    public void nextTask(int step) {
        if (runnableSteps.isEmpty())return;
        while (currentTask < runnableSteps.size() && runnableSteps.get(currentTask) <= step) {
            runnables.get(currentTask).run();
            currentTask++;
        }
    }

    public EasyTaskFlow adds(Runnable task){
        runnables.add(task);
        runnableSteps.add(constructorStep);
        return this;
    }

    public EasyTaskFlow step(){
        this.constructorStep += 1;
        return this;
    }

    public EasyTaskFlow step(int steps){
        this.constructorStep += steps;
        return this;
    }

    public EasyTaskFlow cloneTasks(int copies){
        List<Runnable> clonedTasks = new ArrayList<>();
        List<Integer> clonedSteps = new ArrayList<>();

        for (int i = 0; i < copies; i++) {
            for (int j = 0; j < runnableSteps.size(); j++) {
                clonedTasks.add(runnables.get(j));
                clonedSteps.add(runnableSteps.get(j) + constructorStep * (i + 1));
            }
        }

        constructorStep *= copies;
        runnables.addAll(clonedTasks);
        runnableSteps.addAll(clonedSteps);
        return this;
    }


}
