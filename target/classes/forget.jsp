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
    <%--忘记密码--%>
    <div class="lowin-wrapper">
        <div class="lowin-box lowin-login">
            <div class="lowin-box-inner">
                <form action="#" method="post" >
                    <p>输入邮箱</p>
                    <div class="lowin-group">
                        <label>请输入邮箱 </label>
                        <input type="text" autocomplete="email3" id="email3" name="email3" class="lowin-input">
                        <span id="remind1" color="red"></span>

                    </div>

                    <input type="submit" id="forSend" value="发送" class="lowin-btn login-btn">

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
    $(function () {
        $.each($("input"), function (i, val) {
            $(val).blur(function () {
                if ($(val).attr("id") == "email3") {
                    var email = val.value;
                    $.ajax({
                        type: "POST",
                        url: "check/checkname",//提交地址
                        data: "email=" + email,//提交数据
                        dataType: "json",//返回json格式
                        //contentType:"application/json;charset=utf-8",
                        success: function (data) {
                            if ("no" == data.msg) {//后端传来的msg的值是no,不能注册。反之。
                                $("#remind1").html("OK");//如果没有被注册，将提示语清空。
                            }
                            if ("yes" == data.msg) {
                                $("#remind1").html("<font color='red'>该用户名不存在</font>");

                            }
                        }
                    });
                }
            });
        });
    });
</script>
</body>
</html>