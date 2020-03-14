package com.dyzzw.dto;

public class HospitalPage {
    //地区ID，
    private Integer arId;
    private Integer hId;
    private Integer grade;
    private String hLevel;
    private String key;
    private Integer PageNum = 1;
    private Integer  PageSize = 5;

    @Override
    public String toString() {
        return "HospitalPage{" +
                "arId=" + arId +
                ", hId=" + hId +
                ", grade=" + grade +
                ", hLevel='" + hLevel + '\'' +
                ", key='" + key + '\'' +
                ", PageNum=" + PageNum +
                ", PageSize=" + PageSize +
                '}';
    }

    public Integer getArId() {
        return arId;
    }

    public void setArId(Integer arId) {
        this.arId = arId;
    }

    public Integer gethId() {
        return hId;
    }

    public void sethId(Integer hId) {
        this.hId = hId;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String gethLevel() {
        return hLevel;
    }

    public void sethLevel(String hLevel) {
        this.hLevel = hLevel;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Integer getPageNum() {
        return PageNum;
    }

    public void setPageNum(Integer pageNum) {
        PageNum = pageNum;
    }

    public Integer getPageSize() {
        return PageSize;
    }

    public void setPageSize(Integer pageSize) {
        PageSize = pageSize;
    }

    public HospitalPage(Integer arId, Integer hId, Integer grade, String hLevel, String key, Integer pageNum, Integer pageSize) {
        this.arId = arId;
        this.hId = hId;
        this.grade = grade;
        this.hLevel = hLevel;
        this.key = key;
        PageNum = pageNum;
        PageSize = pageSize;
    }

    public HospitalPage() {
    }
}
