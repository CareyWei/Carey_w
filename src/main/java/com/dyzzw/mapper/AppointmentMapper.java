package com.dyzzw.mapper;

import com.dyzzw.pojo.Appointment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppointmentMapper {
    //插入预约表
    int insert(Appointment appointment);
    //预约信息
    Appointment checkAppoint(Appointment appointment);
    //预约时间
    int checkTime(@Param("appointTime") String appointTime,@Param("dCid") Integer dCid);

       //多表查询预约信息
    Appointment checkAppointManage(Appointment appointment);

    //取消预约
    int deleteAppoint(Long [] apId);
    //查询预约列表
    public List<Appointment> AppointMessage(Appointment appointment);
    //修改编辑
    public int update(Appointment appointment);
}
