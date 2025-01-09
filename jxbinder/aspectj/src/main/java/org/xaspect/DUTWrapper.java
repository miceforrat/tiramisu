package org.xaspect;

import com.xspcomm.XClock;

public interface DUTWrapper<DUT> {

    public void Step();

    public void Step(int step);

    public XClock getXClock();
}
