package com.dyzzw.service.impl;

import com.dyzzw.mapper.RoleMapper;
import com.dyzzw.mapper.UsersMapper;
import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.Role;
import com.dyzzw.pojo.admin;
import com.dyzzw.pojo.tuser;
import com.dyzzw.service.RoleService;
import com.dyzzw.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;

    @Override
    public List<String> queryRoleByUserId(Integer dCid) {
        List<Role> rolesList = roleMapper.queryRolesByUserId(dCid);
        List<String> roles=new ArrayList<String>();
        for (Role role : rolesList) {
            roles.add(role.getIdentity());
        }

        return roles;

    }
}

