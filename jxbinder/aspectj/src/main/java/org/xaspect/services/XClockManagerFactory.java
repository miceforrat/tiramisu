package org.xaspect.services;

import com.xspcomm.XClock;

import java.util.HashMap;
import java.util.Map;

public class XClockManagerFactory {
    private final static Map<XClock, XClockManager> clockManagers = new HashMap<>();

    public static XClockManager getXClockManager(XClock clock) {
        if (clock == null) return null;
        if (clockManagers.containsKey(clock)) return clockManagers.get(clock);
        XClockManager wrapper = new XClockManagerImpl(clock);
        clockManagers.put(clock, wrapper);
        return wrapper;
    }
}
