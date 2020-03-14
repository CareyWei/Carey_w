package com.dyzzw.mapper;


import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.Permission;
import com.dyzzw.pojo.admin;
import com.dyzzw.pojo.tuser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PermissionMapper {
    /**
     * 根据用户ID查询权限
     */
    List<Permission> queryPermssionByUserId(@Param("dCid") Integer dCid,@Param("parent_id") Integer parent_id );

}
