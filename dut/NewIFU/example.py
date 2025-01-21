try:
    from UT_NewIFU import *
except:
    try:
        from NewIFU import *
    except:
        from __init__ import *


if __name__ == "__main__":
    dut = DUTNewIFU()
    # dut.init_clock("clk")

    dut.Step(1)

    dut.Finish()
