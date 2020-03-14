package com.dyzzw.controller;

import com.dyzzw.dto.DoctorPage;
import com.dyzzw.pojo.*;
import com.dyzzw.service.AppointmentService;
import com.dyzzw.service.DoctorService;
import com.dyzzw.service.HospitalService;
import com.dyzzw.util.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller("/doctor")
public class DoctorController {

    @Resource
    private DoctorService doctorService;

    @Resource
    private HospitalService hospitalService;

    @Resource
    private AppointmentService appointmentService;

    /**
     * 医生查询
     *
     * @param model
     * @param dt
     * @param doctorPage
     * @param dT
     * @param req
     * @return
     */
    @RequestMapping("/selectDoc")
    public String selectDoc(Model model, Deptlist dt, DoctorPage doctorPage, DeptlistT dT, HttpServletRequest req) {
        //获取页面数据
        String AreaT = req.getParameter("AreaT");
        String hospital = req.getParameter("hospital");
        String dname = req.getParameter("Dept");
        String dTname = req.getParameter("DeptT");

        //医院
        // area a = hospitalService.getAraeTById(AreaT);
        hospital h = hospitalService.getHospitalByName(hospital);

        //科室
        List<Deptlist> dept = hospitalService.checkdept(dt);
            List<DeptlistT> deptT = hospitalService.checkdeptT(dT, "", 0, 3);
            Deptlist dt1 = hospitalService.checkDEPT(dname, null);
            DeptlistT dT1 = hospitalService.checkDEPTT(dTname, null);
            if (dname != null && dTname != null) {
            doctorPage.setDid(dt1.getDid());
            doctorPage.setdTid(dT1.getdTid());
            doctorPage.sethId(h.gethId());
        }

        model.addAttribute("dept", dept);
        model.addAttribute("deptT", deptT);
        //医生
        List<Doctor> doc = doctorService.checkDoc();

        model.addAttribute("doc", doc);
        Page<Doctor> Dpage = doctorService.select(doctorPage);
        model.addAttribute("Dpage", Dpage);
        model.addAttribute("grade", doctorPage.getGrade());
        model.addAttribute("key", doctorPage.getKey());
        model.addAttribute("did", doctorPage.getDid());
        model.addAttribute("dTid", doctorPage.getdTid());
        return "searchDoc";
    }

    /**
     * 查询更新的信息
     *
     * @param dCid
     * @param model
     * @param session
     * @param doctorPage
     * @return
     */
    @RequestMapping("/selectUpdateDoc")
    public String selectUpdateDoc(Integer dCid, Model model, HttpSession session, DoctorPage doctorPage) {
        Doctor doctor = doctorService.getDoctorById(dCid);
        Page<Doctor> page = doctorService.select(doctorPage);
        model.addAttribute("page", page);
        model.addAttribute("doctor", doctor);
        session.setAttribute("doctor", doctor);
        return "admin/page/ad_doctor-edit";
    }

    /**
     * 插入医院科室部门更新信息
     *
     * @param model
     * @param doctorPage
     * @param dCid
     * @return
     */
    @RequestMapping("/selectInsertDoc")
    public String insert(Model model, DoctorPage doctorPage, Integer dCid) {
        Doctor doctor = doctorService.getDoctorById(dCid);
        Page<Doctor> page = doctorService.select(doctorPage);
        model.addAttribute("page", page);
        model.addAttribute("doctor", doctor);

        return "admin/page/ad_doctor-add";
    }

    /**
     * 部门查询
     *
     * @param model
     * @param doctorPage
     * @param req
     * @return
     */
    @RequestMapping("/search")
    public String search(Model model, DoctorPage doctorPage, HttpServletRequest req) {
        String key = req.getParameter("Dname");

        Page<Doctor> page = doctorService.selectToPage(doctorPage, key);
        model.addAttribute("Dpage", page);
        model.addAttribute("grade", doctorPage.getGrade());
        model.addAttribute("key", doctorPage.getKey());
        model.addAttribute("did", doctorPage.getDid());
        model.addAttribute("dTid", doctorPage.getdTid());

        return "searchList";
    }

    /**
     * 医生时间表查询
     *
     * @param model
     * @param dCid
     * @return
     */
    @RequestMapping("/doctor/detail/{dCid}")
    public String doctor_Detail(Model model, @PathVariable Integer dCid) {
        Doctor doctor = doctorService.getDoctorById(dCid);
        model.addAttribute("doctor", doctor);
        Appointment a = new Appointment();
        a.setdCid(dCid);

        String[] times = doctor.getSurgeryweek().split(","); //就诊时间
        List<DayInfo> dayInfoList = new ArrayList<>();
        Date date = new Date();
        for (int i = 0; i < 7; i++) {
            DayInfo dayInfo = new DayInfo();
            dayInfo.setDate(DateUtils.getDate(date));
            dayInfo.setFullDate(DateUtils.getFillDate(date));

            dayInfo.setWeek(DateUtils.getWeek(date));


            for (String time : times) {
                if (dayInfo.getWeek().equals(time.substring(0, 3))) {
                    time = time.substring(3); //取上午、下午、晚上
                    if (time.equals("上午")) {
                        dayInfo.setSw(1);

                    } else if (time.equals("下午")) {

                        dayInfo.setXw(1);
                    } else {
                        dayInfo.setWs(1);

                    }
                }
            }

            if (appointmentService.checkTime(dayInfo.getFullDate() + "(" + dayInfo.getWeek() + ")" + "上午", dCid) >=2) {
                dayInfo.setSwstate(0);

            } else {
                dayInfo.setSwstate(1);
            }
            if (appointmentService.checkTime(dayInfo.getFullDate() + "(" + dayInfo.getWeek() + ")" + "下午", dCid) >=2) {
                dayInfo.setXwstate(1);

            } else {
                dayInfo.setXwstate(0);
            }
            dayInfoList.add(dayInfo);
            date.setTime(date.getTime());

        }

        model.addAttribute("dayInfoList", dayInfoList);
        return "doctorDetail";
    }

    /**
     * 医生信息列表
     *
     * @param model
     * @param d1
     * @return
     */
    @RequestMapping("/DoctorMessage")
    public String DoctorMessage(Model model, HttpServletRequest req, DoctorPage d1, HttpSession hs) {
        String key = req.getParameter("key");
        Page<Doctor> page = doctorService.selectToPage(d1, key);

        model.addAttribute("Dpage", page);
        hs.setAttribute("Dpage", page);
        return "admin/page/ad_doctor-list";
    }

    /**
     * 批量删除
     */
    @RequestMapping("/doctor/delete")
    @ResponseBody
    public String delete(Integer[] dCid) {
        int i = doctorService.deletelist(dCid);
        if (i > 0) {
            return "ok";
        } else {
            return "error";
        }

    }

    /**
     * 修改编辑
     *
     * @param doctor
     * @return
     */
    @RequestMapping("update")
    public String update(Doctor doctor) {
        int i = doctorService.update(doctor);

        if (i > 0) {
            return "admin/page/ad_doctor-list";
        } else {
            return "error";
        }

    }

    /**
     * 插入
     *
     * @param model
     * @param doctor
     * @return
     */
    @RequestMapping("insert")
    public String insert(Model model, Doctor doctor) {

        doctor.setRid(2);
        int i = doctorService.insert(doctor);
        if (i > 0) {
            return "admin/page/ad_doctor-list";
        } else {
            return "error";
        }


    }


}
