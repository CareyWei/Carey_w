package com.dyzzw.service;


import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.admin;
import com.dyzzw.pojo.tuser;

import java.util.List;

public interface RoleService {
    /**
     * 根据用户ID查询角色名
     */
    public List<String> queryRoleByUserId(Integer dCid);

}
