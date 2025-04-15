package org.xaspect.testSupports;

import org.xaspect.services.XClockCoroutineManager;

import java.util.*;
import java.util.function.Function;

public class CoverageGroup {
//    private Map<String, WatchPoint<?>> watchPoints = new HashMap<>();

//    private final static Map<String, Set<String>> watcherKeys = new HashMap<>();

    private final String groupName;

    private final Map<String, Map<String, Integer>> watchRecords = new HashMap<>();

    private final Map<XClockCoroutineManager, List<WatchPoint<?>>> clockWithPoints = new HashMap<>();

    CoverageGroup(String groupName) {

//        if (groupName == null || groupName.isEmpty()) {
//            throw new IllegalArgumentException("groupName cannot be null or empty");
//        }
        this.groupName = groupName;
//        if (!watcherKeys.containsKey(groupName)) {
//            watcherKeys.put(groupName, new HashSet<>());
//        }

    }

    public <T> WatchPoint<T> createWatchPoint(String name, Map<String, Function<T, Boolean>> bins, T target) {
        if (name == null || name.isEmpty()) {
            throw new IllegalArgumentException("name cannot be null or empty");
        }

        if (!watchRecords.containsKey(name)) {
            watchRecords.put(name, new HashMap<>());
        }

        bins.keySet().forEach(key -> watchRecords.get(name).putIfAbsent(key, 0));
        return new WatchPoint<>(name, bins, target);
    }

    public <T> WatchPoint<T> createWatchPointWithClock(String name, Map<String, Function<T, Boolean>> bins, T target, XClockCoroutineManager clockManager) {
        WatchPoint<T> watchPoint = createWatchPoint(name, bins, target);
        bindWithClock(clockManager, watchPoint);
        return watchPoint;
    }

    public void bindWithClock(XClockCoroutineManager clockManager, WatchPoint<?> watchPoint) {
        if (!clockWithPoints.containsKey(clockManager)) {
            clockWithPoints.put(clockManager, new ArrayList<>());
            clockManager.stepRis(aLong -> {
                for (WatchPoint<?> watchPoint1 : clockWithPoints.get(clockManager)) {
                    Map<String, Boolean> binRes = watchPoint1.watch();
                    Map<String, Integer> thisRecord = watchRecords.get(watchPoint1.getName());
                    assert thisRecord != null;
                    for (Map.Entry<String, Boolean> binEntry : binRes.entrySet()) {
                        int newCount = thisRecord.get(binEntry.getKey()) + (binEntry.getValue() ? 1 : 0);
                        thisRecord.put(binEntry.getKey(), newCount);
                    }
                }
            });
        }
        clockWithPoints.get(clockManager).add(watchPoint);
    }

    String getGroupName() {
        return groupName;
    }

//    public void addWatchPoint(WatchPoint<?> watchPoint) {
//        if (watchPoint == null) {
//            throw new IllegalArgumentException("watchPoint cannot be null");
//        }
//
//        //避免重复添加
//        if (watchPoints.containsKey(watchPoint.getName())) {
//            return;
//        }
//        watcherKeys.get(groupName).add(watchPoint.getName());
//        watchPoints.put(watchPoint.getName(), watchPoint);
//    }
//
//    Map<String, WatchPoint<?>> getWatchPoints() {
//        return watchPoints;
//    }

//    void watch(){
//        for (WatchPoint<?> watchPoint : watchPoints.values()) {
//            watchPoint.watch();
//        }
//    }

    String report(){
        StringBuilder sb = new StringBuilder();

        for (Map.Entry<String, Map<String, Integer>> watchRecord : watchRecords.entrySet()) {
            sb.append(watchRecord.getKey()).append("\n");
            sb.append(watchRecord.getValue()).append("\n");
        }

        return sb.toString();
    }

}
