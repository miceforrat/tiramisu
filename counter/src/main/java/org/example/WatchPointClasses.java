package org.example;

import org.xaspect.WatchCondition;
import org.xaspect.WatchPoint;

import java.lang.annotation.Annotation;
import java.util.HashMap;
import java.util.Map;

public class WatchPointClasses  {
    public static boolean check(Object o) {
        return (int) o == 2;
    }
}

