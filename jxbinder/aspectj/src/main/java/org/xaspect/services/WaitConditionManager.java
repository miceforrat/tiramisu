package org.xaspect.services;

import java.util.concurrent.locks.Condition;
import java.util.function.Supplier;

interface WaitConditionManager {
    WaitCondition createWaitCondition(String condId, Supplier<Boolean> condition);
    boolean check(String condId);
    void waitOn(String condId);
    void checkAll();
    void registerWaitCondition(WaitCondition waitCondition);
    void lock(String condId);
    void unlock(String condId);
}
