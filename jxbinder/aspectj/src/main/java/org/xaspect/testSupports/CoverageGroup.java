package org.xaspect.testSupports;

import java.util.*;

public class CoverageGroup {
    private Map<String, WatchPoint<?>> watchPoints = new HashMap<>();

    private final static Map<String, Set<String>> watcherKeys = new HashMap<>();

    private final String groupName;

    public CoverageGroup(String groupName) {

        if (groupName == null || groupName.isEmpty()) {
            throw new IllegalArgumentException("groupName cannot be null or empty");
        }
        this.groupName = groupName;
        if (!watcherKeys.containsKey(groupName)) {
            watcherKeys.put(groupName, new HashSet<>());
        }

    }

    String getGroupName() {
        return groupName;
    }

    public void addWatchPoint(WatchPoint<?> watchPoint) {
        if (watchPoint == null) {
            throw new IllegalArgumentException("watchPoint cannot be null");
        }

        //避免重复添加
        if (watchPoints.containsKey(watchPoint.getName())) {
            return;
        }
        watcherKeys.get(groupName).add(watchPoint.getName());
        watchPoints.put(watchPoint.getName(), watchPoint);
    }

    Map<String, WatchPoint<?>> getWatchPoints() {
        return watchPoints;
    }

    void watch(){
        for (WatchPoint<?> watchPoint : watchPoints.values()) {
            watchPoint.watch();
        }
    }

    static String report(String groupName){
        StringBuilder sb = new StringBuilder();
        if (groupName == null || groupName.isEmpty()) {
            throw new IllegalArgumentException("groupName cannot be null or empty");
        }
        if (!watcherKeys.containsKey(groupName)) {
            throw new IllegalArgumentException("groupName does not exist");
        }
        sb.append(String.format("%s: \n", groupName));
        for (String watchPointName : watcherKeys.get(groupName)) {
            sb.append(WatchPoint.report(watchPointName));
        }
        return sb.toString();
    }

}
