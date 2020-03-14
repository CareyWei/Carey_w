package com.dyzzw.util;

import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.Permission;

import java.util.List;

public class ActiverUser {
    private Doctor doctor;
    private List<String> roles;
    private List<Permission> permissions;

    @Override
    public String toString() {
        return "ActiverUser{" +
                "doctor=" + doctor +
                ", roles=" + roles +
                ", permissions=" + permissions +
                '}';
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public ActiverUser(Doctor doctor, List<String> roles, List<Permission> permissions) {
        this.doctor = doctor;
        this.roles = roles;
        this.permissions = permissions;
    }

    public ActiverUser() {
    }
}
