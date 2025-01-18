package org.example;

import com.ut.UT_Counter;
import org.xaspect.DUTWrapper;
import org.xaspect.GetMethod;
import org.xaspect.Pin;
import org.xaspect.PostMethod;

public interface UTCounterWrapper extends DUTWrapper<UT_Counter> {

    @PostMethod
    void setRst(@Pin int rst);

    @GetMethod
    @Pin("count") int getCnt();
}
