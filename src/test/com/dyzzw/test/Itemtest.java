package com.dyzzw.test;



import com.dyzzw.mapper.AppointmentMapper;
import com.dyzzw.pojo.Appointment;

import com.dyzzw.service.AppointmentService;


import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class Itemtest {
    @Test
    public void test() {
        Date date = new Date();
        SimpleDateFormat sbf = new SimpleDateFormat("yyyy年-MM月-dd日");
        date.setTime(date.getTime() + 1000 * 60 * 60 * 24);
        System.out.println(sbf.format(date));
    }


}
