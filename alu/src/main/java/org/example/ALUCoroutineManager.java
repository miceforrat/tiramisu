package org.example;

import com.ut.UT_ALU;
import org.xaspect.AutoDUTDao;
import org.xaspect.DUTCoroutineManager;

public interface ALUCoroutineManager extends DUTCoroutineManager<UT_ALU> {

    @AutoDUTDao
    ALUDutDao getALUDutDao();
}
