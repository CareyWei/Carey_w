package com.dyzzw.controller;

import com.dyzzw.pojo.Message;

import com.dyzzw.pojo.tuser;
import com.dyzzw.service.UsersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("check")
public class CheckController {
    @Resource
    private UsersService usersServiceImpl;

    @RequestMapping("/checkname")
    @ResponseBody
    public  Message checkname( HttpServletRequest req) {
        String email = req.getParameter("email");
        //根据用户名查询是否存在该用户名
        tuser user = usersServiceImpl.findUserByName(email);
        //当对象不为空，说明用户名存在
        if (user != null) {
            Message msg = new Message("no");
            return msg;
        } else {
            Message msg = new Message("yes");
            return msg;
        }



    }



}
