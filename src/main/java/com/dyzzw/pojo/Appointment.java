package com.dyzzw.pojo;

import java.util.Date;

public class Appointment {
    private Long apId;
    private Long uid;
    private String appointTime;
    private Integer dCid;
    private String apName;
    private String idcast;
    private String aphone;
    private String apAddress;
    private Date createTime;
    private Date updateTime;
    private Doctor doctor;
    private String key;
    private Integer count;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "apId=" + apId +
                ", uid=" + uid +
                ", appointTime='" + appointTime + '\'' +
                ", dCid=" + dCid +
                ", apName='" + apName + '\'' +
                ", idcast='" + idcast + '\'' +
                ", aphone='" + aphone + '\'' +
                ", apAddress='" + apAddress + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", doctor=" + doctor +
                ", key='" + key + '\'' +
                ", count='" + count + '\'' +
                '}';
    }

    public Long getApId() {
        return apId;
    }

    public void setApId(Long apId) {
        this.apId = apId;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getAppointTime() {
        return appointTime;
    }

    public void setAppointTime(String appointTime) {
        this.appointTime = appointTime;
    }

    public Integer getdCid() {
        return dCid;
    }

    public void setdCid(Integer dCid) {
        this.dCid = dCid;
    }

    public String getApName() {
        return apName;
    }

    public void setApName(String apName) {
        this.apName = apName;
    }

    public String getIdcast() {
        return idcast;
    }

    public void setIdcast(String idcast) {
        this.idcast = idcast;
    }

    public String getAphone() {
        return aphone;
    }

    public void setAphone(String aphone) {
        this.aphone = aphone;
    }

    public String getApAddress() {
        return apAddress;
    }

    public void setApAddress(String apAddress) {
        this.apAddress = apAddress;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Appointment(Long apId, Long uid, String appointTime, Integer dCid, String apName, String idcast, String aphone, String apAddress, Date createTime, Date updateTime, Doctor doctor, String key) {
        this.apId = apId;
        this.uid = uid;
        this.appointTime = appointTime;
        this.dCid = dCid;
        this.apName = apName;
        this.idcast = idcast;
        this.aphone = aphone;
        this.apAddress = apAddress;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.doctor = doctor;
        this.key = key;
    }

    public Appointment() {
    }
}
