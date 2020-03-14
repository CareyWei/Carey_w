package com.dyzzw.service.impl;

import com.dyzzw.mapper.AppointmentMapper;
import com.dyzzw.pojo.Appointment;
import com.dyzzw.service.AppointmentService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AppointmentServiceImpl implements AppointmentService {
    @Resource
    private AppointmentMapper appointmentMapper;


    @Override
    public boolean checkAppoint(Appointment appointment) {
        if(appointmentMapper.checkAppoint(appointment) == null){
            return true;
        }else {
            return false;
        }

    }

    @Override
    public int insert(Appointment appointment) {
        return appointmentMapper.insert(appointment);
    }

    @Override
    public int checkTime(String appointTime,Integer dCid) {
        return appointmentMapper.checkTime(appointTime,dCid);
    }

    @Override
    public Appointment checkAppointManage(Appointment appointment) {
        return appointmentMapper.checkAppointManage(appointment);
    }

    @Override
    public List<Appointment> checkMessage(Appointment appointment) {
        return appointmentMapper.AppointMessage(appointment);
    }


    @Override
    public int deleteAppoint(Long []  apId) {
        return appointmentMapper.deleteAppoint(apId);
    }

    @Override
    public List<Appointment> AppointMessage(Appointment appointment, String key, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        appointment.setKey(key);
        List<Appointment> appointments = appointmentMapper.AppointMessage(appointment);

        return appointments;
    }

    @Override
    public int update(Appointment appointment) {
        return appointmentMapper.update(appointment);
    }
}
