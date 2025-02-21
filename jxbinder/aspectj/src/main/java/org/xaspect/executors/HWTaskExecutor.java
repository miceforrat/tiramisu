package org.xaspect.executors;


import com.xspcomm.XClock;

import java.util.*;

public class HWTaskExecutor {
    private PriorityQueue<TaskInfo> taskQueue = new PriorityQueue<>();

    private XClock xclock;

    public void bindClock(XClock clock) {
        this.xclock = clock;
    }

    public void submit(TaskFlow tasks) {
        taskQueue.addAll(tasks.tasks);
    }

    public TaskFlow taskBuilder(){
        return new TaskFlow();
    }

    public void execute(){
        int stepCount = 0;
        if (xclock == null){
            throw new RuntimeException("XClock is null!");
        }
        while (!taskQueue.isEmpty()) {
            while (!taskQueue.isEmpty() && stepCount == taskQueue.peek().steps) {
                Runnable task = taskQueue.poll().task;
                task.run();
            }

            xclock.Step();
            stepCount+=1;
        }
    }


    private static class TaskInfo implements Comparable<TaskInfo> {
        int steps;
        Runnable task;

        @Override
        public int compareTo(TaskInfo o) {
            return Integer.compare(steps, o.steps);
        }

        public TaskInfo(Runnable task, int steps) {
            this.task = task;
            this.steps = steps;
        }
    }

    public static class TaskFlow{
        private List<TaskInfo> tasks = new ArrayList<>();
        private int steps = 0;
        private TaskFlow(){

        }

        public TaskFlow create(){
            return new TaskFlow();
        }

        public TaskFlow adds(Runnable task){
            tasks.add(new TaskInfo(task, steps));
            return this;
        }

        public TaskFlow step(){
            this.steps += 1;
            return this;
        }

        public TaskFlow step(int steps){
            this.steps += steps;
            return this;
        }

        public TaskFlow cloneTasks(int copies){
            List<TaskInfo> clonedTasks = new ArrayList<>();

            for (int i = 0; i < copies; i++) {
                for (TaskInfo taskInfo : tasks) {
                    TaskInfo taskInfoClone = new TaskInfo(taskInfo.task, steps * (i+1) + taskInfo.steps);
                    clonedTasks.add(taskInfoClone);
                }
            }

            steps *= copies;
            tasks.addAll(clonedTasks);
            return this;
        }

    }
}
