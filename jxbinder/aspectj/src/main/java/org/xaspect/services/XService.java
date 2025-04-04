package org.xaspect.services;

import org.xaspect.InnerThreadPool;

import java.util.List;
import java.util.concurrent.*;

public interface XService {

    default public void run(List<Object> params){
        Future<List<Object>> refFuture= null;
        if (refEnable()){
            refFuture = InnerThreadPool.submit(() -> runRef(params));
        }

        List<Object> runRes = runService(params);

        // compare with ref model
        if (refFuture != null){
            try {
                List<Object> refResults = refFuture.get(2, TimeUnit.SECONDS);
                assert refResults.equals(runRes);
            } catch (TimeoutException e) {
                System.out.println("Task timed out!");
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }
        }

        coverageCollect();
    }

    default void step(){
        this.getClockManager().Step();

    }

    default void step(int term){
        for (int i = 0; i < term; i++) {
            this.step();
        }
    }

    public List<Object> runService(List<Object> params);

    public XClockManager getClockManager();

    public default boolean refEnable(){
        return false;
    }

    public List<Object> runRef(List<Object> params);

    public default void coverageCollect(){

    }
}
