package com.dyzzw.pojo;

import java.util.Date;

public class tuser {
    private Long uid;
    private String name;
    private String pwd;
    private String phone;
    private String email;
    private  Date createtime;
    private  Date updatetime;
    private  int role;
    private int state;
    private String key;


    @Override
    public String toString() {
        return "tuser{" +
                "uid=" + uid +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", createtime=" + createtime +
                ", updatetime=" + updatetime +
                ", role=" + role +
                ", state=" + state +
                ", key='" + key + '\'' +
                '}';
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public tuser(Long uid, String name, String pwd, String phone, String email, Date createtime, Date updatetime, int role, int state, String key) {
        this.uid = uid;
        this.name = name;
        this.pwd = pwd;
        this.phone = phone;
        this.email = email;
        this.createtime = createtime;
        this.updatetime = updatetime;
        this.role = role;
        this.state = state;
        this.key = key;
    }

    public tuser() {
    }
}