package org.example;

import java.math.BigInteger;
import java.util.Random;

public class Main {
    public static void main(String[] args) throws Exception {
        Random random = new Random();
        random.setSeed(System.currentTimeMillis());
        ALUIO in = new ALUIO();
        ALUWrapper wrapper = new ALUWrapper();
        for (int i = 0 ; i < 100000; i++){
            in.a = random.nextInt( 256);
            in.b = random.nextInt( 256);
            in.sel  = random.nextInt( 16);
            wrapper.process(in);
//            System.out.println(wrapper.process(in, 1));

        }
    }
}
