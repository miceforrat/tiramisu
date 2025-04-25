package org.example;
import com.ut.UT_ALU;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.parallel.Execution;
import org.junit.jupiter.api.parallel.ExecutionMode;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.xaspect.AutoDUTDao;

import static org.junit.jupiter.api.Assertions.assertEquals;

@Execution(ExecutionMode.CONCURRENT)
public class ALUTest {
    
    private final int limit = 0xFF;

    UT_ALU alu;

    @AutoDUTDao
    ALUDutDao dao;


    @BeforeEach
    public void setUp() throws Exception {
        alu = new UT_ALU();
        dao.bind(alu);
    }

    @AfterEach
    public void tearDown() throws Exception {
        this.alu.Finish();
    }

//    @Test
//    public void testAll(){
//        for (int sel = 0; sel < 16; sel++) {
//
//            for (int a = 0; a < 256; a++) {
//                for (int b = 0; b < 256; b++) {
//                    assertEquals(refModel(a, b, sel), process(a, b, sel));
//                }
//            }
//        }
//    }
    @ParameterizedTest
    @ValueSource(ints = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15})
    void testAllBySel(int sel) {
        for (int a = 0; a < 256; a++) {
            for (int b = 0; b < 256; b++) {
                assertEquals(refModel(a, b, sel), process(a, b, sel), String.format("Mismatch at a=%d, b=%d, sel=%d", a, b, sel));
            }
        }
    }

    public int process(int a, int b, int sel) {
        dao.postIn(a, b, sel);
        alu.Step();
        return dao.getOut();
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
