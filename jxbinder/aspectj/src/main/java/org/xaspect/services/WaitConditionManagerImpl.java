package org.xaspect.services;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.locks.Condition;
import java.util.function.Supplier;

class WaitConditionManagerImpl implements WaitConditionManager {

    WaitConditionManagerImpl() {
    }

    private final Map<String, WaitCondition> waitConditions = new HashMap<>();

    private final Set<WaitCondition> waitConditionsSet = new HashSet<>();

    @Override
    public void waitOn(String condId) {
        checkCondExistence(condId);waitConditions.get(condId).await();
    }

    @Override
    public void checkAll() {
        for (WaitCondition cond : waitConditionsSet) {
            cond.lock();
            if (cond.check()){
                cond.signalAll();
            }
            cond.unlock();
        }
    }

    @Override
    public WaitCondition createWaitCondition(String condId, Supplier<Boolean> condition) {
        if (!waitConditions.containsKey(condId)) {
            waitConditions.put(condId, new WaitCondition(condition));
        }
        return waitConditions.get(condId);
    }

    @Override
    public void registerWaitCondition(WaitCondition waitCondition) {
        this.waitConditionsSet.add(waitCondition);
    }

    @Override
    public boolean check(String condId) {
        checkCondExistence(condId);
        return waitConditions.get(condId).check();
    }

    @Override
    public void lock(String condId) {
        checkCondExistence(condId);
        waitConditions.get(condId).lock();
    }

    @Override
    public void unlock(String condId) {
        checkCondExistence(condId);
        waitConditions.get(condId).unlock();
    }

    private void checkCondExistence(String condId) {
        if (!waitConditions.containsKey(condId)) {
            throw new RuntimeException("no such wait condition: " + condId);
        }
    }
}
