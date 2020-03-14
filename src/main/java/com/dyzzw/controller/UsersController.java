package com.dyzzw.controller;


import com.dyzzw.pojo.Permission;
import com.dyzzw.pojo.admin;
import com.dyzzw.pojo.Doctor;
import com.dyzzw.pojo.tuser;
import com.dyzzw.service.AppointmentService;
import com.dyzzw.service.UsersService;
import com.dyzzw.util.ActiverUser;
import com.dyzzw.util.JavaMailUtil;
import com.dyzzw.util.RandomUtil;
import com.dyzzw.util.htmlText;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

@Controller

public class UsersController {
    @Resource
    private UsersService usersServiceImpl;


    /**
     * 登录
     *
     * @param user
     * @param model
     * @param req
     * @param session
     * @param email
     * @param pwd
     * @return
     */
    @RequestMapping("login")
    public String login(tuser user, Model model, HttpServletRequest req, HttpSession session, String email, String pwd) {
        String identity = req.getParameter("user");
        //封装token
        UsernamePasswordToken token = new UsernamePasswordToken(email, pwd);
        //得到主体
        Subject subject = SecurityUtils.getSubject();
        //调用主题登录方法

        if (identity.equals("用户")) {
            tuser u = usersServiceImpl.login_t(user);
            if (u != null) {
                session.setAttribute("user", u);
                session.setAttribute("name", u.getName());
                session.setAttribute("identity", identity);
                return "redirect:http://localhost:8888/hospital";
            } else {
                return "login";
            }
        } else if (identity.equals("医生") || identity.equals("管理员")) {
            try {
                subject.login(token);
                System.out.println("登陆成功");
                ActiverUser activerUser = (ActiverUser) subject.getPrincipal();
                //分类按钮跟菜单栏
                List<Permission> permissionList = activerUser.getPermissions();
                //菜单
                List<Permission> menu = new ArrayList<>();
                //按钮
                List<Permission> button = new ArrayList<>();
                for (Permission permission : permissionList) {
                    if (permission.getType().equals("menu")) {
                        menu.add(permission);
                    } else {
                        button.add(permission);
                    }
                }

                session.setAttribute("user11", activerUser.getDoctor());
                session.setAttribute("Menu", activerUser.getPermissions());
                model.addAttribute("Menu", menu);
                model.addAttribute("user11", activerUser.getDoctor());

                return "redirect:/admin/page/ad_index.jsp";
            } catch (IncorrectCredentialsException e) {
                System.err.println("密码不正确");
                model.addAttribute("error", "密码不正确");
            } catch (UnknownAccountException e) {
                System.err.println("用户名不存在");
                model.addAttribute("error", "用户名不存在");
            }
            return "login";
        } else {
            return "login";
        }

    }

    /**
     * 个人信息
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/personal")
    public String personal(Model model, HttpSession session) {
        tuser user = (tuser) session.getAttribute("user");
        String email = user.getEmail();

        tuser u = usersServiceImpl.findUserByName(email);
        model.addAttribute("tu", u);
        return "personal_Infor";
    }

    /**
     * 检查密码是否一致
     *
     * @param session
     * @param req
     * @return
     */
    @RequestMapping("/checkpwd")
    @ResponseBody
    public int checkpwd(HttpSession session, HttpServletRequest req) {
        tuser user = (tuser) session.getAttribute("user");
        String pwd = user.getPwd();

        String pwd2 = req.getParameter("pwd2");
        System.out.println(pwd2);
        int i = 0;
        if (pwd.equals(pwd2)) {
            i = 0;
        } else {
            i = 1;
        }
        return i;
    }

    /**
     * 修改更新信息
     *
     * @param req
     * @param user
     * @return
     */
    @RequestMapping("/updateInfor")
    @ResponseBody
    public int updateInfor(HttpServletRequest req, tuser user) {
        String name = req.getParameter("uname");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        Long uid = Long.parseLong(req.getParameter("uid"));
        user.setUid(uid);
        user.setName(name);
        user.setPhone(phone);
        user.setEmail(email);

        int i = usersServiceImpl.updateInfor(user);
        if (i > 0) {
            return 1;
        } else {
            return 0;
        }

    }

