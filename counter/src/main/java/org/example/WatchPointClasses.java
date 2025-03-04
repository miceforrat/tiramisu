package org.example;

import org.xaspect.WatchCondition;
import org.xaspect.WatchPoint;

import java.lang.annotation.Annotation;

public class WatchPointClasses {
    public static class CountWatchPoint implements WatchCondition {
        @Override
        public boolean check(Object o) {
            return (int) o == 2;
        }
    }
}
