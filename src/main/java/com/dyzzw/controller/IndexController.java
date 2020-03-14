package com.dyzzw.controller;

import com.dyzzw.dto.DoctorPage;
import com.dyzzw.dto.HospitalPage;
import com.dyzzw.pojo.*;
import com.dyzzw.service.DoctorService;
import com.dyzzw.service.HospitalService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {

    @Resource
    private HospitalService hospitalService ;

    @Resource
    private DoctorService doctorService;

    @RequestMapping("/hospital")
    public String index(Model model, HospitalPage hos, Deptlist dt, DoctorPage doctorPage){

        //地区
        List<area> area =hospitalService.checkArea();
        model.addAttribute("area",area);
        Page<hospital> page =hospitalService.checkAreaT(hos,"");
        model.addAttribute("page",page);
        model.addAttribute("arId", hos.getArId());
        //医院
        List<hospital> hospital= hospitalService.checkHos();
        model.addAttribute("hospital",hospital);
        model.addAttribute("hId",hos.gethId());
        //科室
        List<Deptlist> dept = hospitalService.checkdept(dt);
        model.addAttribute("dept",dept);
        //医生
        List<Doctor> doc = doctorService.checkDoc();

        model.addAttribute("doc",doc);
        Page<Doctor> Dpage = doctorService.selectToPage(doctorPage,"医院");
        model.addAttribute("Dpage",Dpage);
        model.addAttribute("key",doctorPage.getKey());
        model.addAttribute("did",doctorPage.getDid());
        model.addAttribute("dTid",doctorPage.getdTid());
        return "index";
    }

    @RequestMapping("AjaxArea")
    @ResponseBody
    public List<hospital> listHospital(String arname){
        List<hospital> hos = hospitalService.AjaxHos(arname);
        return hos;
    }

    @RequestMapping("AjaxDept")
    @ResponseBody
    public List<Deptlist> listDept(String dname){
        List<Deptlist> dep = hospitalService.AjaxDept(dname);
        return dep;
    }




 }

