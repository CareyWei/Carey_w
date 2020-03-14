package com.dyzzw.pojo;

import java.util.List;

public class Permission {

    // 菜单id
    private String mid;
    // 菜单名称
    private String Mname;
    // 父菜单id
    private Integer parent_id;
    // 菜单url
    private String url;
    // 菜单顺序
    private Integer level;
    //菜单属性
    private String type;
    //菜单权限
    private String percode;
    //子菜单
    private List<Permission> child;

    public Permission(String mid, String mname, Integer parent_id, String url, Integer level, String type, String percode, List<Permission> child) {
        this.mid = mid;
        Mname = mname;
        this.parent_id = parent_id;
        this.url = url;
        this.level = level;
        this.type = type;
        this.percode = percode;
        this.child = child;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "mid='" + mid + '\'' +
                ", Mname='" + Mname + '\'' +
                ", parent_id='" + parent_id + '\'' +
                ", url='" + url + '\'' +
                ", level=" + level +
                ", type='" + type + '\'' +
                ", percode='" + percode + '\'' +
                ", child=" + child +
                '}';
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMname() {
        return Mname;
    }

    public void setMname(String mname) {
        Mname = mname;
    }

    public Integer getParent_id() {
        return parent_id;
    }

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPercode() {
        return percode;
    }

    public void setPercode(String percode) {
        this.percode = percode;
    }

    public List<Permission> getChild() {
        return child;
    }

    public void setChild(List<Permission> child) {
        this.child = child;
    }

    public Permission() {
    }
}
