package com.ut;

public class example {
	public static void main(String[] args) {
	  UT_ALU dut = new UT_ALU();
	  for(int i = 0; i<10; i++){
		dut.Step();
	  }
	  dut.Finish();
	  System.out.println("Step ALU 10 times complete");
	}
}
