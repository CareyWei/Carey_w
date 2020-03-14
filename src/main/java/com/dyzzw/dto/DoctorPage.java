package com.dyzzw.dto;

public class DoctorPage {
    private Integer did;
    private Integer dTid;
    private Integer grade ;
    private String key;
    private Integer pageNum = 1;
    private Integer pageSize = 4;
    private Integer hId;

    @Override
    public String toString() {
        return "DoctorPage{" +
                "did=" + did +
                ", dTid=" + dTid +
                ", grade=" + grade +
                ", key='" + key + '\'' +
                ", pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", hId=" + hId +
                '}';
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public Integer getdTid() {
        return dTid;
    }

    public void setdTid(Integer dTid) {
        this.dTid = dTid;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer gethId() {
        return hId;
    }

    public void sethId(Integer hId) {
        this.hId = hId;
    }

    public DoctorPage(Integer did, Integer dTid, Integer grade, String key, Integer pageNum, Integer pageSize, Integer hId) {
        this.did = did;
        this.dTid = dTid;
        this.grade = grade;
        this.key = key;
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.hId = hId;
    }

    public DoctorPage() {
    }
}
