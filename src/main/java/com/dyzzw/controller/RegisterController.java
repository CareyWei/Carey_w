package com.dyzzw.controller;

import com.dyzzw.pojo.tuser;
import com.dyzzw.service.UsersService;
import com.dyzzw.util.JavaMailUtil;
import com.dyzzw.util.RandomUtil;
import com.dyzzw.util.htmlText;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

@Controller
public class RegisterController {
    @Resource
    private UsersService usersServiceImpl;


    @RequestMapping("register")
    public String insert(tuser tu,HttpServletRequest req, Model model){
        int index =0;
        boolean success;
        String sessionCode = (String) req.getSession().getAttribute("code");
        String inputCode = req.getParameter("vercode");
        System.out.println("页面提交码："+inputCode);
        if(sessionCode != null){
            if(sessionCode.toLowerCase().equals(inputCode.toLowerCase())){
                Date date = new Date();
                tu.setUid(RandomUtil.getId());
                tu.setCreatetime(date);
                tu.setUpdatetime(date);
                tu.setState(0);
                index= usersServiceImpl.insert(tu);
                if(index >0){
                    success = true;
                }else{
                    success =false;
                    System.out.println("插入失败");
                }
            }else{
                success =false;;
                System.out.println("验证码不一致");

            }
        }else{
            success =false;
            System.out.println("验证码为空");
        }
        if(success){
            req.removeAttribute("code");
            return "login";
        }else{
            req.removeAttribute("code");
            return "error";
        }

    }
    @ResponseBody
    @RequestMapping("vildeCode")
    public String sendEmail(HttpServletRequest req) {
        //生成随机验证码
        String code = "";
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
            // 3、创建一封邮件
            code = RandomUtil.getRandom();
            System.out.println("邮箱验证码：" + code);

            String html = htmlText.html(code);
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
            //  写入session
            req.getSession().setAttribute("code", code);

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("error", "邮件发送失败");
        }
        return code;
    }

}
