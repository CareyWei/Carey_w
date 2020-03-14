package com.dyzzw.realm;

import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.Permission;
import com.dyzzw.service.PermissionService;
import com.dyzzw.service.RoleService;
import com.dyzzw.service.UsersService;
import com.dyzzw.util.ActiverUser;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

public class UserRealm extends AuthorizingRealm {
    @Resource
    private UsersService usersService;
    @Resource
    private RoleService roleService;
    @Resource
    private PermissionService permissinService;

    @Override
    public String getName(){
        return "userRealm";
    }
    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {

        ActiverUser activerUser=(ActiverUser)principal.getPrimaryPrincipal();
        List<String> roles = activerUser.getRoles();
        List<Permission> permissions = activerUser.getPermissions();
        List<String> per = new ArrayList<>();
        for (Permission p:permissions) {
            per.add(p.toString());
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        if(null!=roles&& roles.size()>0) {
            info.addRoles(roles);
        }
        if(null!=permissions&&permissions.size()>0) {
            info.addStringPermissions(per);
        }
        return info;


    }
    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String email = token.getPrincipal().toString();
        // 根据用户名查询用户对象
        Doctor doctor = this.usersService.queryUserByUserName_DO(email);
        if(doctor != null){
            ActiverUser activerUser = new ActiverUser();
            // 查询角色
            activerUser.setRoles(this.roleService.queryRoleByUserId(doctor.getdCid()));
            //存储Doctor
            activerUser.setDoctor(doctor);
            // 查询权限
            activerUser.setPermissions(this.permissinService.queryPermissionByUserId(doctor.getdCid()));

            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(activerUser, doctor.getPwd(), getName());
            return info;
        }
        return null;
    }
}
