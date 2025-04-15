package org.xaspect;


import org.xaspect.services.XClockManager;

public interface DUTManager<DUT>{

    DUT getDUT();

    XClockManager getXClockManager();

    void finish();
}
