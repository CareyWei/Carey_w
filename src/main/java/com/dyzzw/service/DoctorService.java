package com.dyzzw.service;

import com.dyzzw.dto.DoctorPage;
import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.Page;

import java.util.List;

public interface DoctorService {
    //分页查询
    //关键字搜索
    Page<Doctor> selectToPage(DoctorPage doctorPage,String key);
    //无关键字直接搜索
     Page<Doctor> select (DoctorPage doctorPage);
    //查询全部
    public List<Doctor> checkDoc();
    //根据ID查医生
    public Doctor getDoctorById(Integer dCid);
    //批量删除
    public int deletelist(Integer [] dCid);
    //修改编辑
    public int update(Doctor doctor);
    //插入
    public int insert (Doctor doctor);
 }
