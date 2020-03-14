package com.dyzzw.service;


import com.dyzzw.pojo.Permission;

import java.util.List;

public interface PermissionService {
        /**
         * 根据用户ID查询权限
         */
    public List<Permission> queryPermissionByUserId(Integer dCid);


}
