package org.example;

import org.xaspect.datas.Pin;

public class CtrlInfos {
    @Pin
    int empty;
    @Pin
    int full;

    CtrlInfos() {
    }

    CtrlInfos(int empty, int full) {
        this.empty = empty;
        this.full = full;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof CtrlInfos) {
            CtrlInfos other = (CtrlInfos) obj;
            return empty == other.empty && full == other.full;
        }
        return false;
    }
}