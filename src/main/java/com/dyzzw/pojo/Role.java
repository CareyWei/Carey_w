package com.dyzzw.pojo;

public class Role {
    private Integer rid ;
    private  String identity;

    @Override
    public String toString() {
        return "Role{" +
                "rid=" + rid +
                ", identity='" + identity + '\'' +
                '}';
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public Role(Integer rid, String identity) {
        this.rid = rid;
        this.identity = identity;
    }

    public Role() {
    }
}
