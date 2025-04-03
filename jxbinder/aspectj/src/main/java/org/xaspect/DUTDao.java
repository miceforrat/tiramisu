package org.xaspect;

public interface DUTDao<DUT> {

    public void bind(DUT dut);

    public void finish();

    public void reset();
}
