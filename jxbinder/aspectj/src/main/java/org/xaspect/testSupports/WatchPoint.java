package org.xaspect.testSupports;


import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

public class WatchPoint<T>{
    private final T target;
    private final Map<String, Function<T, Boolean>> bins;
    private final String name;
    private final static Map<String, Map<String, Integer>> allCounts = new HashMap<>();

    public WatchPoint(String name, Map<String, Function<T, Boolean>> bins, T target) {
        if (allCounts.containsKey(name)){
            Map<String, Integer> counts = allCounts.get(name);
            if (!counts.keySet().equals(bins.keySet())){
                throw new RuntimeException("Different bin key sets with " + counts.keySet() + " and " + bins.keySet());
            }
        } else {
            allCounts.put(name, bins.keySet().stream().collect(Collectors.toMap(key -> key, key -> 0)));
        }
        this.target = target;
        this.bins = bins;
        this.name = name;

    }


    T getTarget() {
        return target;
    }
    Map<String, Function<T, Boolean>> getBins() {
        return bins;
    }

    String getName() {
        return name;
    }

    Map<String, Integer> getHitCounts() {
        return allCounts.get(name);
    }

    void watch(){
        for (Map.Entry<String, Function<T, Boolean>> entry : bins.entrySet()) {
            Function<T, Boolean> bin = entry.getValue();
            String key = entry.getKey();
            int newHitCount = allCounts.get(name).get(key) + (bin.apply(target) ? 1 : 0);
            allCounts.get(name).put(key, newHitCount);
        }
    }

    static String report(String name){
        if (!allCounts.containsKey(name)){
            throw new RuntimeException("No bins for " + name);
        }
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("%s:\n", name));
        sb.append(String.format("%s", allCounts.get(name)));
//        for (String key : allCounts.get(name).keySet().stream().sorted().collect(Collectors.toList())){
//            sb.append(String.format("%s: %d\n", key, allCounts.get(name).get(key)));
//        }
        return sb.toString();
    }
}
