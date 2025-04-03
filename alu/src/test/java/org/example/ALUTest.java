package org.example;
import com.ut.UT_ALU;
import org.junit.*;
import org.xaspect.testSupports.CoverageGroup;
import org.xaspect.testSupports.CoverageManager;
import org.xaspect.testSupports.WatchPoint;
//import org.xaspect.executors.HWTaskExecutor;



import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.function.Function;

public class ALUTest {
    
    private final int limit = 0xFF;

//    @AutoDUT
//    ALUWrapper alu = new ALUWrapper();
    ALUWrapper alu;

    static CoverageManager coverageManager;

    @BeforeClass
    public static void setUpBeforeClass() {
        coverageManager = CoverageManager.getCoverageManager("ALU");
    }

    @Before
    public void setUp() throws Exception {
        alu = new ALUWrapper();

        CoverageGroup testingCoverage = new CoverageGroup("testing");

        Map<String, Function<UT_ALU, Boolean>> coverageMap = new HashMap<>();

        for (int i =0 ; i< 16; i++){
            int finalI = i;
            coverageMap.put(String.format("Sel%d", i), utAlu -> utAlu.alu_sel.U().intValue() == finalI);
        }

        testingCoverage.addWatchPoint(new WatchPoint<>("32", coverageMap, alu.alu));
//        coverageManager.addCoverageGroupForSingleClock(testingCoverage, alu.cm);
//        coverageManager = CoverageManager.getCoverageManager(alu.cm);
    }

    @After
    public void tearDown() throws Exception {
        this.alu.clear();
//        this.coverageManager.printReport();
    }

    @AfterClass
    public static void tearDownAfterClass() throws Exception {
//        coverageManager.printReport();
    }

//    @Test
//    public void testAdd() {
//
//        ALUIO in = new ALUIO();
//        for (int a = 0; a < 256; a++){
//            for (int b = 0; b < 256; b++){
//                in.a = a;
//                in.b = b;
//                in.sel = 0;
//                assertEquals((a+b) & limit, alu.process(in));
//            }
//        }
//
//    }
//
//    @Test
//    public void testAll(){
//        ALUIO in = new ALUIO();
//
//        for (int a = 0; a < 256; a++){
//            for (int b = 0; b < 256; b++){
//                for (int c = 0; c < 16; c++){
//                    in.a = a;
//                    in.b = b;
//                    in.sel  = c;
//                    assertEquals(refModel(in.a, in.b, in.sel),
//                        alu.process(in)
//                    );
//                }
//            }
//        }
////        assertEquals(0, 1);
//    }
////
    @Test
    public void randTest(){
        Random random = new Random();
        random.setSeed(System.currentTimeMillis());
        ALUIO in = new ALUIO();
        for (int i = 0 ; i < 10000000; i++){
            in.a = random.nextInt( 256);
            in.b = random.nextInt( 256);
            in.sel  = random.nextInt( 16);
            alu.process(in);

        }
    }




    private int refModel(int a, int b, int sel){
         switch (sel) {
             case 0b0000: return  (a + b) & limit;
             case 0b0001: return  (a - b) & limit;
             case 0b0010: return  (a * b) & limit;
             case 0b0011: return b != 0 ? a / b : 0;
             case 0b0100: return (a << 1) & limit;
             case 0b0101: return (a >> 1) & limit;
             case 0b0110: return ((a << 1) | (a >> 7)) & limit;
             case 0b0111: return ((a >> 1) | (a << 7)) & limit;
             case 0b1000: return a & b;
             case 0b1001: return a | b;
             case 0b1010: return a ^ b;
             case 0b1011: return ~(a | b) & limit;
             case 0b1100: return ~(a & b) & limit;
             case 0b1101: return ~(a ^ b) & limit;
             case 0b1110: return a > b ? 1 : 0;
             case 0b1111: // Equality
                    return a == b ? 1 : 0;
             default:
                 return (a + b) & limit;
        }
    }


}
