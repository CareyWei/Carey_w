package com.dyzzw.service.impl;

import com.dyzzw.dto.DoctorPage;
import com.dyzzw.mapper.DoctorMapper;
import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.Page;
import com.dyzzw.service.DoctorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class  DoctorServiceImpl implements DoctorService {
    @Resource
    private DoctorMapper doctorMapper;

    @Override
    public Page<Doctor> selectToPage(DoctorPage doctorPage,String key) {
        Page <Doctor> page = new Page<>();
        Integer pageNum = doctorPage.getPageNum();

        doctorPage.setPageNum((pageNum - 1) * doctorPage.getPageSize());
        doctorPage.setKey(key);

        List<Doctor> list = doctorMapper.selectToPage(doctorPage);
        List<Doctor> d1 = new ArrayList<>();
        List<Doctor> d2 = new ArrayList<>();
        for (Doctor d:list) {
            if(d.getRid()==1){
                d1.add(d);
            }else{
                d2.add(d);
            }
        }
        page.setData(d2);
        page.setPageNum(pageNum);
        page.setPageSize(doctorPage.getPageSize());
        Integer totalCount = doctorMapper.selectToPageTotalCount(doctorPage);
        page.setTotalCount(totalCount);
        page.setTotalPage((int)Math.ceil(totalCount*1.0/page.getPageSize()));
        return page;
    }
    public Page<Doctor> select (DoctorPage doctorPage) {
        Page <Doctor> page = new Page<>();
        Integer pageNum = doctorPage.getPageNum();

        doctorPage.setPageNum((pageNum - 1) * doctorPage.getPageSize());

        List<Doctor> list = doctorMapper.selectToPage(doctorPage);
        List<Doctor> d1 = new ArrayList<>();
        List<Doctor> d2 = new ArrayList<>();
        for (Doctor d:list) {
            if(d.getRid()==1){
                d1.add(d);
            }else{
                d2.add(d);
            }
        }
        page.setData(d2);

        page.setPageNum(pageNum);
        page.setPageSize(doctorPage.getPageSize());
        Integer totalCount = doctorMapper.selectToPageTotalCount(doctorPage);
        page.setTotalCount(totalCount);
        page.setTotalPage((int)Math.ceil(totalCount*1.0/page.getPageSize()));
        return page;
    }

    @Override
    public List<Doctor> checkDoc() {
        List<Doctor> list=doctorMapper.checkDoc();
        List<Doctor> d1 = new ArrayList<>();
        List<Doctor> d2 = new ArrayList<>();
        for (Doctor d:list) {
            if(d.getRid()==1){
                d1.add(d);
            }else{
                d2.add(d);
            }
        }
        return d2;
    }

    @Override
    public Doctor getDoctorById(Integer dCid) {
        return doctorMapper.getDoctorById(dCid);
    }

    @Override
    public int deletelist(Integer[] dCid) {

        return  doctorMapper.deleteList(dCid);
    }

    @Override
    public int update(Doctor doctor) {
        return doctorMapper.update(doctor);
    }

    @Override
    public int insert(Doctor doctor) {

        return doctorMapper.insert(doctor);
    }


}
