package org.xaspect.testSupports;

import org.xaspect.services.XClockManager;

import java.util.*;
import java.util.stream.Collectors;

public class CoverageManager {

//    private final XClockManager xClockManager;

    private static final Map<String, CoverageManager> coverageManagers = new HashMap<>();

    private final Set<String> resultKeys = new HashSet<>();

    private final Map<XClockManager, List<CoverageGroup>> coverageGroupsByClock = new HashMap<>();

    private CoverageManager() {

    }

    public static CoverageManager getCoverageManager(String coverageManagerName) {
        if (!coverageManagers.containsKey(coverageManagerName)) {
            coverageManagers.put(coverageManagerName, new CoverageManager());
        }
        return coverageManagers.get(coverageManagerName);
    }

    public void addCoverageGroupForSingleClock(CoverageGroup coverageGroup, XClockManager cm) {
        resultKeys.add(coverageGroup.getGroupName());
        if (!coverageGroupsByClock.containsKey(cm)) {
            coverageGroupsByClock.put(cm, new ArrayList<>());
        }
        coverageGroupsByClock.get(cm).add(coverageGroup);
        cm.stepRis(aLong -> {
            for (CoverageGroup group : coverageGroupsByClock.get(cm)) {
                group.watch();
            }
        });
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
        for (String groupName : resultKeys) {
            System.out.println(CoverageGroup.report(groupName));
        }
    }
}
