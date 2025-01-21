try:
    from UT_PreDecode import *
except:
    try:
        from PreDecode import *
    except:
        from __init__ import *


if __name__ == "__main__":
    dut = DUTPreDecode()
    # dut.init_clock("clk")

    dut.Step(1)

    dut.Finish()
