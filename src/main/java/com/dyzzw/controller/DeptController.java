package com.dyzzw.controller;

import com.dyzzw.pojo.Deptlist;
import com.dyzzw.pojo.DeptlistT;
import com.dyzzw.service.HospitalService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DeptController {

    @Resource
    private HospitalService hospitalService;

    /**
     * 科室信息
     * @param dT
     * @param model
     * @param session
     * @param req
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/DeptMessage")
    public String DeptMessage(DeptlistT dT, Model model, HttpSession session, HttpServletRequest req,
                              @RequestParam(defaultValue="1",required=false,name = "pageNum") Integer pageNum,
                              @RequestParam(required=false,defaultValue="3",name = "pageSize") Integer pageSize ){
        String key = req.getParameter("key");
        List<DeptlistT> dept = hospitalService.checkdeptT(dT,key,pageNum,pageSize);
        //分页设置
        PageInfo<Deptlist> pageInfo=new PageInfo(dept);
        model.addAttribute("dt",dept);
        model.addAttribute("Dpage", pageInfo);
        session.setAttribute("Dpage",pageInfo);
        session.setAttribute("dt",dept);

        return "/admin/page/ad_dept-list";

    }

    /**
     * 科室删除
     * @param dTid
     * @return
     */
    @RequestMapping("/deptT/delete")
    @ResponseBody
    public String DeptTdelete(Integer []dTid){
        int i = hospitalService.deleteTDept(dTid);
        if(i>0){
            return "ok";
        }else{
            return "error";
        }

    }

    /**
     * 科室更新前信息提取
     * @param deptlist
     * @param dTname
     * @param model
     * @return
     */
    @RequestMapping("selectUpdateDept")
    public String selectUpdateDept(Deptlist deptlist,String dTname,Model model){
        //部门
        List<Deptlist> dept = hospitalService.checkdept(deptlist);
        //科室
        DeptlistT deptlistT1 = hospitalService.checkDEPTT(dTname,null);
        model.addAttribute("dept",dept);
        model.addAttribute("dT",deptlistT1);
        return "admin/page/ad_dept-edit";
    }

    /**
     * 更新
     * @param deptlistT
     * @return
     */
    @RequestMapping("updateDept/")
    @ResponseBody
    public  String update(DeptlistT deptlistT) {
        int i = hospitalService.updatedT(deptlistT);
        if(i>0){
            return "ok";
        }else{
            return "error";
        }
    }

    /**
     * 新增前信息提取
     * @param deptlist
     * @param model
     * @return
     */
   @RequestMapping("selectInsertDeptT")
    public String  selectInsertDeptT(Deptlist deptlist,Model model){
       //部门
       List<Deptlist> dept = hospitalService.checkdept(deptlist);
       model.addAttribute("dept",dept);
       return "admin/page/ad_dept-add";
   }

    /**
     * 新增
     * @param deptlistT
     * @return
     */
    @RequestMapping("insertDept/")
    @ResponseBody
    public  String insert(DeptlistT deptlistT) {
        int i = hospitalService.insertDT(deptlistT);
        if(i>0){
            return "ok";
        }else{
            return "error";
        }
    }
    /**
     * 部门
     */
    /**
     * 信息列表
     * @param deptlist
     * @param model
     * @param session
     * @param req
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/DeptDMessage")
    public String DeptDMessage(Deptlist deptlist,Model model, HttpSession session, HttpServletRequest req,
                               @RequestParam(defaultValue="1",required=false,name = "pageNum") Integer pageNum,
                               @RequestParam(required=false,defaultValue="3",name = "pageSize") Integer pageSize ){

        String key = req.getParameter("key");
        List<Deptlist> dept = hospitalService.CheckPage(deptlist,key,pageNum,pageSize);
        //分页设置
        PageInfo<Deptlist> pageInfo=new PageInfo(dept);
        model.addAttribute("dt",dept);
        model.addAttribute("Dpage", pageInfo);
        session.setAttribute("Dpage",pageInfo);
        session.setAttribute("dt",dept);

        return "/admin/page/ad_DeptT-list";
    }

    /**
     * 批量删除
     * @param did
     * @return
     */
    @RequestMapping("/dept/delete")
    @ResponseBody
    public String deleteDt(Integer [] did){
        int i = hospitalService.deleteDept(did);
        if(i>0){
            return "ok";
        }else{
            return "error";
        }
    }

    /**
     * 更新前信息查询
     * @param dname
     * @param model
     * @return
     */
    @RequestMapping("selectUpdate")
    public String selectUpdate(String dname,Model model){

        //科室
        Deptlist deptlistT1 = hospitalService.checkDEPT(dname,null);
        model.addAttribute("dT",deptlistT1);
        return "admin/page/ad_DeptT-edit";
    }

    /**
     * 更新
     * @param deptlist
     * @return
     */
    @RequestMapping("update/")
    @ResponseBody
    public String updateDt(Deptlist deptlist){
        int i = hospitalService.updateDt(deptlist);
        if(i>0){
            return "ok";
        }else{
            return "error";
        }
    }

    /**
     * 新增专页面
     * @param deptlist
     * @return
     */
    @RequestMapping("selectInsert")
    public String selectInsert(Deptlist deptlist){

        return "admin/page/ad_DeptT-add";
    }

    /**
     * 新增
     * @param deptlist
     * @return
     */
    @RequestMapping("insert/")
    @ResponseBody
    public String insert(Deptlist deptlist){
        int i = hospitalService.insertDt(deptlist);
        if(i>0){
            return "ok";
        }else{
            return "error";
        }
    }
}
