#coding=utf8

try:
    from . import xspcomm as xsp
except Exception as e:
    import xspcomm as xsp

if __package__ or "." in __name__:
    from .libUT_F3Predecoder import *
else:
    from libUT_F3Predecoder import *


class DUTF3Predecoder(object):

    # initialize
    def __init__(self, *args, **kwargs):
        self.dut = DutUnifiedBase(*args)
        self.xclock = xsp.XClock(self.dut.simStep)
        self.xport  = xsp.XPort()
        self.xclock.Add(self.xport)
        self.event = self.xclock.getEvent()
        # set output files
        if kwargs.get("waveform_filename"):
            self.dut.SetWaveform(kwargs.get("waveform_filename"))
        if kwargs.get("coverage_filename"):
            self.dut.SetCoverage(kwargs.get("coverage_filename"))

        # all Pins
        self.io_in_instr_0 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_1 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_2 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_3 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_4 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_5 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_6 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_7 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_8 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_9 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_10 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_11 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_12 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_13 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_14 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_in_instr_15 = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_out_pd_0_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_0_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_0_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_1_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_1_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_1_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_2_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_2_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_2_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_3_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_3_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_3_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_4_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_4_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_4_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_5_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_5_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_5_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_6_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_6_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_6_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_7_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_7_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_7_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_8_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_8_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_8_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_9_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_9_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_9_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_10_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_10_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_10_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_11_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_11_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_11_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_12_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_12_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_12_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_13_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_13_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_13_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_14_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_14_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_14_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_15_brType = xsp.XPin(xsp.XData(2, xsp.XData.Out), self.event)
        self.io_out_pd_15_isCall = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)
        self.io_out_pd_15_isRet = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)


        # BindDPI
        self.io_in_instr_0.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_0", 0), self.dut.GetDPIHandle("io_in_instr_0", 1))
        self.io_in_instr_1.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_1", 0), self.dut.GetDPIHandle("io_in_instr_1", 1))
        self.io_in_instr_2.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_2", 0), self.dut.GetDPIHandle("io_in_instr_2", 1))
        self.io_in_instr_3.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_3", 0), self.dut.GetDPIHandle("io_in_instr_3", 1))
        self.io_in_instr_4.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_4", 0), self.dut.GetDPIHandle("io_in_instr_4", 1))
        self.io_in_instr_5.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_5", 0), self.dut.GetDPIHandle("io_in_instr_5", 1))
        self.io_in_instr_6.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_6", 0), self.dut.GetDPIHandle("io_in_instr_6", 1))
        self.io_in_instr_7.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_7", 0), self.dut.GetDPIHandle("io_in_instr_7", 1))
        self.io_in_instr_8.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_8", 0), self.dut.GetDPIHandle("io_in_instr_8", 1))
        self.io_in_instr_9.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_9", 0), self.dut.GetDPIHandle("io_in_instr_9", 1))
        self.io_in_instr_10.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_10", 0), self.dut.GetDPIHandle("io_in_instr_10", 1))
        self.io_in_instr_11.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_11", 0), self.dut.GetDPIHandle("io_in_instr_11", 1))
        self.io_in_instr_12.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_12", 0), self.dut.GetDPIHandle("io_in_instr_12", 1))
        self.io_in_instr_13.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_13", 0), self.dut.GetDPIHandle("io_in_instr_13", 1))
        self.io_in_instr_14.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_14", 0), self.dut.GetDPIHandle("io_in_instr_14", 1))
        self.io_in_instr_15.BindDPIPtr(self.dut.GetDPIHandle("io_in_instr_15", 0), self.dut.GetDPIHandle("io_in_instr_15", 1))
        self.io_out_pd_0_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_0_brType", 0), self.dut.GetDPIHandle("io_out_pd_0_brType", 1))
        self.io_out_pd_0_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_0_isCall", 0), self.dut.GetDPIHandle("io_out_pd_0_isCall", 1))
        self.io_out_pd_0_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_0_isRet", 0), self.dut.GetDPIHandle("io_out_pd_0_isRet", 1))
        self.io_out_pd_1_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_1_brType", 0), self.dut.GetDPIHandle("io_out_pd_1_brType", 1))
        self.io_out_pd_1_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_1_isCall", 0), self.dut.GetDPIHandle("io_out_pd_1_isCall", 1))
        self.io_out_pd_1_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_1_isRet", 0), self.dut.GetDPIHandle("io_out_pd_1_isRet", 1))
        self.io_out_pd_2_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_2_brType", 0), self.dut.GetDPIHandle("io_out_pd_2_brType", 1))
        self.io_out_pd_2_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_2_isCall", 0), self.dut.GetDPIHandle("io_out_pd_2_isCall", 1))
        self.io_out_pd_2_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_2_isRet", 0), self.dut.GetDPIHandle("io_out_pd_2_isRet", 1))
        self.io_out_pd_3_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_3_brType", 0), self.dut.GetDPIHandle("io_out_pd_3_brType", 1))
        self.io_out_pd_3_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_3_isCall", 0), self.dut.GetDPIHandle("io_out_pd_3_isCall", 1))
        self.io_out_pd_3_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_3_isRet", 0), self.dut.GetDPIHandle("io_out_pd_3_isRet", 1))
        self.io_out_pd_4_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_4_brType", 0), self.dut.GetDPIHandle("io_out_pd_4_brType", 1))
        self.io_out_pd_4_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_4_isCall", 0), self.dut.GetDPIHandle("io_out_pd_4_isCall", 1))
        self.io_out_pd_4_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_4_isRet", 0), self.dut.GetDPIHandle("io_out_pd_4_isRet", 1))
        self.io_out_pd_5_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_5_brType", 0), self.dut.GetDPIHandle("io_out_pd_5_brType", 1))
        self.io_out_pd_5_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_5_isCall", 0), self.dut.GetDPIHandle("io_out_pd_5_isCall", 1))
        self.io_out_pd_5_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_5_isRet", 0), self.dut.GetDPIHandle("io_out_pd_5_isRet", 1))
        self.io_out_pd_6_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_6_brType", 0), self.dut.GetDPIHandle("io_out_pd_6_brType", 1))
        self.io_out_pd_6_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_6_isCall", 0), self.dut.GetDPIHandle("io_out_pd_6_isCall", 1))
        self.io_out_pd_6_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_6_isRet", 0), self.dut.GetDPIHandle("io_out_pd_6_isRet", 1))
        self.io_out_pd_7_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_7_brType", 0), self.dut.GetDPIHandle("io_out_pd_7_brType", 1))
        self.io_out_pd_7_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_7_isCall", 0), self.dut.GetDPIHandle("io_out_pd_7_isCall", 1))
        self.io_out_pd_7_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_7_isRet", 0), self.dut.GetDPIHandle("io_out_pd_7_isRet", 1))
        self.io_out_pd_8_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_8_brType", 0), self.dut.GetDPIHandle("io_out_pd_8_brType", 1))
        self.io_out_pd_8_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_8_isCall", 0), self.dut.GetDPIHandle("io_out_pd_8_isCall", 1))
        self.io_out_pd_8_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_8_isRet", 0), self.dut.GetDPIHandle("io_out_pd_8_isRet", 1))
        self.io_out_pd_9_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_9_brType", 0), self.dut.GetDPIHandle("io_out_pd_9_brType", 1))
        self.io_out_pd_9_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_9_isCall", 0), self.dut.GetDPIHandle("io_out_pd_9_isCall", 1))
        self.io_out_pd_9_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_9_isRet", 0), self.dut.GetDPIHandle("io_out_pd_9_isRet", 1))
        self.io_out_pd_10_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_10_brType", 0), self.dut.GetDPIHandle("io_out_pd_10_brType", 1))
        self.io_out_pd_10_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_10_isCall", 0), self.dut.GetDPIHandle("io_out_pd_10_isCall", 1))
        self.io_out_pd_10_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_10_isRet", 0), self.dut.GetDPIHandle("io_out_pd_10_isRet", 1))
        self.io_out_pd_11_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_11_brType", 0), self.dut.GetDPIHandle("io_out_pd_11_brType", 1))
        self.io_out_pd_11_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_11_isCall", 0), self.dut.GetDPIHandle("io_out_pd_11_isCall", 1))
        self.io_out_pd_11_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_11_isRet", 0), self.dut.GetDPIHandle("io_out_pd_11_isRet", 1))
        self.io_out_pd_12_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_12_brType", 0), self.dut.GetDPIHandle("io_out_pd_12_brType", 1))
        self.io_out_pd_12_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_12_isCall", 0), self.dut.GetDPIHandle("io_out_pd_12_isCall", 1))
        self.io_out_pd_12_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_12_isRet", 0), self.dut.GetDPIHandle("io_out_pd_12_isRet", 1))
        self.io_out_pd_13_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_13_brType", 0), self.dut.GetDPIHandle("io_out_pd_13_brType", 1))
        self.io_out_pd_13_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_13_isCall", 0), self.dut.GetDPIHandle("io_out_pd_13_isCall", 1))
        self.io_out_pd_13_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_13_isRet", 0), self.dut.GetDPIHandle("io_out_pd_13_isRet", 1))
        self.io_out_pd_14_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_14_brType", 0), self.dut.GetDPIHandle("io_out_pd_14_brType", 1))
        self.io_out_pd_14_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_14_isCall", 0), self.dut.GetDPIHandle("io_out_pd_14_isCall", 1))
        self.io_out_pd_14_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_14_isRet", 0), self.dut.GetDPIHandle("io_out_pd_14_isRet", 1))
        self.io_out_pd_15_brType.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_15_brType", 0), self.dut.GetDPIHandle("io_out_pd_15_brType", 1))
        self.io_out_pd_15_isCall.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_15_isCall", 0), self.dut.GetDPIHandle("io_out_pd_15_isCall", 1))
        self.io_out_pd_15_isRet.BindDPIPtr(self.dut.GetDPIHandle("io_out_pd_15_isRet", 0), self.dut.GetDPIHandle("io_out_pd_15_isRet", 1))


        # Add2Port
        self.xport.Add("io_in_instr_0", self.io_in_instr_0.xdata)
        self.xport.Add("io_in_instr_1", self.io_in_instr_1.xdata)
        self.xport.Add("io_in_instr_2", self.io_in_instr_2.xdata)
        self.xport.Add("io_in_instr_3", self.io_in_instr_3.xdata)
        self.xport.Add("io_in_instr_4", self.io_in_instr_4.xdata)
        self.xport.Add("io_in_instr_5", self.io_in_instr_5.xdata)
        self.xport.Add("io_in_instr_6", self.io_in_instr_6.xdata)
        self.xport.Add("io_in_instr_7", self.io_in_instr_7.xdata)
        self.xport.Add("io_in_instr_8", self.io_in_instr_8.xdata)
        self.xport.Add("io_in_instr_9", self.io_in_instr_9.xdata)
        self.xport.Add("io_in_instr_10", self.io_in_instr_10.xdata)
        self.xport.Add("io_in_instr_11", self.io_in_instr_11.xdata)
        self.xport.Add("io_in_instr_12", self.io_in_instr_12.xdata)
        self.xport.Add("io_in_instr_13", self.io_in_instr_13.xdata)
        self.xport.Add("io_in_instr_14", self.io_in_instr_14.xdata)
        self.xport.Add("io_in_instr_15", self.io_in_instr_15.xdata)
        self.xport.Add("io_out_pd_0_brType", self.io_out_pd_0_brType.xdata)
        self.xport.Add("io_out_pd_0_isCall", self.io_out_pd_0_isCall.xdata)
        self.xport.Add("io_out_pd_0_isRet", self.io_out_pd_0_isRet.xdata)
        self.xport.Add("io_out_pd_1_brType", self.io_out_pd_1_brType.xdata)
        self.xport.Add("io_out_pd_1_isCall", self.io_out_pd_1_isCall.xdata)
        self.xport.Add("io_out_pd_1_isRet", self.io_out_pd_1_isRet.xdata)
        self.xport.Add("io_out_pd_2_brType", self.io_out_pd_2_brType.xdata)
        self.xport.Add("io_out_pd_2_isCall", self.io_out_pd_2_isCall.xdata)
        self.xport.Add("io_out_pd_2_isRet", self.io_out_pd_2_isRet.xdata)
        self.xport.Add("io_out_pd_3_brType", self.io_out_pd_3_brType.xdata)
        self.xport.Add("io_out_pd_3_isCall", self.io_out_pd_3_isCall.xdata)
        self.xport.Add("io_out_pd_3_isRet", self.io_out_pd_3_isRet.xdata)
        self.xport.Add("io_out_pd_4_brType", self.io_out_pd_4_brType.xdata)
        self.xport.Add("io_out_pd_4_isCall", self.io_out_pd_4_isCall.xdata)
        self.xport.Add("io_out_pd_4_isRet", self.io_out_pd_4_isRet.xdata)
        self.xport.Add("io_out_pd_5_brType", self.io_out_pd_5_brType.xdata)
        self.xport.Add("io_out_pd_5_isCall", self.io_out_pd_5_isCall.xdata)
        self.xport.Add("io_out_pd_5_isRet", self.io_out_pd_5_isRet.xdata)
        self.xport.Add("io_out_pd_6_brType", self.io_out_pd_6_brType.xdata)
        self.xport.Add("io_out_pd_6_isCall", self.io_out_pd_6_isCall.xdata)
        self.xport.Add("io_out_pd_6_isRet", self.io_out_pd_6_isRet.xdata)
        self.xport.Add("io_out_pd_7_brType", self.io_out_pd_7_brType.xdata)
        self.xport.Add("io_out_pd_7_isCall", self.io_out_pd_7_isCall.xdata)
        self.xport.Add("io_out_pd_7_isRet", self.io_out_pd_7_isRet.xdata)
        self.xport.Add("io_out_pd_8_brType", self.io_out_pd_8_brType.xdata)
        self.xport.Add("io_out_pd_8_isCall", self.io_out_pd_8_isCall.xdata)
        self.xport.Add("io_out_pd_8_isRet", self.io_out_pd_8_isRet.xdata)
        self.xport.Add("io_out_pd_9_brType", self.io_out_pd_9_brType.xdata)
        self.xport.Add("io_out_pd_9_isCall", self.io_out_pd_9_isCall.xdata)
        self.xport.Add("io_out_pd_9_isRet", self.io_out_pd_9_isRet.xdata)
        self.xport.Add("io_out_pd_10_brType", self.io_out_pd_10_brType.xdata)
        self.xport.Add("io_out_pd_10_isCall", self.io_out_pd_10_isCall.xdata)
        self.xport.Add("io_out_pd_10_isRet", self.io_out_pd_10_isRet.xdata)
        self.xport.Add("io_out_pd_11_brType", self.io_out_pd_11_brType.xdata)
        self.xport.Add("io_out_pd_11_isCall", self.io_out_pd_11_isCall.xdata)
        self.xport.Add("io_out_pd_11_isRet", self.io_out_pd_11_isRet.xdata)
        self.xport.Add("io_out_pd_12_brType", self.io_out_pd_12_brType.xdata)
        self.xport.Add("io_out_pd_12_isCall", self.io_out_pd_12_isCall.xdata)
        self.xport.Add("io_out_pd_12_isRet", self.io_out_pd_12_isRet.xdata)
        self.xport.Add("io_out_pd_13_brType", self.io_out_pd_13_brType.xdata)
        self.xport.Add("io_out_pd_13_isCall", self.io_out_pd_13_isCall.xdata)
        self.xport.Add("io_out_pd_13_isRet", self.io_out_pd_13_isRet.xdata)
        self.xport.Add("io_out_pd_14_brType", self.io_out_pd_14_brType.xdata)
        self.xport.Add("io_out_pd_14_isCall", self.io_out_pd_14_isCall.xdata)
        self.xport.Add("io_out_pd_14_isRet", self.io_out_pd_14_isRet.xdata)
        self.xport.Add("io_out_pd_15_brType", self.io_out_pd_15_brType.xdata)
        self.xport.Add("io_out_pd_15_isCall", self.io_out_pd_15_isCall.xdata)
        self.xport.Add("io_out_pd_15_isRet", self.io_out_pd_15_isRet.xdata)


        # Cascaded ports
        self.io = self.xport.NewSubPort("io_")
        self.io_in_instr = self.xport.NewSubPort("io_in_instr_")
        self.io_out_pd = self.xport.NewSubPort("io_out_pd_")
        self.io_out_pd_0 = self.xport.NewSubPort("io_out_pd_0_")
        self.io_out_pd_1 = self.xport.NewSubPort("io_out_pd_1_")
        self.io_out_pd_10 = self.xport.NewSubPort("io_out_pd_10_")
        self.io_out_pd_11 = self.xport.NewSubPort("io_out_pd_11_")
        self.io_out_pd_12 = self.xport.NewSubPort("io_out_pd_12_")
        self.io_out_pd_13 = self.xport.NewSubPort("io_out_pd_13_")
        self.io_out_pd_14 = self.xport.NewSubPort("io_out_pd_14_")
        self.io_out_pd_15 = self.xport.NewSubPort("io_out_pd_15_")
        self.io_out_pd_2 = self.xport.NewSubPort("io_out_pd_2_")
        self.io_out_pd_3 = self.xport.NewSubPort("io_out_pd_3_")
        self.io_out_pd_4 = self.xport.NewSubPort("io_out_pd_4_")
        self.io_out_pd_5 = self.xport.NewSubPort("io_out_pd_5_")
        self.io_out_pd_6 = self.xport.NewSubPort("io_out_pd_6_")
        self.io_out_pd_7 = self.xport.NewSubPort("io_out_pd_7_")
        self.io_out_pd_8 = self.xport.NewSubPort("io_out_pd_8_")
        self.io_out_pd_9 = self.xport.NewSubPort("io_out_pd_9_")


    def __del__(self):
        self.Finish()

    ################################
    #         User APIs            #
    ################################
    def InitClock(self, name: str):
        self.xclock.Add(self.xport[name])

    def Step(self, i:int = 1):
        self.xclock.Step(i)

    def StepRis(self, callback, args=(), kwargs={}):
        self.xclock.StepRis(callback, args, kwargs)

    def StepFal(self, callback, args=(), kwargs={}):
        self.xclock.StepFal(callback, args, kwargs)

    def SetWaveform(self, filename: str):
        self.dut.SetWaveform(filename)

    def SetCoverage(self, filename: str):
        self.dut.SetCoverage(filename)

    def Finish(self):
        self.dut.Finish()

    def RefreshComb(self):
        self.dut.RefreshComb()

    ################################
    #      End of User APIs        #
    ################################

    def __getitem__(self, key):
        return xsp.XPin(self.port[key], self.event)

    # Async APIs wrapped from XClock
    async def AStep(self,i: int):
        return await self.xclock.AStep(i)

    async def Acondition(self,fc_cheker):
        return await self.xclock.ACondition(fc_cheker)

    def RunStep(self,i: int):
        return self.xclock.RunStep(i)

    def __setattr__(self, name, value):
        assert not isinstance(getattr(self, name, None),
                              (xsp.XPin, xsp.XData)), \
        f"XPin and XData of DUT are read-only, do you mean to set the value of the signal? please use `{name}.value = ` instead."
        return super().__setattr__(name, value)


if __name__=="__main__":
    dut=DUTF3Predecoder()
    dut.Step(100)
