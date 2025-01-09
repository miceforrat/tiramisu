package org.xaspect.clocks;


import com.xspcomm.XClock;
import org.xaspect.DUTWrapper;

import javax.xml.crypto.Data;
import java.nio.channels.Pipe;
import java.util.*;
import java.util.function.Consumer;

public class HWTaskExecutor {
    private PriorityQueue<TaskInfo> taskQueue = new PriorityQueue<>();

    XClock xclock;

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

    private static class DataPipeMapperInstance{

        private Map<String, DataPipe> pipeMap = new HashMap<>();

        public static DataPipeMapperInstance instance = new DataPipeMapperInstance();

        private DataPipeMapperInstance() {}

        public <T, P> void addPipe(String id) {
            pipeMap.put(id, new DataPipe<T, P>());
        }

        public <T> void write(String id, T data) {
            if (pipeMap.containsKey(id)) {
                pipeMap.get(id).sink = data;
            } else {
                System.err.println("Please check if pipe exists!");
            }
        }
    }

    private static class DataPipe<T, P>{
        T sink;
        P source;
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
