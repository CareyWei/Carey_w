package com.dyzzw.mapper;


import com.dyzzw.pojo.admin;
import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.tuser;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersMapper {
    //新增
    public int ins(tuser tu);
    //登录
    /**
     * 根据用户登陆名 查询用户对象
     */
    public tuser login_t(tuser user);
    public Doctor queryUserByUserName_DO(@Param("email")String email);
    //检查用户名
   public tuser checkName(@Param("email") String email);
    //查询用户
    //修改个人信息
    public int updateInfor(tuser user);
    public int updatePwd(tuser user);
    //用户信息列表
    public List<tuser> UserMessage (tuser user);
    //批量删除
    public  int delete(Integer [] uid);
    //根据ID查用户
    public tuser findUserID(Long uid);
}
