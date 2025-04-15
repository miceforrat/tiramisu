package org.xaspect.services;

import co.paralleluniverse.fibers.FiberScheduler;
import com.xspcomm.XClock;

import java.util.HashMap;
import java.util.Map;

public class XClockManagerFactory {
    private final static Map<XClock, XClockManager> clockManagers = new HashMap<>();

    public static XClockManager getNormalXClockManager(XClock clock) {
        if (clock == null) throw new IllegalArgumentException("clock is null");
        if (clockManagers.containsKey(clock)) return clockManagers.get(clock);
        XClockManager wrapper = new XClockManagerImpl(clock);
        clockManagers.put(clock, wrapper);
        return wrapper;
    }

    public static XClockCoroutineManager getXClockCoroutineManager(XClock clock, FiberScheduler scheduler) {
        if (clock == null) throw new IllegalArgumentException("clock is null");
        if (clockManagers.containsKey(clock)) {
            if (clockManagers.get(clock) instanceof XClockCoroutineManager) {
                return (XClockCoroutineManager) clockManagers.get(clock);
            }
            throw new IllegalArgumentException("clock is not a XClockCoroutineManager");
        }

        XClockCoroutineManager wrapper = new XClockCoroutineManagerImpl(clock, scheduler);
        clockManagers.put(clock, wrapper);
        return wrapper;
    }
}
