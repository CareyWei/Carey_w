<%@ page import="com.dyzzw.pojo.tuser" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/13
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="admin/css/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/admin/css/font.css">
    <link rel="stylesheet" href="/admin/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body" >
    <form id="doctor_info"   action="/hospital/update" method="post" >
        <input type="hidden" value="${HosGet.hId}" name = "hId">

        <div class="layui-form-item">
            <label for="hName" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="hName" name="hName" required="" lay-verify="nikename"
                       autocomplete="off" class="layui-input" value="${HosGet.hName}" >
            </div>
        </div>
        <div class="layui-form-item">
            <label for="hLevel" class="layui-form-label">
                <span class="x-red">*</span>等级
            </label>
            <div class="layui-input-inline">
                <input type="text" id="hLevel" name="hLevel" required="" lay-verify="gender"
                       autocomplete="off" class="layui-input" value="${HosGet.hLevel}">
            </div>
        </div>
        <div class="layui-form-item">
        <label for="hPhone" class="layui-form-label">
            <span class="x-red">*</span>电话
        </label>
        <div class="layui-input-inline">
            <input type="text" id="hPhone" name="hPhone" required="" lay-verify="hPhone"
                   autocomplete="off" class="layui-input" value="${HosGet.hPhone}">
        </div>
        </div>

        <div class="layui-form-item">
            <label for="arId" class="layui-form-label">
                <span class="x-red">*</span>区域
            </label>
            <div class="layui-input-inline">
                <select  name="arId"  id="arId">
                    <option value="">-请选择-</option>
                    <c:forEach items="${Dpage.data}" var="s1" >
                        <option value="${s1.area.arId}" ${HosGet.area.arId==s1.area.arId?'selected':''}>${s1.area.arname}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="hAddress" class="layui-form-label">
                <span class="x-red">*</span>地址
            </label>
            <div class="layui-input-inline">
                <input type="text" id="hAddress" name="hAddress" required="" lay-verify="surgeryweek"
                       autocomplete="off" class="layui-input" value="${HosGet.hAddress}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="hInformation" class="layui-form-label">
                <span class="x-red">*</span>信息
            </label>
            <div class="layui-input-inline">
                <input type="text" id="hInformation" name="hInformation" required="" lay-verify="hInformation"
                       autocomplete="off" class="layui-input" value="${HosGet.hInformation}">
            </div>
        </div>

            <input class="layui-btn" type="submit" value="编辑"  id="doctor_list" >
    </form>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;

        //自定义验证规则
        form.verify({
           name: function (value) {
                if (value.length < 5) {
                    return '昵称至少得5个字符啊';
                }
            }


        });




    });


    function login() {
        $.ajax({
            url:"/update",
            type:"post",
            contentType: "application/json; charset=utf-8",
            data:$("#doctor_info").serialize(),
            dataType: "json",
            success:function(data){
                if(data=="ok"){
                    alert(data.msg);
                    window.location.href="ad_doctor-list.jsp";
                } else{
                    alert("编辑失败")
                }

            },
            error:function(e){
                alert("错误！！");
            }
        });

    }




</script>
<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>