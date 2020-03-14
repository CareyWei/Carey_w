package com.dyzzw.service;

import com.dyzzw.dto.HospitalPage;
import com.dyzzw.pojo.*;

import java.util.List;

public interface HospitalService {
    //查询地区
    public List<area> checkArea();
    public area getAraeTById(String arname);
    //查询医院
    public List<hospital> checkHos();
    public hospital getHospitalById(Integer hId);
    public hospital getHospitalByName(String hName);
    //医院分页
    public Page<hospital> checkAreaT(HospitalPage area,String key);

    //二级联动查询医院
    public List<hospital> AjaxHos(String arname);
    //二级联动查询科室
    public List<Deptlist> AjaxDept(String dname);
    //删除医院表
    public int  deletelist(Integer [] hId);
    //修改编辑
    public int update(hospital hos);
    //插入
    public int insert(hospital hos);


    /**
     * 部门
     */
    //查询部门
    public List<Deptlist > checkdept(Deptlist dt);
    public List<DeptlistT> checkdeptT(DeptlistT dT,String key,int pageNum,int pageSize);
    //查询ID
    public Deptlist  checkDEPT(String dname,Integer did);
    public DeptlistT checkDEPTT(String dTname,Integer dTid);
    //批量删除
    public int deleteDept (Integer []did);
    public int deleteTDept (Integer []dTid);
    //修改编辑
    public int updatedT(DeptlistT deptlistT);
    public int updateDt(Deptlist deptlist);
    //新增科室部门
    public int insertDt(Deptlist deptlist);
    public int insertDT(DeptlistT deptlistT);
    //分页b部门
    public  List<Deptlist> CheckPage(Deptlist deptlist,String key,int pageNum,int pageSize);
}
