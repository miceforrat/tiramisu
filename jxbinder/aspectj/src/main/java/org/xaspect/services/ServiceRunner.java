package org.xaspect.services;

import org.xaspect.InnerThreadPool;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.Semaphore;

public class ServiceRunner {

    public ServiceRunner() {}

    private ServiceChannel currentChannel;
    private final Map<String, ServiceChannel> serviceChannelMap = new HashMap<>();


    public ServiceChannel getChannel(String id){
        if (!serviceChannelMap.containsKey(id)){
            serviceChannelMap.put(id, new ServiceChannel());
        }

        currentChannel = serviceChannelMap.get(id);
        return serviceChannelMap.get(id);
    }

    public void runAll(){

        int size = serviceChannelMap.size();
        int count = 0;
        Semaphore semaphore = new Semaphore(0);
        List<Thread> threads = new ArrayList<>();
        for (ServiceChannel channel : serviceChannelMap.values()) {
            count++;
            int finalCount = count;
            Thread thread = new Thread(()-> {
                channel.register();
                if (finalCount < size) {
                    semaphore.acquireUninterruptibly();
                } else {
                    semaphore.release(size - 1);
                }
                channel.run();
            });
            threads.add(thread);
            thread.start();
        }

        for (Thread thread : threads) {
            try {
                thread.join();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }

    }


}
