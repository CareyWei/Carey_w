package com.dyzzw.service;


import com.dyzzw.pojo.admin;
import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.tuser;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface UsersService {
    /*登录*/
    /**
     * 根据用户名查询用户
     */
    public tuser login_t(tuser user);

    public Doctor queryUserByUserName_DO(String email);
    /*注冊*/
    public int insert(tuser tu );
    //查重邮箱
    tuser findUserByName(String email);
    //修改个人信息
    public int updatePwd(tuser user);
    public int updateInfor(tuser user);
    //查询用户信息列表
    public List<tuser> UserMessage(tuser user,String key,int pageNum,int pageSize);
    //批量删除
    public  int delete(Integer [] uid);
    //根据ID查用户
    public tuser findUserID(Long uid );

}
