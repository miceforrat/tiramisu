package org.example;

import co.paralleluniverse.fibers.Suspendable;
import org.xaspect.AutoDUT;
import org.xaspect.AutoDUTDao;

public class ALUCoWrapper {

    @AutoDUT
    public ALUCoroutineManager manager;

//    @AutoDUTDao
//    public ALUDutDao dutDao;

    ALUCoWrapper(){
    }

    @Suspendable
    public void funcAb(int a, int b){
        manager.getALUDutDao().setAb(a, b);
        manager.getXClockManager().step();
    }

    @Suspendable
    public void funcSel(int sel){
        manager.getDUT().alu_sel.Set(sel);
        manager.getXClockManager().step();
    }

    @Suspendable
    public int getRes(){
        manager.getXClockManager().step();
        return manager.getDUT().alu_out.U().intValue();
    }
}
