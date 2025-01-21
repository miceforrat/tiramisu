#coding=utf8

try:
    from . import xspcomm as xsp
except Exception as e:
    import xspcomm as xsp

if __package__ or "." in __name__:
    from .libUT_RVCExpander import *
else:
    from libUT_RVCExpander import *


class DUTRVCExpander(object):

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
        self.io_in = xsp.XPin(xsp.XData(32, xsp.XData.In), self.event)
        self.io_fsIsOff = xsp.XPin(xsp.XData(0, xsp.XData.In), self.event)
        self.io_out_bits = xsp.XPin(xsp.XData(32, xsp.XData.Out), self.event)
        self.io_ill = xsp.XPin(xsp.XData(0, xsp.XData.Out), self.event)


        # BindDPI
        self.io_in.BindDPIPtr(self.dut.GetDPIHandle("io_in", 0), self.dut.GetDPIHandle("io_in", 1))
        self.io_fsIsOff.BindDPIPtr(self.dut.GetDPIHandle("io_fsIsOff", 0), self.dut.GetDPIHandle("io_fsIsOff", 1))
        self.io_out_bits.BindDPIPtr(self.dut.GetDPIHandle("io_out_bits", 0), self.dut.GetDPIHandle("io_out_bits", 1))
        self.io_ill.BindDPIPtr(self.dut.GetDPIHandle("io_ill", 0), self.dut.GetDPIHandle("io_ill", 1))


        # Add2Port
        self.xport.Add("io_in", self.io_in.xdata)
        self.xport.Add("io_fsIsOff", self.io_fsIsOff.xdata)
        self.xport.Add("io_out_bits", self.io_out_bits.xdata)
        self.xport.Add("io_ill", self.io_ill.xdata)


        # Cascaded ports
        self.io = self.xport.NewSubPort("io_")


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
    dut=DUTRVCExpander()
    dut.Step(100)
