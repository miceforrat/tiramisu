package org.xaspect.clocks;
import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.fibers.FiberExecutorScheduler;
import co.paralleluniverse.strands.Strand;
import co.paralleluniverse.strands.channels.Channel;
import co.paralleluniverse.strands.channels.Channels;
import com.xspcomm.XClock;

import co.paralleluniverse.strands.concurrent.CountDownLatch;
import co.paralleluniverse.strands.concurrent.ReentrantLock;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.locks.Condition;

public class DUTClockManager {
    private final XClock xclock;
    private final ConcurrentMap<String, CountDownLatch> latchMap = new ConcurrentHashMap<>();
    private final Channel<String> taskChannel; // 用于通知 Fiber 有新任务
    private volatile boolean running = true;

    public DUTClockManager(XClock clock) {

        this.xclock = clock;
        System.out.println("DUT Clock setting up");
        FiberExecutorScheduler scheduler = new FiberExecutorScheduler("dut-clock-scheduler", Runnable::run);

        // 创建一个无界的 Channel
        taskChannel = Channels.newChannel(20);

        // 启动主 Fiber
        Fiber<Void> fiber = new Fiber<>(scheduler, () -> {
            while (running) {
                try {
                    // 等待新的任务通知（挂起式操作）
                    String taskId = taskChannel.receive();

                    // 执行一次 xclock.step
                    xclock.Step(1);

                    // 减少指定任务的 CountDownLatch 计数
                    CountDownLatch latch = latchMap.get(taskId);
                    if (latch != null) {
                        latch.countDown();
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }
        });

        fiber.start();
    }

    public void waitForSteps(String id, int steps) throws InterruptedException {
        CountDownLatch latch = new CountDownLatch(steps);
        latchMap.put(id, latch);

        // 通过 Channel 通知任务
        for (int i = 0; i < steps; i++) {
            try {
                taskChannel.send(id); // 将任务 ID 发送到 Channel
            }catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 挂起当前协程直到任务完成
        latch.await();

        // 步骤完成后清理资源
        latchMap.remove(id);
    }

    public void shutdown() {
        running = false; // 停止 Fiber
        taskChannel.close(); // 关闭 Channel，终止主 Fiber
    }
}



//public class DUTClockManager {
//    private XClock xclock;
//    private Map<String, CountDownLatch> countDownLatchMap = new HashMap<>();
//    private final Lock lock = new ReentrantLock();
//    private final Condition hasTasks = lock.newCondition();
//    private volatile boolean running = true;
//
//    public DUTClockManager(XClock clock) {
//        this.xclock = clock;
//        System.out.println("dut clock setting up");
//        FiberExecutorScheduler scheduler = new FiberExecutorScheduler("current-thread-scheduler", Runnable::run);
//
//        Fiber<Void> fiber = new Fiber<>(scheduler, () -> {
//            while (running) {
//
//                try {
//                    lock.lock();
//                    while (countDownLatchMap.isEmpty()) {
//                        lock.unlock();
//                        hasTasks.await(); // 等待有任务被添加
//                    }
//
//                    // 有任务时，执行一次 xclock.step
//                    xclock.Step(1);
//
//                    // 减少所有 CountDownLatch 的计数
//                    countDownLatchMap.values().forEach(CountDownLatch::countDown);
//                } catch (InterruptedException e) {
////                    e.printStackTrace();
//                    Thread.currentThread().interrupt();
//                } finally {
//                    lock.unlock();
//                }
//            }
//        });
//        fiber.start();
//    }
//
//    public void waitForSteps(String id, int steps) throws InterruptedException {
//        CountDownLatch latch = new CountDownLatch(steps);
//
//        lock.lock();
//        try {
//            countDownLatchMap.put(id, latch);
//            hasTasks.signal(); // 通知后台线程有任务
//        } finally {
//            lock.unlock();
//        }
//        // 等待步骤完成
//        latch.await();
//        // 步骤完成后清理资源
//        lock.lock();
//        try {
//            countDownLatchMap.remove(id);
//        } finally {
//            lock.unlock();
//        }
//    }
//
//    public void shutdown() {
//        running = false; // 停止线程
//        lock.lock();
//        try {
//            hasTasks.signalAll(); // 唤醒所有等待的线程
//        } finally {
//            lock.unlock();
//        }
//    }
//
//
//}
