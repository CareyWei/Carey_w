<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>预医欢迎您</title>
    <link rel="stylesheet" href="css/auth.css">
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/login_regist.js"></script>

</head>

<body>
<div class="lowin lowin-purple">
    <div class="lowin-brand">
        <img src="/images/kodinger.jpg" alt="logo">
    </div>
    <%--登录--%>
    <div class="lowin-wrapper">
        <div class="lowin-box lowin-login">
            <div class="lowin-box-inner">
                <form action="/login" method="post" onsubmit="return login()">
                    <p>用户登录</p>
                    <div class="lowin-group">
                        <label>邮箱 <a href="#" class="login-back-link">登录?</a></label>
                        <input type="text" autocomplete="email" id="email1" name="email" class="lowin-input">
                    </div>
                    <div class="lowin-group password-group">
                        <label>密码 <a href="/forget.jsp">忘记密码?</a></label>
                        <input type="password" name="pwd" id="pwd" autocomplete="current-password"
                               class="lowin-input">
                    </div>

                    <div>
                        <label>
                            &nbsp;&nbsp;
                            <input name="user" type="radio" value="用户" id="user1" checked="checked"/>用户 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input name="user" type="radio" value="医生" id="user2"/>医生 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input name="user" type="radio" value="管理员" id="user3"/>管理员
                        </label>
                    </div>
                    <input type="submit" id="submit" value="登录" class="lowin-btn login-btn">

                    <div class="text-foot">
                        没有账号？<a href="" class="register-link">注冊</a>
                    </div>
                </form>
            </div>
        </div>
        <%--注冊--%>
        <div class="lowin-box lowin-register">
            <div class="lowin-box-inner">
                <form  method="post" action="register" onsubmit="return checkAll();">
                    <p>注冊</p>
                    <div class="lowin-group">
                        <label>用户名</label>
                        <input type="text" name="name"  id="name"  autocomplete="name"
                               class="lowin-input">
                        <span id="remind1" color="red"></span>
                    </div>
                    <div class="lowin-group">
                        <label>密码</label>
                        <input type="password" id="upwd" name="pwd"
                               autocomplete="current-password" class="lowin-input">
                        <span id="remind2" color="red"></span>
                    </div>
                    <div class="lowin-group">
                        <label>确认密码</label>
                        <input type="password" name="rupwd" id="rupwd"
                               autocomplete="current-password" class="lowin-input">
                        <span id="remind3" color="red"></span>
                    </div>
                    <div class="lowin-group">
                        <label>邮箱</label>
                        <input type="email" name="email" id="email" autocomplete="email11"
                               class="lowin-input">
                        <span id="remind5" color="red"></span>
                    </div>
                    <div class="lowin-group">
                        <label>邮箱验证码</label>
                        <input type="text" name="vercode" id="vercode" autocomplete="vercode">
                        <input type="button" name="btn"
                               class="btn btn-default" id="btn" value="发送验证码" />
                        <span id="remind6" color="red"></span>
                    </div>



                    <input type="submit" id="send" value="注冊" class="lowin-btn">
                    <div class="text-foot">
                        已经有账号？ <a href="" class="login-link">登录</a>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <footer class="lowin-footer">
        北区 <a href="http://www.1111111.com/" target="_blank" title="北区">北区</a>
        - Collect from <a href="http://www.11111.com/" title="北区" target="_blank">北区</a>
    </footer>
</div>

<script src="js/auth.js"></script>
<script>
    Auth.init({
        login_url: 'login',
        forgot_url: '#forgot'
    });
</script>
</body>
</html>