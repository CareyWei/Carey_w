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
    <%--重置密码--%>
    <div class="lowin-wrapper">
        <div class="lowin-box lowin-login">
            <div class="lowin-box-inner">
                <form action="#" method="post" >

                    <div class="lowin-group password-group">
                        <label>密码 </label>
                        <input type="password" name="pwd" id="pwd" autocomplete="current-password"
                               class="lowin-input">
                        <input type="hidden" name="em" id="em"  value="${email}" >

                    </div>
                    <input type="submit" id="Reset" value="重置" class="lowin-btn login-btn">

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
        $('#Reset').click(function () {
            var pwd = $('#pwd').val();
            var email=$('#em').val();
            $.ajax({
                type: "POST",
                url: '/ResetPwd',
                data: {'pwd':pwd,'email':email}, // 你的formid
                async: false,
                error: function (request) {
                    alert("服务器异常,无法完成操作!");
                },
                success: function (data) {
                    if (data == '1') {
                        alert("修改成功");
                    } else {
                        alert("修改失败");
                    }
                }
            });

        });
    });
</script>
</body>
</html>