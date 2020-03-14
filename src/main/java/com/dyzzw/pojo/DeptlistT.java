package com.dyzzw.pojo;

public class DeptlistT {
    private  Integer dTid;
    private  String dTname;
    private  Integer did;
    private String key;
    private Deptlist deptlist;

    @Override
    public String toString() {
        return "DeptlistT{" +
                "dTid=" + dTid +
                ", dTname='" + dTname + '\'' +
                ", did=" + did +
                ", key='" + key + '\'' +
                ", deptlist=" + deptlist +
                '}';
    }

    public Integer getdTid() {
        return dTid;
    }

    public void setdTid(Integer dTid) {
        this.dTid = dTid;
    }

    public String getdTname() {
        return dTname;
    }

    public void setdTname(String dTname) {
        this.dTname = dTname;
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Deptlist getDeptlist() {
        return deptlist;
    }

    public void setDeptlist(Deptlist deptlist) {
        this.deptlist = deptlist;
    }

    public DeptlistT(Integer dTid, String dTname, Integer did, String key, Deptlist deptlist) {
        this.dTid = dTid;
        this.dTname = dTname;
        this.did = did;
        this.key = key;
        this.deptlist = deptlist;
    }

    public DeptlistT() {
    }
}
