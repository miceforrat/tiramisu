//package org.xaspect.concurrent;
//
//import com.ea.async.Async;
//
//import java.util.concurrent.Executor;
//import java.util.concurrent.Executors;
//import java.util.concurrent.CompletableFuture;
//
//public class SingleThreadExample {
//    public static void main(String[] args) {
//        // 使用单线程调度器初始化 EA Async
//        Async.init();
//
//        // 启动任务
//        CompletableFuture<Void> task1 = CompletableFuture.runAsync(() -> {
//            System.out.println("Task 1 - Step 1");
//            Async.await(CompletableFuture.runAsync(() -> sleep(1000))); // 暂停 1 秒
//            System.out.println("Task 1 - Step 2");
//            System.out.println(Thread.currentThread().getName());
//        });
//
//        CompletableFuture<Void> task2 = CompletableFuture.runAsync(() -> {
//            System.out.println("Task 2 - Step 1");
//            Async.await(CompletableFuture.runAsync(() -> sleep(1000))); // 暂停 1 秒
//            System.out.println("Task 2 - Step 2");
//        });
//
//        // 等待所有任务完成
//        CompletableFuture.allOf(task1, task2).join();
//    }
//
//    private static void sleep(long millis) {
//        try {
//            Thread.sleep(millis);
//        } catch (InterruptedException e) {
//            Thread.currentThread().interrupt();
//        }
//    }
//}

package org.xaspect.concurrent;

import com.ea.async.Async;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;

public class SingleThreadExample {
    public static void main(String[] args) {
        // 初始化 EA Async
        Async.init();

        // 创建单线程执行器
        ExecutorService executor = Executors.newSingleThreadExecutor();

        // 启动主任务
        CompletableFuture<Void> task = CompletableFuture.runAsync(() -> doWork(executor), executor);

        // 等待主任务完成
        task.join();

        executor.shutdown();
        System.out.println("finished!");
    }

    // 主任务，其中在中途需要等待一个“信号”
    public static void doWork(ExecutorService executor) {
        System.out.println("Step 1: before waiting, thread: " + Thread.currentThread().getName());

        // 在这里等待一个异步信号，并且通过自定义的方式进行轮询等待
        waitForSignal(executor);

        System.out.println("Step 2: after waiting, thread: " + Thread.currentThread().getName());
    }

    // 模拟一个条件信号：500ms 后完成
    public static void waitForSignal(ExecutorService executor) {
        CompletableFuture<Void> signal = new CompletableFuture<>();

        // 创建一个任务，用于触发信号
        executor.execute(() -> {
            try {
                // 模拟500ms后的信号
                Thread.sleep(500);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            System.out.println("Signal emitted, thread: " + Thread.currentThread().getName());
            signal.complete(null);
        });

        // 非阻塞式轮询等待信号
        while (!signal.isDone()) {
            // 让出线程并继续执行其他任务
            Async.await(CompletableFuture.runAsync(() -> {
                // 没有实际操作，只是确保线程不会被阻塞
            }));
        }
    }
}