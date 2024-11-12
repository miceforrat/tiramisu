import com.ut.UT_Adder;

public class example {
	public static void main(String[] args) {
	  UT_Adder dut = new UT_Adder();
	  for(int i = 0; i<10; i++){
		dut.Step();
	  }
	  dut.Finish();
	  System.out.println("Step Adder 101 times complete");
	}
}
