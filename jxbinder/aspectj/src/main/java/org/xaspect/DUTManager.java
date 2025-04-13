package org.xaspect;


public interface DUTManager<DUT>{

    DUT getDUT();

    void step();

    void step(int steps);

    void finish();
}
