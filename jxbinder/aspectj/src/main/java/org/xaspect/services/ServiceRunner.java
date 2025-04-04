package org.xaspect.services;

import org.xaspect.InnerThreadPool;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Callable;

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
        for (ServiceChannel channel : serviceChannelMap.values()) {
            channel.register();
        }

        for (ServiceChannel channel : serviceChannelMap.values()) {
            InnerThreadPool.submit(() -> {
                channel.run();
                return null;
            });
        }
    }


}
