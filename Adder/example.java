import com.ut.UT_Adder;

public class example {
	public static void main(String[] args) {
	  	UT_Adder dut = new UT_Adder();
	//   for(int i = 0; i<10; i++){
	// 	dut.Step();
	//   }
	//   dut.Finish();
	//   System.out.println("Step Adder 101 times complete");
	// System.out.println(dut.a.GetWriteMode());
		dut.a.Set(1419104191014L);
		dut.b.Set(1134174771484L);
		dut.cin.Set(1);
		dut.Step();
		System.out.println(dut.sum.S());
		System.out.println(dut.cout.S());
	}
}
