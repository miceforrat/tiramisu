package com.ut;

public class example {
	public static void main(String[] args) {
	  UT_FIFO dut = new UT_FIFO();
	  for(int i = 0; i<10; i++){
		dut.Step();
	  }
	  dut.Finish();
	  System.out.println("Step FIFO 10 times complete");
	}
}
