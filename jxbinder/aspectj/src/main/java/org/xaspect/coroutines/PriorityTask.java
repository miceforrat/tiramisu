package org.xaspect.coroutines;



public class PriorityTask implements Comparable<PriorityTask>{
    int priority;
    Runnable task;


    @Override
    public int compareTo(PriorityTask o) {
        return priority - o.priority;
    }



    public PriorityTask(int priority, Runnable task) {
        this.priority = priority;
        this.task = task;
    }
}
