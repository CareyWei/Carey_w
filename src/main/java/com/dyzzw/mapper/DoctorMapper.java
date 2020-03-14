package com.dyzzw.mapper;

import com.dyzzw.dto.DoctorPage;
import com.dyzzw.pojo.Doctor;

import java.util.List;

public interface DoctorMapper {
    //分页查询
    public List<Doctor> selectToPage(DoctorPage doctorPage);
    //查询总数
    public Integer selectToPageTotalCount(DoctorPage doctorPage);
    //查询全部
    public List<Doctor> checkDoc();
    //查询名称
    public List<Doctor> checkName(String name);
    //根据ID查医院
    public Doctor getDoctorById(Integer dCid);
    //批量删除
    public int deleteList(Integer [] dCid);
    //修改编辑
    public int update(Doctor doctor);
    //插入
    public int insert(Doctor doctor);

 }
