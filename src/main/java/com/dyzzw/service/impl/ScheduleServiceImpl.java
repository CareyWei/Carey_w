package com.dyzzw.service.impl;

import com.dyzzw.mapper.AppointmentMapper;
import com.dyzzw.pojo.Appointment;
import com.dyzzw.service.ScheduleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Resource
    private AppointmentMapper appointmentMapper;

    @Override
    public void UpdateAppoint() {
        int i = 0;
        Appointment appointment = new Appointment();
        //获取预约时间
        List<Appointment> app = appointmentMapper.AppointMessage(appointment);
        List<Long> s = new ArrayList<>();
        //获取当前时间
        Calendar calendar = Calendar.getInstance();
        Date NewDate  =  calendar.getTime();

        for (Appointment a: app) {
            if(NewDate.after(a.getCreateTime())){
                s.add(a.getApId());
            }
        }
        Long[] array = (Long[])s.toArray(new Long[s.size()]);
        appointmentMapper.deleteAppoint(array);













    }
}
