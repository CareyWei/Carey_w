package com.dyzzw.controller;

import com.dyzzw.dto.DoctorPage;
import com.dyzzw.pojo.Appointment;
import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.Page;
import com.dyzzw.service.DoctorService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.PanelUI;
import java.util.List;

@Controller
public class OutCallController {
    @Resource
    private DoctorService doctorService;

    /**
     * 出诊时间
     *
     * @param model
     * @param dCid
     * @param doctorPage
     * @return
     */
    @RequestMapping("DocOnDuty")
    public String DocOnDuty(Model model, Integer dCid, DoctorPage doctorPage) {
        Doctor doctor = doctorService.getDoctorById(dCid);
        model.addAttribute("doctor", doctor);

        return "/admin/page/ad_outCall-list";
    }

    /**
     * 修改出诊时间
     *
     * @param doctor
     * @return
     */
    @RequestMapping("/updateTime")
    @ResponseBody
    public String updateTime(Doctor doctor) {
        int i = doctorService.update(doctor);

        if (i > 0) {
            return "ok";
        } else {
            return "error";
        }
    }

    /**
     * 个人信息
     *
     * @param dCid
     * @param model
     * @param session
     * @param doctorPage
     * @return
     */
    @RequestMapping("/PersonalMessage")
    public String PersonalMessage(Integer dCid, Model model, HttpSession session, DoctorPage doctorPage) {
        Doctor doctor = doctorService.getDoctorById(dCid);

        Page<Doctor> page = doctorService.select(doctorPage);
        model.addAttribute("page", page);
        model.addAttribute("doctor", doctor);
        session.setAttribute("doctor", doctor);
        return "/admin/page/ad_person-edit";
    }

    /**
     * 修改编辑
     *
     * @param doctor
     * @return
     */
    @RequestMapping("Out/update")
    @ResponseBody
    public String updateOut(Doctor doctor) {
        int i = doctorService.update(doctor);

        if (i > 0) {
            return "ok";
        } else {
            return "error";
        }

    }

    /**
     * @param dCid
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/ChangePwd")
    public String ChangePwd(Integer dCid, Model model, HttpSession session) {
        Doctor doctor = doctorService.getDoctorById(dCid);
        model.addAttribute("doctor", doctor);
        session.setAttribute("doctor", doctor);
        return "/admin/page/ad_checkpwd";
    }

    @RequestMapping("checkPwd")
    @ResponseBody
    public String checkPwd(Integer dCid, String pwd) {
        Doctor doctor = doctorService.getDoctorById(dCid);
        if (doctor.getPwd().equals(pwd)) {
            return "ok";
        } else {
            return "error";
        }
    }

}
