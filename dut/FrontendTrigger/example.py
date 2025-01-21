try:
    from UT_FrontendTrigger import *
except:
    try:
        from FrontendTrigger import *
    except:
        from __init__ import *


if __name__ == "__main__":
    dut = DUTFrontendTrigger()
    # dut.init_clock("clk")

    dut.Step(1)

    dut.Finish()
