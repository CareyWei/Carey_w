package com.dyzzw.pojo;

import java.util.List;

public class Doctor {
    private Integer dCid ;

    private String name;

    private String email;

    private String pwd;

    private String gender;

    private Integer  hId;

    private String score;

    private Integer grade;

    private Integer did;

    private Integer dTid;
    private Integer rid;

    private String skill;


    private String description;

    private String surgeryweek;

    private Deptlist deptlist;

    private DeptlistT deptlistT;

    private hospital hospital;



    @Override
    public String toString() {
        return "Doctor{" +
                "dCid=" + dCid +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", pwd='" + pwd + '\'' +
                ", gender='" + gender + '\'' +
                ", hId=" + hId +
                ", score=" + score +
                ", grade=" + grade +
                ", did=" + did +
                ", dTid=" + dTid +
                ", rid=" + rid +
                ", skill='" + skill + '\'' +
                ", description='" + description + '\'' +
                ", surgeryweek='" + surgeryweek + '\'' +
                ", deptlist=" + deptlist +
                ", deptlistT=" + deptlistT +
                ", hospital=" + hospital +

                '}';
    }

    public Integer getdCid() {
        return dCid;
    }

    public void setdCid(Integer dCid) {
        this.dCid = dCid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer gethId() {
        return hId;
    }

    public void sethId(Integer hId) {
        this.hId = hId;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
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

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSurgeryweek() {
        return surgeryweek;
    }

    public void setSurgeryweek(String surgeryweek) {
        this.surgeryweek = surgeryweek;
    }

    public Deptlist getDeptlist() {
        return deptlist;
    }

    public void setDeptlist(Deptlist deptlist) {
        this.deptlist = deptlist;
    }

    public DeptlistT getDeptlistT() {
        return deptlistT;
    }

    public void setDeptlistT(DeptlistT deptlistT) {
        this.deptlistT = deptlistT;
    }

    public com.dyzzw.pojo.hospital getHospital() {
        return hospital;
    }

    public void setHospital(com.dyzzw.pojo.hospital hospital) {
        this.hospital = hospital;
    }



    public Doctor(Integer dCid, String name, String email, String pwd, String gender, Integer hId, String score, Integer grade, Integer did, Integer dTid, Integer rid, String skill, String description, String surgeryweek, Deptlist deptlist, DeptlistT deptlistT, com.dyzzw.pojo.hospital hospital) {
        this.dCid = dCid;
        this.name = name;
        this.email = email;
        this.pwd = pwd;
        this.gender = gender;
        this.hId = hId;
        this.score = score;
        this.grade = grade;
        this.did = did;
        this.dTid = dTid;
        this.rid = rid;
        this.skill = skill;
        this.description = description;
        this.surgeryweek = surgeryweek;
        this.deptlist = deptlist;
        this.deptlistT = deptlistT;
        this.hospital = hospital;

    }

    public Doctor() {
    }
}
