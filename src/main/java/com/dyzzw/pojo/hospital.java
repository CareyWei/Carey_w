package com.dyzzw.pojo;

public class hospital {
    private  Integer hId ;
    private  String hName ;
    private  String hLevel;
    private  String hPhone;
    private  String hAddress;
    private  String hInformation;
    private  Integer arId;
    private area Area;

    @Override
    public String toString() {
        return "hospital{" +
                "hId=" + hId +
                ", hName='" + hName + '\'' +
                ", hLevel='" + hLevel + '\'' +
                ", hPhone='" + hPhone + '\'' +
                ", hAddress='" + hAddress + '\'' +
                ", hInformation='" + hInformation + '\'' +
                ", arId=" + arId +
                ", Area=" + Area +
                '}';
    }

    public Integer gethId() {
        return hId;
    }

    public void sethId(Integer hId) {
        this.hId = hId;
    }

    public String gethName() {
        return hName;
    }

    public void sethName(String hName) {
        this.hName = hName;
    }

    public String gethLevel() {
        return hLevel;
    }

    public void sethLevel(String hLevel) {
        this.hLevel = hLevel;
    }

    public String gethPhone() {
        return hPhone;
    }

    public void sethPhone(String hPhone) {
        this.hPhone = hPhone;
    }

    public String gethAddress() {
        return hAddress;
    }

    public void sethAddress(String hAddress) {
        this.hAddress = hAddress;
    }

    public String gethInformation() {
        return hInformation;
    }

    public void sethInformation(String hInformation) {
        this.hInformation = hInformation;
    }

    public Integer getArId() {
        return arId;
    }

    public void setArId(Integer arId) {
        this.arId = arId;
    }

    public area getArea() {
        return Area;
    }

    public void setArea(area area) {
        Area = area;
    }

    public hospital(Integer hId, String hName, String hLevel, String hPhone, String hAddress, String hInformation, Integer arId, area area) {
        this.hId = hId;
        this.hName = hName;
        this.hLevel = hLevel;
        this.hPhone = hPhone;
        this.hAddress = hAddress;
        this.hInformation = hInformation;
        this.arId = arId;
        Area = area;
    }

    public hospital() {
    }
}
