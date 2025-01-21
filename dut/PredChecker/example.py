try:
    from UT_PredChecker import *
except:
    try:
        from PredChecker import *
    except:
        from __init__ import *


if __name__ == "__main__":
    dut = DUTPredChecker()
    # dut.init_clock("clk")

    dut.Step(1)

    dut.Finish()
