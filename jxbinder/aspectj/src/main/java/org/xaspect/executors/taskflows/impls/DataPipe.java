package org.xaspect.executors.taskflows.impls;

import java.util.Map;

public class DataPipe<T>{
    Map<String, T> data;

    boolean valueEquals(String key1, String key2) {
        return data.get(key1).equals(data.get(key2));
    }
}
