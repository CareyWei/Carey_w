package com.dyzzw.controller;

import com.dyzzw.dto.DoctorPage;
import com.dyzzw.dto.HospitalPage;
import com.dyzzw.pojo.*;
import com.dyzzw.service.DoctorService;
import com.dyzzw.service.HospitalService;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HospitalController {
    @Resource
    public HospitalService hospitalService ;
    @Resource
    public DoctorService doctorService;

    /**
     * 获取医院列表
     * @param model
     * @param hos
     * @return
     */
    @RequestMapping("/hospitalList")
    public String hosptalList(Model model, HospitalPage hos){
        //地区
        List<area> area =hospitalService.checkArea();
        model.addAttribute("area",area);
        Page<hospital> page =hospitalService.checkAreaT(hos,"");
        model.addAttribute("Dpage",page);
        model.addAttribute("arId", hos.getArId());
        model.addAttribute("hId",hos.gethId());
        model.addAttribute("hLevel",hos.gethLevel());
        //医院
        List<hospital> hospital= hospitalService.checkHos();
        model.addAttribute("hospital",hospital);

        return "hospitalList";
    }

    /**
     *
     * 医院主要信息
     * @param model
     * @param dt
     * @param dT
     * @param doctorPage
     * @param hos
     * @param hId
     * @return
     */
    @RequestMapping("/hospital/detail/{hId}")
    public String hospitalDetail(Model model, Deptlist dt,DeptlistT dT, DoctorPage doctorPage, HospitalPage hos, @PathVariable Integer hId) {

        hos.sethId(hId);
        //科室
        List<DeptlistT> deptT = hospitalService.checkdeptT(dT,"",0,3);
        List<Deptlist> dept = hospitalService.checkdept(dt);
        model.addAttribute("dept",dept);
        model.addAttribute("deptT",deptT);

        //医院
        List<hospital> hospital= hospitalService.checkHos();
        hospital HosGet = hospitalService.getHospitalById(hId);
        model.addAttribute("HosGet",HosGet);
        model.addAttribute("hospital",hospital);
        //医生
        List<Doctor> doc = doctorService.checkDoc();
        model.addAttribute("doc",doc);
        Page<Doctor> page = doctorService.select(doctorPage);
        model.addAttribute("page",page);
        model.addAttribute("key",doctorPage.getKey());
        model.addAttribute("did",doctorPage.getDid());
        model.addAttribute("dTid",doctorPage.getdTid());
        model.addAttribute("grade",doctorPage.getGrade());
        return "hosDetail";
    }

    /**
     * 获取医院信息列表
     * @param model
     * @param session
     * @param hos
     * @return
     */
    @RequestMapping("/HospitalMessage")
    public  String HospitalMessage(Model model ,HttpServletRequest req,HttpSession session,HospitalPage hos){
        String key = req.getParameter("key");
        //地区
        Page<hospital> page =hospitalService.checkAreaT(hos,key);
        session.setAttribute("Dpage",page);
        model.addAttribute("Dpage",page);
        return "admin/page/ad_hospital-list";
    }

    /**
     * 批量删除
     * @param hId
     * @return
     */
    @RequestMapping("/hospital/delete")
    @ResponseBody
    public String   delete(Integer []hId){
        int i = hospitalService.deletelist(hId);
        if(i>0){
            return "ok";
        }else{
            return "error";
        }

    }

    /**
     *修改编辑前的信息查询
     * @param dt
     * @param dT
     * @param model
     * @param hId
     * @param hos
     * @return
     */
    @RequestMapping("/selectUpdateHos")
    public String selectUpdateHos(Deptlist dt,DeptlistT dT,Model model,Integer hId,HospitalPage hos){


        Page<hospital> page =hospitalService.checkAreaT(hos,"");
        model.addAttribute("Dpage",page);
        hospital HosGet = hospitalService.getHospitalById(hId);
        model.addAttribute("HosGet",HosGet);
        return "admin/page/ad_hospital-edit";
    }

    /**
     * 修改编辑医院
     * @param model
     * @param hos
     * @return
     */
    @RequestMapping("/hospital/update")
    public String update(Model model,hospital hos){
        int i =hospitalService.update(hos);

        if(i>0){
            return "admin/page/ad_hospital-list";
        }else{
            return "error";
        }


    }

    /**
     * 新增医院前的数据查询
     * @param hos
     * @param model
     * @return
     */
    @RequestMapping("/selectInsertHos")
    public String selectInsertHos(HospitalPage hos,Model model){
        Page<hospital> page =hospitalService.checkAreaT(hos,"");
        model.addAttribute("Dpage",page);
        return "admin/page/ad_hospital-add";
    }

    /**
     * 新增医院
     * @param hos
     * @return
     */
    @RequestMapping("/hospital/insert")
    public String insert(hospital hos){
        int i =hospitalService.insert(hos);

        if(i>0){
            return "admin/page/ad_hospital-list";
        }else{
            return "error";
        }
    }

}
