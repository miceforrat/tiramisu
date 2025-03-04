package org.xaspect;

@FunctionalInterface
public interface WatchCondition {
    boolean check(Object value);
}
