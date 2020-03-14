package com.dyzzw.service.impl;

import com.dyzzw.mapper.PermissionMapper;
import com.dyzzw.mapper.RoleMapper;
import com.dyzzw.pojo.Permission;
import com.dyzzw.pojo.Role;
import com.dyzzw.service.PermissionService;
import com.dyzzw.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Resource
    private PermissionMapper permissionMapper;



    @Override
    public List<Permission> queryPermissionByUserId(Integer dCid) {
        List<Permission> permissionList = permissionMapper.queryPermssionByUserId(dCid,0);
        List<Permission> permissions=new ArrayList<>();
        for (Permission permission : permissionList) {
            permissions.add(permission);
        }

        return permissions;

    }
}

