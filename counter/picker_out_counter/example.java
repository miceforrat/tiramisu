package com.ut;

public class example {
	public static void main(String[] args) {
	  UT_Counter dut = new UT_Counter();
	  for(int i = 0; i<10; i++){
		dut.Step();
	  }
	  dut.Finish();
	  System.out.println("Step Counter 10 times complete");
	}
}
