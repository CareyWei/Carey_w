package com.dyzzw.pojo;

public class area {
    private  Integer arId;
    private  String arname;

    public area() {


    }

    @Override
    public String toString() {
        return "area{" +
                "arId=" + arId +
                ", arname='" + arname + '\'' +
                '}';
    }

    public Integer getArId() {
        return arId;
    }

    public void setArId(Integer arId) {
        this.arId = arId;
    }

    public String getArname() {
        return arname;
    }

    public void setArname(String arname) {
        this.arname = arname;
    }

    public area(Integer arId, String arname) {
        this.arId = arId;
        this.arname = arname;
    }
}
