package org.example;

import com.ut.UT_Counter;
import org.xaspect.*;
import org.xaspect.datas.Pin;
import org.xaspect.datas.ReturnsBundle;
import org.xaspect.datas.ReturnsPin;

public interface UTCounterDao extends DUTDao<UT_Counter> {

    @PostMethod
    void setRst(@Pin int rst);

    @GetMethod(prefix = "count")
    @ReturnsPin
    int getCnt();
}
