package com.dyzzw.service.impl;


import com.dyzzw.dto.HospitalPage;
import com.dyzzw.mapper.HospitalMapper;
import com.dyzzw.pojo.*;
import com.dyzzw.service.HospitalService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HospitalServiceImpl implements HospitalService {
    @Resource
    private HospitalMapper hospitalMapper;

    @Override
    public List<area> checkArea() {
        return hospitalMapper.checkArea();
    }

    @Override
    public area getAraeTById(String arname) {
        return hospitalMapper.getAreaTById(arname);
    }

    @Override
    public List<hospital> checkHos() {
        return hospitalMapper.checkHos(new hospital());
    }

    @Override
    public hospital getHospitalById(Integer hId) {
        return hospitalMapper.getHospitalById(hId);
    }

    @Override
    public hospital getHospitalByName(String hName) {
        return hospitalMapper.getHospitalByName(hName);
    }

    @Override
    public Page<hospital> checkAreaT(HospitalPage hospital,String key) {
        Page<hospital> page = new Page<>();
        Integer pageNum = hospital.getPageNum();
        hospital.setKey(key);
        hospital.setPageNum((pageNum - 1) * hospital.getPageSize());
        List<hospital> list = hospitalMapper.checkAreaT(hospital);
        page.setData(list);
        page.setPageNum(pageNum);
        page.setPageSize(hospital.getPageSize());
        Integer totalCount = hospitalMapper.selectToPageTotalCount(hospital);
        page.setTotalCount(totalCount);
        page.setTotalPage((int)Math.ceil( totalCount*1.0/page.getPageSize() ));

        return page;
    }

    @Override
    public List<Deptlist> checkdept(Deptlist dt) {

        return hospitalMapper.checkdept(dt);
    }

    @Override
    public List<DeptlistT> checkdeptT(DeptlistT dT,String key,int pageNum,int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        dT.setKey(key);
        List<DeptlistT> dept = hospitalMapper.checkdeptT(dT);
        return dept;
    }

    @Override
    public Deptlist checkDEPT(String dname,Integer did) {
        return hospitalMapper.checkDEPT(dname,did);
    }

    @Override
    public DeptlistT checkDEPTT(String dTname,Integer dTid) {
        return hospitalMapper.checkDEPTT(dTname,dTid);
    }

    @Override
    public int deleteTDept(Integer[] dTid) {
        return hospitalMapper.deleteTDept(dTid);
    }

    @Override
    public int updatedT(DeptlistT deptlistT) {
        return hospitalMapper.updatedT(deptlistT);
    }

    @Override
    public int updateDt(Deptlist deptlist) {
        return hospitalMapper.updateDt(deptlist);
    }

    @Override
    public int insertDt(Deptlist deptlist) {
        return hospitalMapper.insertDt(deptlist);
    }

    @Override
    public int insertDT(DeptlistT deptlistT) {
        return hospitalMapper.insertDT(deptlistT);
    }

    @Override
    public  List<Deptlist> CheckPage(Deptlist deptlist,String key,int pageNum,int pageSize) {

        PageHelper.startPage(pageNum, pageSize);
        deptlist.setKey(key);
        List<Deptlist> dept = hospitalMapper.CheckPage(deptlist);
        return dept;
    }

    @Override
    public int deleteDept(Integer[] did) {
        return hospitalMapper.deleteDept(did);
    }

    @Override
    public List<hospital> AjaxHos(String arname) {
        return hospitalMapper.AjaxHos(arname);
    }

    @Override
    public List<Deptlist> AjaxDept(String dname) {
        return hospitalMapper.AjaxDept(dname);
    }

    @Override
    public int deletelist(Integer [] hId) {
        return hospitalMapper.deletelist(hId);
    }

    @Override
    public int update(hospital hos) {

       return hospitalMapper.update(hos);

    }

    @Override
    public int insert(hospital hos) {
        return hospitalMapper.insert(hos);
    }

}
