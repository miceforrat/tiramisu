package org.xaspect.executors.taskflows;


import com.xspcomm.XClock;

import java.util.ArrayList;
import java.util.List;
import java.util.PriorityQueue;

public class HWTaskFlowExecutor {

    private XClock clock;

    private PriorityQueue<HWTaskInfo> tasks;

    HWTaskFlowExecutor(XClock clock) {
        this.clock = clock;
    }

    public HWTaskFlow flowBuilder(){
        return new HWTaskFlow();
    }

    public void addHWTaskFlow(HWTaskFlow taskFlow){
        tasks.addAll(taskFlow.tasks);
    }

    public void execute(){
        int stepCount = 0;
        if (clock == null){
            throw new RuntimeException("XClock is null!");
        }
        while (!tasks.isEmpty()) {
            while (!tasks.isEmpty() && stepCount == tasks.peek().steps) {

                tasks.poll().task.execute();
            }

            clock.Step();
            stepCount+=1;
        }
    }

    private static class HWTaskInfo implements Comparable<HWTaskInfo> {
        HWTask task;
        int steps;

        HWTaskInfo(HWTask task, int steps) {
            this.task = task;
            this.steps = steps;
        }

        @Override
        public int compareTo(HWTaskInfo hwTaskInfo) {
            return 0;
        }
    }

    public static class HWTaskFlow {
        List<HWTaskInfo> tasks = new ArrayList<>();

        private int steps = 0;

        public HWTaskFlow create(){
            return new HWTaskFlow();
        }

        public HWTaskFlow adds(HWTask task){
            tasks.add(new HWTaskInfo(task, steps));
            return this;
        }

        public HWTaskFlow step(){
            this.steps += 1;
            return this;
        }

        public HWTaskFlow step(int steps){
            this.steps += steps;
            return this;
        }

        public HWTaskFlow cloneTasks(int copies){
            List<HWTaskInfo> clonedTasks = new ArrayList<>();

            for (int i = 0; i < copies; i++) {
                for (HWTaskInfo taskInfo : tasks) {
                    HWTaskInfo taskInfoClone = new HWTaskInfo(taskInfo.task, steps * (i+1) + taskInfo.steps);
                    clonedTasks.add(taskInfoClone);
                }
            }

            steps *= copies;
            tasks.addAll(clonedTasks);
            return this;
        }
    }
}
