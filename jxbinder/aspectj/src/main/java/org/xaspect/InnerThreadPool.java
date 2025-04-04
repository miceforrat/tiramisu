package org.xaspect;

import java.util.concurrent.*;

public class InnerThreadPool {
    private static final ExecutorService executor = Executors.newCachedThreadPool();

    static {
        Runtime.getRuntime().addShutdownHook(new Thread(() ->{
            executor.shutdown();
            try {
                if (!executor.awaitTermination(5, TimeUnit.SECONDS)){
                    executor.shutdownNow();
                }
            } catch (InterruptedException e) {
                executor.shutdownNow();
            }
        }) );
    }

    public static <T> Future<T> submit (Callable<T> task){
        return executor.submit(task);
    }
}
