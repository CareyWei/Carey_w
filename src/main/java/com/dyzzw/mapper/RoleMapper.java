package com.dyzzw.mapper;


import com.dyzzw.pojo.Role;

import java.util.List;

public interface RoleMapper {
/**
 3
 * 根据用户ID查询用户角色
 */
    List<Role> queryRolesByUserId(Integer dCid);



}
