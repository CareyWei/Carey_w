package com.dyzzw.pojo;

import java.util.List;

public class admin {
    private  int aId ;
    private  String name;
    private String pwd;
    private int rid;


    @Override
    public String toString() {
        return "admin{" +
                "aId=" + aId +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", rid=" + rid +

                '}';
    }

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }


    public admin(int aId, String name, String pwd, int rid) {
        this.aId = aId;
        this.name = name;
        this.pwd = pwd;
        this.rid = rid;

    }

    public admin() {
    }
}
