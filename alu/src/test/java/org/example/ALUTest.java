package org.example;
import org.junit.*;
import org.xaspect.datas.Pin;
import org.xaspect.services.ServiceRunner;
import org.xaspect.testSupports.CoverageManager;
import org.xaspect.testSupports.RefRepository;


import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;


public class ALUTest {
    
    private final int limit = 0xFF;

//    @AutoDUT
//    ALUWrapper alu = new ALUWrapper();
    ALUWrapper alu;

    static CoverageManager coverageManager;

    @BeforeClass
    public static void setUpBeforeClass() {
//        coverageManager = CoverageManager.getCoverageManager("ALU");
        RefRepository.getInstance().submitRefModel("a", new ALURef());
    }

    @Before
    public void setUp() throws Exception {
        alu = new ALUWrapper();

//        CoverageGroup testingCoverage = coverageManager.getCoverageGroup("testing");
//
//        Map<String, Function<UT_ALU, Boolean>> coverageMap = new HashMap<>();
//
//        for (int i =0 ; i< 16; i++){
//            int finalI = i;
//            coverageMap.put(String.format("Sel%d", i), utAlu -> utAlu.alu_sel.U().intValue() == finalI);
//        }
//
//        testingCoverage.createWatchPointWithClock("32", coverageMap, alu.alu, alu.cm);
//        coverageManager.addCoverageGroupForSingleClock(testingCoverage, alu.cm);
//        coverageManager = CoverageManager.getCoverageManager(alu.cm);
    }

    @After
    public void tearDown() throws Exception {
//        this.alu.clear();
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
//                int res = alu.process(in);
////                assertEquals((a+b) & limit, alu.process(in));
//            }
//        }
//
//    }

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
//                    int res = alu.process(in);
////                    assertEquals(refModel(in.a, in.b, in.sel), res);
//                }
//            }
//        }
//    }

//    @Test
//    public void randTest(){
//        Random random = new Random();
//        random.setSeed(System.currentTimeMillis());
//        ALUIO in = new ALUIO();
//        for (int i = 0 ; i < 10000; i++){
//            in.a = random.nextInt( 256);
//            in.b = random.nextInt( 256);
//            in.sel  = random.nextInt( 16);
//            int res = alu.process(in);
////            assertEquals(res, refModel(in.a, in.b, in.sel));
//        }
//    }
    @Test
    public void parallelTest(){
//        List<Thread> threads = new ArrayList<>();
//        Semaphore sem = new Semaphore(0);
//        AtomicInteger wait = new AtomicInteger(0);
//
//        Lock lock = new ReentrantLock();
//
//        Thread thread1 = new Thread(()->{
////            alu.cm.register();
////            if (wait.incrementAndGet() < 2){
////                sem.acquireUninterruptibly();
////            } else {
////                sem.release(wait.get() - 1);
////            }
//            for (int i = 0; i < 100; i++){
//                Random random = new Random();
//                int a = random.nextInt(256);
//                int b = random.nextInt(256);
//                lock.lock();
//                alu.mainFunc(a,b);
//                lock.unlock();
//            }
//        });
        for (int i = 0; i < 100; i++){
            Random random = new Random();
            int a = random.nextInt(256);
            int b = random.nextInt(256);
            alu.mainFunc(a,b);
        }

//        threads.add(thread1);
//        thread1.start();
//        Thread thread2 = new Thread(()->{
////            alu.cm.register();
////            if (wait.incrementAndGet() < 2){
////                sem.acquireUninterruptibly();
////            } else {
////                sem.release(wait.get() - 1);
////            }
//            for (int i = 0; i < 100; i++){
//                Random random = new Random();
//                int sel = random.nextInt(16);
//                lock.lock();
//                alu.anotherFunc(sel);
//                lock.unlock();
//            }
//        });
//        threads.add(thread2);
//        thread2.start();
//
//        for (Thread thread : threads){
//            try {
//                thread.join();
//            } catch (InterruptedException e) {
////                throw new RuntimeException(e);
//            }
//        }
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
