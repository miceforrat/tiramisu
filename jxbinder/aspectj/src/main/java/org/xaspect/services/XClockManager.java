package org.xaspect.services;

import com.xspcomm.XClock;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Semaphore;
import java.util.function.Consumer;

public class XClockManager {
    private XClock clock;
    private int useClockCnt = 0;

    private Semaphore cntLock;

    private int clockWaiters = 0;

    private Semaphore waitClock;

    private XClockManager(XClock clock) {
        this.clock = clock;
    }

    private static Map<XClock, XClockManager> clocks = new HashMap();

    public static XClockManager getXClockWrapper(XClock clock) {
        if (clock == null) return null;
        if (clocks.containsKey(clock)) return clocks.get(clock);
        XClockManager wrapper = new XClockManager(clock);
        clocks.put(clock, wrapper);
        return wrapper;
    }

    public void register(){
        if (useClockCnt == 1){
            cntLock = new Semaphore(1);
            waitClock = new Semaphore(0);
        }
        useClockCnt++;
    }

    public void unregister(){
        cntLock.acquireUninterruptibly();
        clockWaiters -= 1;
        check(0);
    }

    void check(int stay){
        if (clockWaiters >= useClockCnt){
            waitClock.release(clockWaiters-stay);
            clockWaiters = 0;
            cntLock.release();
        } else {
            cntLock.release();
            waitClock.acquireUninterruptibly();
        }
    }

    public void Step(){
        if (useClockCnt <= 1){
            clock.Step();
        } else {
            cntLock.acquireUninterruptibly();
            clockWaiters += 1;
            check(1);
        }
    }
    
    public void Step(int n){
        for (int i = 0; i<n; i++){
            Step();
        }
    }

    public void stepRis(Consumer<Long> callBacks ){
        this.clock.StepRis(callBacks);
    }

}
