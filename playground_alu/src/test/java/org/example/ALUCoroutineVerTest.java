//package org.example;
//
//import org.junit.Test;
//
//import java.util.Random;
//
//public class ALUCoroutineVerTest {
//    ALUCoWrapper wrapper = new ALUCoWrapper();
//
//    @Test
//    public void testCoroutineInFramework(){
//        final int TIMES= 10000;
//        final int NUM_LIMIT = 256;
//        wrapper.manager.getServiceRunner().getChannel("a")
//                .addSuspendableRunnable(()->{
//                    Random random = new Random();
//                    for (int i = 0; i < TIMES; i++) {
//                        int a = random.nextInt(NUM_LIMIT);
//                        int b = random.nextInt(NUM_LIMIT);
//                        wrapper.funcAb(a, b);
//                    }
//                });
//
//        wrapper.manager.getServiceRunner().getChannel("sel").addSuspendableRunnable(()->{
//            Random random = new Random();
//            for (int i =0; i < TIMES; i++) {
//                int sel = random.nextInt(NUM_LIMIT);
//                wrapper.funcSel(sel);
//            }
//        });
////
//        wrapper.manager.getServiceRunner().getChannel("res").addSuspendableRunnable(()->{
//            for (int i =0; i < TIMES; i++) {
//                wrapper.getRes();
//            }
//        });
//
//        wrapper.manager.getServiceRunner().runAll();
//
//    }
//}
