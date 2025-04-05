package org.xaspect.testSupports;


import java.util.*;

public class CoverageManager {

//    private final XClockManager xClockManager;

    private static final Map<String, CoverageManager> coverageManagers = new HashMap<>();

    private final Map<String, CoverageGroup> coverageGroupMap = new HashMap<>();


    private CoverageManager() {

    }

    public static CoverageManager getCoverageManager(String coverageManagerName) {
        if (!coverageManagers.containsKey(coverageManagerName)) {
            coverageManagers.put(coverageManagerName, new CoverageManager());
        }
        return coverageManagers.get(coverageManagerName);
    }

    public CoverageGroup getCoverageGroup(String coverageGroupName) {
        if (!coverageGroupMap.containsKey(coverageGroupName)) {
            coverageGroupMap.put(coverageGroupName, new CoverageGroup(coverageGroupName));
        }
        return coverageGroupMap.get(coverageGroupName);
    }

//    public void addHangingWatchPoint(WatchPoint<?> watchPoint) {
//        this.coverageGroups.get(CoverageGroup.PRESERVED_HANGING).addWatchPoint(watchPoint);
//    }

//    public void bindXClockManager(XClockManager xClockManager) {
//        xClockManager.stepRis(aLong -> {
//            for (CoverageGroup group : coverageGroups.values()) {
//                group.watch();
//            }
//        });
//    }

    public void printReport(){
        for (CoverageGroup coverageGroup: coverageGroupMap.values()) {
            System.out.println(coverageGroup.report());
        }
    }
}
