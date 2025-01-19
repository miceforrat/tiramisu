package org.example;
import co.paralleluniverse.fibers.Fiber;
import com.ut.UT_ALU;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.xaspect.AgentMethod;
import org.xaspect.AutoDUT;
import org.xaspect.clocks.HWTaskExecutor;


import static org.junit.Assert.*;

import java.util.Random;

public class ALUTest {
    
    private int limit = 0xFF;

//    @AutoDUT
    ALUWrapper alu;

    @Before
    public void setUp() throws Exception {
        this.alu = new ALUWrapper();
    }

    @After
    public void tearDown() throws Exception {
        this.alu.clear();
        this.alu = null;
    }
//    private ALUWrapper alu;

    @Test
    public void testAdd() {
        ALUIO in = new ALUIO();
//        HWTaskExecutor executor = new HWTaskExecutor();
//        executor.bindClock(alu.aluTestWrapper.getXClock());
        //                int finalA = a;
//                int finalB = b;
//                executor.submit(executor.taskBuilder()
//                        .adds(()->{
//                            ALUIO in = new ALUIO();
//                            in.ab.a = finalA;
//                            in.ab.b = finalB;
//                            in.sel.sel = 0;
//                            alu.aluTestWrapper.postIn(in);
//                        })
//                        .step().adds(()->{
//                            assertEquals((finalA+finalB) & limit, alu.aluTestWrapper.getOut());
//                        })
//                );
//                executor.execute();

                    for (int a = 0; a < 256; a++) {
                        for (int b = 0; b < 256; b++) {
                            in.ab.a = a;
                            in.ab.b = b;
                            in.sel.sel = 0;
                            int res = (a + b) & limit;
                                        assertEquals(res,
                                                alu.process(in)
                                        );
//                        in.ab.a = a;

//                        in.ab.b = b;
//                        in.sel.sel = 0;
//                        int res = (a + b) & limit;
//                        assertEquals(res,
//                                alu.process(in, 1)
//                        );

                        }
                    }


//        for (int a = 0; a < 256; a++){
//            for (int b = 0; b < 256; b++){
//                in.ab.a = a;
//                in.ab.b = b;
//                in.sel.sel = 0;
//                assertEquals((a+b) & limit, alu.process(in, 1));
//            }
//        }

    }

    @Test
    public void testAll(){
        ALUIO in = new ALUIO();

        for (int a = 0; a < 256; a++){
            for (int b = 0; b < 256; b++){
                for (int c = 0; c < 16; c++){
                    in.ab.a = a;
                    in.ab.b = b;
                    in.sel.sel  = c;
                    assertEquals(refModel(a, b, c), alu.process(in));
                }
            }
        }
//        assertEquals(0, 1);
    }
//
    @Test
    public void randTest(){
        Random random = new Random();
        random.setSeed(System.currentTimeMillis());
        ALUIO in = new ALUIO();
        for (int i = 0 ; i < 100000; i++){
            in.ab.a = random.nextInt( 256);
            in.ab.b = random.nextInt( 256);
            in.sel.sel  = random.nextInt( 16);
            assertEquals(refModel(in.ab.a, (int)in.ab.b, in.sel.sel), alu.process(in));

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
