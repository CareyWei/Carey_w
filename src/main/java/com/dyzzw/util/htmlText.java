package com.dyzzw.util;

public class htmlText {
    public static String html(String code) {

        String html = "Email地址验证<br/>" +
                "这封邮件是由【聆风科技】发送的。<br/>" +
                "你收到这封邮件是【聆风科技】进行新用户注册或者用户修改Email使用这个地址。<br/>" +
                "账号激活声明<br/>" +
                "请将下面的验证码输入到提示框即可：<h3 style='color:red;'>" + code + "</h3><br/>";
        return html;
    }
    public static String html2(String link) {

        String html = "Email地址验证<br/>" +
                "这封邮件是由【聆风科技】发送的。<br/>" +
                "你收到这封邮件是【聆风科技】进行新用户注册或者用户修改Email使用这个地址。<br/>" +
                "账号激活声明<br/>" +
                "请将下面的验证码输入到提示框即可：<h3 style='color:red;'>" + link + "</h3><br/>";
        return html;
    }
}

