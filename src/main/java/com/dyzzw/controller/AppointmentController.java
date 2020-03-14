package com.dyzzw.controller;

import com.dyzzw.pojo.*;
import com.dyzzw.service.AppointmentService;
import com.dyzzw.service.DoctorService;
import com.dyzzw.util.RandomUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class AppointmentController {
    @Resource
    private DoctorService doctorService;
    @Resource
    private AppointmentService appointmentService;

    /**
     * 预约信息列表
     *
     * @param model
     * @param req
     * @param dCid
     * @return
     */
    @RequestMapping("/appointment/{dCid}")
    public String appointmentList(Model model, HttpServletRequest req, @PathVariable Integer dCid) {

        Doctor doctor = doctorService.getDoctorById(dCid);
        String dayInfo = req.getParameter("dayInfo");
        model.addAttribute("doctor", doctor);
        model.addAttribute("dayInfo", dayInfo);


        return "appointment_List";
    }

    /**
     * 预约时间表
     *
     * @param appointment
     * @param dayInfo
     * @param session
     * @return
     */
    @RequestMapping("/submit")
    @ResponseBody
    public String commit(Appointment appointment, DayInfo dayInfo, HttpSession session) {
        Integer count = 1;
        Doctor d1 = new Doctor();

        //获取预约属性的值
        appointment.setApId(RandomUtil.getId());
        appointment.setCreateTime(new Date());
        appointment.setUpdateTime(new Date());
        //获取score的值
        d1.setdCid(appointment.getdCid());
        Doctor d2= doctorService.getDoctorById(d1.getdCid());
        String resultData = "";
        tuser user = (tuser) session.getAttribute("user");

            appointment.setUid(user.getUid());
            if (!appointment.getApName().equals(user.getName())) {
                resultData = "-1";
        } else {
            if (!appointmentService.checkAppoint(appointment)) {
                resultData = "-2";
            } else {
                appointmentService.insert(appointment);
                resultData = String.valueOf(appointment.getApId());

                d2.setScore(String.valueOf(Integer.parseInt(d2.getScore())+count));
            }
        }
        //获取score的值，并且修改它


        d1.setScore(d2.getScore());
        doctorService.update(d1);
        return resultData;
}

    /**
     * 预约信息查看
     *
     * @param model
     * @param appointment
     * @param session
     * @return
     */
    @RequestMapping("/AppointManage")
    public String AppointManage(Model model, Appointment appointment, HttpSession session) {
        String name = session.getAttribute("name").toString();
        appointment.setApName(name);
        appointment.setApId(null);
        Appointment a2 =new Appointment();
        //预约信息列表
        List<Appointment>  apoint= appointmentService.checkMessage(appointment);
        if(apoint.size()!=0){
            a2 = apoint.get(0);
        }else{
            a2 = null;
            apoint=null;
        }
        //System.out.println(a2.toString());
        session.setAttribute("appointMent", a2);
        model.addAttribute("appointMent", a2);
        model.addAttribute("ListAppoint", apoint);


        return "appointManage";
    }

    /**
     * 取消预约
     *
     * @param model
     * @param req
     * @return
     */
    @RequestMapping("/appointDelete")
    @ResponseBody
    public int appointDelete(Model model, HttpServletRequest req, Appointment a) {

        Long[] apId = {Long.parseLong(req.getParameter("apId"))};
        a.setApId(Long.parseLong(req.getParameter("apId")));

        //获取score得值
        Doctor doctor = new Doctor();
        doctor.setdCid(appointmentService.checkAppointManage(a).getdCid());
        Doctor d2 = doctorService.getDoctorById(doctor.getdCid());
        int c = Integer.parseInt(d2.getScore());
        if (c >= 0) {
            c = c - 1;
        }
        doctor.setScore(String.valueOf(c));
        //修改score的值
        int d = doctorService.update(doctor);
        System.out.println(d);
        int i = appointmentService.deleteAppoint(apId);
        return i;
    }

    /**
     * 预约信息列表
     *
     * @param rid
     * @param dCid
     * @param appointment
     * @param req
     * @param model
     * @param session
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/AppointMessage")
    public String AppointMessage(Integer rid, Integer dCid, Appointment appointment,
                                 HttpServletRequest req, Model model, HttpSession session,
                                 @RequestParam(defaultValue = "1", required = false, name = "pageNum") Integer pageNum,
                                 @RequestParam(required = false, defaultValue = "3", name = "pageSize") Integer pageSize) {
        model.addAttribute("rid", rid);
        //判断是否为管理员登录
        if (rid == 1) {
            String key = req.getParameter("key");
            appointment.setdCid(null);
            //获取列表
            List<Appointment> appointments = appointmentService.AppointMessage(appointment, key, pageNum, pageSize);
            //分页设置
            PageInfo<Appointment> pageInfo = new PageInfo(appointments);
            session.setAttribute("appointment", appointments);
            model.addAttribute("appointments", appointments);
            model.addAttribute("Dpage", pageInfo);
            return "admin/page/ad_appoint-list";
        } else {
            //医生
            appointment.setdCid(dCid);
            String key = req.getParameter("key");
            List<Appointment> appointments = appointmentService.AppointMessage(appointment, key, pageNum, pageSize);
            //分页设置
            PageInfo<Appointment> pageInfo = new PageInfo(appointments);
            session.setAttribute("appointments", appointments);
            model.addAttribute("appointments", appointments);
            model.addAttribute("Dpage", pageInfo);
            return "admin/page/ad_appoint-list";
        }
    }

    /**
     * 批量删除
     *
     * @param apId
     * @return
     */
    @RequestMapping("/appoint/delete")
    @ResponseBody
    public String delete(Long[] apId) {
        int i = appointmentService.deleteAppoint(apId);
        if (i > 0) {
            return "ok";
        } else {
            return "error";
        }
    }

    /**
     * 编辑前信息纳入
     *
     * @param appointment
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/selectUpdateAppoint")
    public String selectUpdateAppoint(Appointment appointment, Model model, HttpSession session) {
        appointment.setApName(null);
        Appointment a = appointmentService.checkAppointManage(appointment);
        model.addAttribute("apoint", a);
        session.setAttribute("apoint", a);
        ;
        return "/admin/page/ad_appoint-edit";
    }

    /**
     * 修改编辑
     *
     * @param appointment
     * @return
     */
    @RequestMapping("/appoint/update")
    @ResponseBody
    public String update(Appointment appointment) {
        int i = appointmentService.update(appointment);
        if (i > 0) {
            return "ok";
        } else {
            return "error";
        }
    }


}
