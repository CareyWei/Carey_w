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
    <form id="doctor_info"   onsubmit="return false;" action="#" method="post" >
        <input type="hidden" value="${doctor.dCid}" id="dCid" name="dCid">

        <div class="layui-form-item">
            <label for="dTid" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="dTid" name="dTid" required="" lay-verify="dTid"
               readonly="readonly"    autocomplete="off" class="layui-input" value="${doctor.name}" >
            </div>
        </div>
        <div class="layui-form-item">
            <label for="pwd" class="layui-form-label">
                <span class="x-red">*</span>原密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="pwd" name="pwd" required="" lay-verify="pwd"
                       autocomplete="off" class="layui-input" value="">
            </div>
            <div id="check" class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label for="NewPwd" class="layui-form-label">
                <span class="x-red">*</span>新密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="NewPwd" name="NewPwd" required="" lay-verify="NewPwd"
                       autocomplete="off" class="layui-input" value="">
            </div>
        </div>



            <input class="layui-btn" type="submit" value="编辑"  onclick="return a_update();" id="doctor_list" >
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
    //检测与原密码是否相对
    $("#pwd").change(function() {
        var dCid = $("#dCid").val();
        var pwd = $("#pwd").val();

        $.ajax({//利用ajax发出请求
            type: "post",//请求类型
            url: "checkPwd/", //向Controller里的batchDeleYyb传输ids
            data: {
                "dCid":dCid,
                "pwd":pwd,
            },     //键值对
            success:function (data) {//删除成功后，后台会返回一个"ok";
                if (data == "ok") {
                    alert("密码正确")
                } else {
                    alert("密码错误,请重新填写")
                }
            },
            error:function(e){
                alert("错误！！");
            }
        });
    });



    function a_update(){
        var dCid = $("#dCid").val();
        var pwd = $("#NewPwd").val();



        $.ajax({//利用ajax发出请求
            type: "post",//请求类型
            url: "Out/update/", //向Controller里的batchDeleYyb传输ids
            data: {
                "dCid":dCid,
                "pwd":pwd,
            },     //键值对
            success:function (data) {//删除成功后，后台会返回一个"ok";
                if (data == "ok") {
                    layer.confirm("修改成功");//返回ok后弹出一个对话框。
                } else {
                    layer.confirm("修改失败");
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