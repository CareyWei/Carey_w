package com.dyzzw.pojo;

public class Message {
    private String msg ;
    private tuser tu;

    public Message(String msg) {
        this.msg = msg;
    }

    public Message(String msg, tuser tu) {
        this.msg = msg;
        this.tu = tu;
    }

    public Message() {
    }

    public Message(tuser tu) {
        this.tu = tu;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public tuser getTu() {
        return tu;
    }

    public void setTu(tuser tu) {
        this.tu = tu;
    }
}
