package org.xaspect;

public class DUTReq<T> {
    public int event;
    public T result;

    public DUTReq(int event){
        this.event = event;
    }
}
