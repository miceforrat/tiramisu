package org.xaspect.coroutines;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.PriorityBlockingQueue;

public class CoroutineScheduler {

    private static CoroutineScheduler instance;
    private final PriorityBlockingQueue<PriorityTask> coroutineTasks; // 线程安全的优先队列
    private final Map<String, PriorityTask> pausedTasks;
    private final Thread schedulerThread;
    private volatile boolean running = true;
    private volatile int currentPriority;

    private CoroutineScheduler() {
        // 初始化任务队列（带优先级）
        this.coroutineTasks = new PriorityBlockingQueue<>();
        this.pausedTasks = new HashMap<>();

        // 创建并启动调度线程
        this.schedulerThread = new Thread(this::processTasks);
        this.schedulerThread.setDaemon(true); // 设为守护线程，防止阻塞程序关闭
        this.schedulerThread.start();
    }

    public static synchronized CoroutineScheduler getInstance() {
        if (instance == null) {
            instance = new CoroutineScheduler();
        }
        return instance;
    }

    // 提交任务
    public void submit(final PriorityTask task) {
        this.coroutineTasks.add(task);
    }

    // 暂停任务
    public void pauseTask(String key, final Runnable task) {
        int priority = currentPriority;
        pausedTasks.put(key, new PriorityTask(priority, task));
    }

    // 恢复任务
    public void resumeTask(String key) {
        PriorityTask pausedTask = pausedTasks.remove(key);
        if (pausedTask != null) {
            coroutineTasks.add(pausedTask);
        }
    }

    // 任务执行循环
    private void processTasks() {
        while (running) {
            try {
                PriorityTask task = coroutineTasks.poll(); // 取出优先级最高的任务
                if (task != null) {
                    currentPriority = task.priority;
                    task.task.run(); // 执行任务
                } else {
                    Thread.sleep(50); // 如果队列为空，休眠50ms避免CPU空转
                }
            } catch (CoroutineBreakpointException e){
                System.err.println("Coroutine paused");
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    // 关闭调度器（可选）
    public void shutdown() {
        running = false;
        schedulerThread.interrupt();
    }
}
