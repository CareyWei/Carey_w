package com.dyzzw.pojo;

import java.util.List;

public class Page<T> {
    //总记录数
    private Integer totalCount;
    //总页数
    private Integer totalPage;
    //当前页数
    private Integer PageNum;
    //每页显示记录数
    private Integer PageSize;
    private List<T> data;

    @Override
    public String toString() {
        return "Page{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", PageNum=" + PageNum +
                ", PageSize=" + PageSize +
                ", data=" + data +
                '}';
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
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

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public Page(Integer totalCount, Integer totalPage, Integer pageNum, Integer pageSize, List<T> data) {
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        PageNum = pageNum;
        PageSize = pageSize;
        this.data = data;
    }

    public Page() {
    }
}
