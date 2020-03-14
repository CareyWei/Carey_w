package com.dyzzw.pojo;

import java.util.List;

public class Deptlist {
    private Integer did;
    private String dname;
    private String key;
    private List<DeptlistT> deptlistT;

    @Override
    public String toString() {
        return "Deptlist{" +
                "did=" + did +
                ", dname='" + dname + '\'' +
                ", key='" + key + '\'' +
                ", deptlistT=" + deptlistT +
                '}';
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public List<DeptlistT> getDeptlistT() {
        return deptlistT;
    }

    public void setDeptlistT(List<DeptlistT> deptlistT) {
        this.deptlistT = deptlistT;
    }

    public Deptlist(Integer did, String dname, String key, List<DeptlistT> deptlistT) {
        this.did = did;
        this.dname = dname;
        this.key = key;
        this.deptlistT = deptlistT;
    }

    public Deptlist() {
    }
}