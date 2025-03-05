package org.example;

import com.ut.UT_Counter;
import org.xaspect.*;
import org.xaspect.datas.Pin;

public interface UTCounterWrapper extends DUTWrapper<UT_Counter> {

    @PostMethod
    void setRst(@Pin int rst);

    @GetMethod
    @Pin("count") @WatchPoint(conditionClassNames = {"WatchPointClasses"},
            conditionMethodNames = {"check"},
            conditionNames = {"test"}) int getCnt();
}
