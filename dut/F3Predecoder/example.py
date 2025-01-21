try:
    from UT_F3Predecoder import *
except:
    try:
        from F3Predecoder import *
    except:
        from __init__ import *


if __name__ == "__main__":
    dut = DUTF3Predecoder()
    # dut.init_clock("clk")

    dut.Step(1)

    dut.Finish()
