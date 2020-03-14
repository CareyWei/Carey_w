package com.dyzzw.service;

import com.dyzzw.pojo.Appointment;

import java.util.List;

public interface AppointmentService {
    public boolean checkAppoint(Appointment appointment);
    //预约
    public int insert(Appointment appointment);
    //
    public int checkTime(String appointTime,Integer dCid);
    //多表查询
    public Appointment checkAppointManage(Appointment appointment);
    //预约信息
    public List<Appointment> checkMessage(Appointment appointment);

    //批量删除
    public int deleteAppoint(Long  [] apId);
    //查询预约列表
    public List<Appointment> AppointMessage(Appointment appointment,String key,int pageNum,int pageSize);
    //修改编辑啊
    public int update(Appointment appointment);
}