    /**
     * 修改密码
     *
     * @param req
     * @param session
     * @return
     */
    @RequestMapping("/updatePwd")
    @ResponseBody
    public int updatePwd(HttpServletRequest req, HttpSession session) {

        tuser user = (tuser) session.getAttribute("user");

        String pwd = req.getParameter("newpwd");
        Long uid = user.getUid();
        user.setUid(uid);
        user.setPwd(pwd);
        int i = usersServiceImpl.updatePwd(user);
        if (i > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    /**
     * 获取用户信息列表
     *
     * @param user
     * @param req
     * @param model
     * @param session
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/UserMassage")
    public String UserMassage(tuser user, HttpServletRequest req,
                              Model model, HttpSession session,
                              @RequestParam(defaultValue = "1", required = false, name = "pageNum") Integer pageNum,
                              @RequestParam(required = false, defaultValue = "3", name = "pageSize") Integer pageSize) {
        String key = req.getParameter("key");
        List<tuser> u = usersServiceImpl.UserMessage(user, key, pageNum, pageSize);

        //分页设置
        PageInfo<tuser> pageInfo = new PageInfo(u);
        session.setAttribute("user1", u);
        model.addAttribute("user1", u);
        model.addAttribute("Dpage", pageInfo);
        return "admin/page/ad_tuser-list";
    }

    /**
     * 批量删除
     *
     * @param uid
     * @return
     */
    @RequestMapping("/tuser/delete")
    @ResponseBody
    public String delete(Integer[] uid) {
        int i = usersServiceImpl.delete(uid);
        if (i > 0) {
            return "ok";
        } else {
            return "error";
        }
    }

    /**
     * 修改编辑前的信息查询
     *
     * @param uid
     * @param model
     * @return
     */
    @RequestMapping("/selectUpdateUser")
    public String selectUpdateUser(Long uid, Model model) {
        tuser user = usersServiceImpl.findUserID(uid);
        model.addAttribute("user2", user);
        return "admin/page/ad_tuser-edit";
    }

    /**
     * 修改编辑
     *
     * @param user
     * @return
     */
    @RequestMapping("/tuser/update")
    @ResponseBody
    public String update(tuser user) {
        int i = usersServiceImpl.updateInfor(user);
        if (i > 0) {
            return "ok";
        } else {
            return "error";
        }

    }

    //忘记密码
    @ResponseBody
    @RequestMapping("/ForgetPwd")
    public int ForgetPwd(HttpServletRequest req,HttpSession session1) {
        int i;
        //生成随机验证码

        try {
            String email = req.getParameter("email");
            System.out.println(email);
            JavaMailUtil.receiveMailAccount = email; // 给用户输入的邮箱发送邮件

            // 1、创建参数配置，用于连接邮箱服务器的参数配置
            Properties props = new Properties();
            // 开启debug调试
            props.setProperty("mail.debug", "true");
            // 发送服务器需要身份验证
            props.setProperty("mail.smtp.auth", "true");
            // 设置右键服务器的主机名
            props.setProperty("mail.host", JavaMailUtil.emailSMTPHost);
            // 发送邮件协议名称
            props.setProperty("mail.transport.protocol", "smtp");

            // 2、根据配置创建会话对象，用于和邮件服务器交互
            Session session = Session.getInstance(props);
            // 设置debug，可以查看详细的发送log
            session.setDebug(true);

            // 获取系统当前时间
            Date now = new Date();
            String currentTime = "" + now.getTime();// 重置密码链接
            String urlStr = "http://localhost:8888/ResetP?key=";
            String plainText = currentTime + "@" + JavaMailUtil.receiveMailAccount; // 当前时间加上用户邮箱 使用@进行连接二者，在大多数情况下不会产生歧义
            String desKey = "LOVEMOIVE"; // des算法中的密钥
            String link = urlStr + RandomUtil.getRandom() + plainText + desKey + "&email=" + JavaMailUtil.receiveMailAccount;  //加密后的链接

            // 3、创建一封邮件
            String html = htmlText.html2(link);
            MimeMessage message = JavaMailUtil.creatMimeMessage(session, JavaMailUtil.emailAccount,
                    JavaMailUtil.receiveMailAccount, html);

            // 4、根据session获取邮件传输对象
            Transport transport = session.getTransport();
            // 5、使用邮箱账号和密码连接邮箱服务器emailAccount必须与message中的发件人邮箱一致，否则报错
            transport.connect(JavaMailUtil.emailAccount, JavaMailUtil.emailPassword);
            // 6、发送邮件,发送所有收件人地址
            transport.sendMessage(message, message.getAllRecipients());
            // 7、关闭连接
            transport.close();
            i = 1;
            session1.setAttribute(JavaMailUtil.receiveMailAccount,"email");
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("error", "邮件发送失败");
            i = 0;
        }
        return i;

    }

    @RequestMapping("/ResetPwd")
    @ResponseBody
    public int ResetPwd(HttpServletRequest req) {
        tuser user = new tuser();
        String email = req.getParameter("email");
        tuser u1 = usersServiceImpl.findUserByName(email);
        String pwd = req.getParameter("pwd");
        user.setUid(u1.getUid());
        user.setPwd(pwd);

        int i = usersServiceImpl.updatePwd(user);
        if (i > 0) {
            return 1;
        } else {
            return 0;
        }
    }
    @RequestMapping("/ResetP")
    public  String Reset(HttpServletRequest req,Model model){
        String email = req.getParameter("email");
        model.addAttribute("email",email);
        return "ResetPwd";
    }

}