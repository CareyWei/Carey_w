package com.dyzzw.service.impl;

import com.dyzzw.mapper.UsersMapper;

import com.dyzzw.pojo.admin;
import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.tuser;
import com.dyzzw.service.UsersService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {
    @Resource
    private UsersMapper usersMapper;


    /*登录*/
    //用户
    @Override
    public tuser login_t(tuser user) {
        return usersMapper.login_t(user);
    }
   //医生/管理员
    @Override
    public Doctor queryUserByUserName_DO(String email) {
        return usersMapper.queryUserByUserName_DO(email);
    }


    /*注冊*/
    @Override
    public int insert(tuser tu) {

        return usersMapper.ins(tu);

    }

    @Override
    public tuser findUserByName(String email) {
        return usersMapper.checkName(email);
    }

    @Override
    public int updatePwd(tuser user) {
        return usersMapper.updatePwd(user);
    }


    @Override
    public int updateInfor(tuser user) {
        return usersMapper.updateInfor(user);
    }

    @Override
    public List<tuser> UserMessage(tuser user, String key,int pageNum,int pageSize) {
            PageHelper.startPage(pageNum, pageSize);
            user.setKey(key);
            List<tuser> u = usersMapper.UserMessage(user);
            return u;
    }

    @Override
    public int delete(Integer[] uid) {
        return usersMapper.delete(uid);
    }

    @Override
    public tuser findUserID(Long uid) {
        return usersMapper.findUserID(uid);
    }


}

