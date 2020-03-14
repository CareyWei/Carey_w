package com.dyzzw.mapper;

import com.dyzzw.dto.HospitalPage;
import com.dyzzw.pojo.Deptlist;
import com.dyzzw.pojo.DeptlistT;
import com.dyzzw.pojo.area;
import com.dyzzw.pojo.hospital;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HospitalMapper {
    //查询地区
    public List<area> checkArea();
    public area  getAreaTById(String arname);
    //查询医院
    public List<hospital> checkHos(hospital hos);
    public hospital getHospitalById(Integer hId);
    public hospital getHospitalByName(String hName);
    //医院分页查询
    public List<hospital> checkAreaT(HospitalPage hospital);
    //查询医院总数
    public Integer selectToPageTotalCount(HospitalPage hospital);

    //二级联动
    public List<hospital> AjaxHos(String arname);
    public List<Deptlist> AjaxDept(String name);
    //删除医院
    public int deletelist(Integer []hId);
    //修改编辑
    public int update(hospital hos);
    //插入
    public int insert(hospital hos);


    /**
     * 部门
     */
    //医院科室查询
    public List<Deptlist> checkdept(Deptlist dt);
    public List<DeptlistT> checkdeptT(DeptlistT dT);
    //查询ID
    public Deptlist checkDEPT(@Param("dname") String dname,@Param("did") Integer did);
    public DeptlistT checkDEPTT(@Param("dTname") String dTname,@Param("dTid") Integer dTid);
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
    public  List<Deptlist> CheckPage(Deptlist deptlist);

}
