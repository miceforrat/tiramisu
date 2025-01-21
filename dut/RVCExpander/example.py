try:
    from UT_RVCExpander import *
except:
    try:
        from RVCExpander import *
    except:
        from __init__ import *


if __name__ == "__main__":
    dut = DUTRVCExpander()
    # dut.init_clock("clk")

    dut.Step(1)

    dut.Finish()
