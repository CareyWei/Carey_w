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
    <form id="doctor_info"   action="/update" method="post" >
        <input type="hidden" value="${doctor.dCid}" name = "dCid">
        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>邮箱
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_email" name="email" required="" lay-verify="email"
                       autocomplete="off" class="layui-input" readonly="readonly" value="${doctor.email}">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="L_username" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_username" name="name" required="" lay-verify="nikename"
                       autocomplete="off" class="layui-input" value="${doctor.name}" >
            </div>
        </div>
        <div class="layui-form-item">
            <label for="gender" class="layui-form-label">
                <span class="x-red">*</span>性别
            </label>
            <div class="layui-input-inline">
                <input type="text" id="gender" name="gender" required="" lay-verify="gender"
                       autocomplete="off" class="layui-input" value="${doctor.gender}">
            </div>
        </div>
        <div class="layui-form-item">
        <label for="score" class="layui-form-label">
            <span class="x-red">*</span>评分
        </label>
        <div class="layui-input-inline">
            <input type="text" id="score" name="score" required="" lay-verify="score"
                   autocomplete="off" class="layui-input" value="${doctor.score}">
        </div>
        </div>
        <div class="layui-form-item">
            <label for="skill" class="layui-form-label">
                <span class="x-red">*</span>擅长
            </label>
            <div class="layui-input-inline">
                <input type="text" id="skill" name="skill" required="" lay-verify="skill"
                       autocomplete="off" class="layui-input" value="${doctor.skill}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="description" class="layui-form-label">
                <span class="x-red">*</span>描述
            </label>
            <div class="layui-input-inline">
                <input type="text" id="description" name="description" required="" lay-verify="description"
                       autocomplete="off" class="layui-input" value="${doctor.description}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="hName" class="layui-form-label">
                <span class="x-red">*</span>医院
            </label>
            <div class="layui-input-inline">
            <select  name="hId"  id="hName">
                <option value="">-请选择-</option>
                <c:forEach items="${page.data}" var="s1" >
                    <option value="${s1.hospital.hId}" ${doctor.hospital.hId==s1.hospital.hId?'selected':''}>${s1.hospital.hName}</option>
                </c:forEach>
            </select>
        </div>
        </div>
        <div class="layui-form-item">
        <label for="dname" class="layui-form-label">
            <span class="x-red">*</span>部门
        </label>
            <div class="layui-input-inline">
                <select  name="did"  id="dname">
                    <option value="">-请选择-</option>
                    <c:forEach items="${page.data}" var="s1" >
                        <option value="${s1.deptlist.did}" ${doctor.deptlist.did==s1.deptlist.did?'selected':''}>${s1.deptlist.dname}</option>
                    </c:forEach>
                </select>
            </div>
    </div>
        <div class="layui-form-item">
            <label for="dTname" class="layui-form-label">
                <span class="x-red">*</span>科室
            </label>
            <div class="layui-input-inline">
                <select  name="dTid"  id="dTname">
                    <option value="">-请选择-</option>
                    <c:forEach items="${page.data}" var="s1" >
                        <option value="${s1.deptlistT.dTid}" ${doctor.deptlistT.dTid==s1.deptlistT.dTid?'selected':''}>${s1.deptlistT.dTname}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="surgeryweek" class="layui-form-label">
                <span class="x-red">*</span>出诊时间
            </label>
            <div class="layui-input-inline">
                <input type="text" id="surgeryweek" name="surgeryweek" required="" lay-verify="surgeryweek"
                     readonly="readonly"  autocomplete="off" class="layui-input" value="${doctor.surgeryweek}">
                <a class="layui-btn" href="/admin/page/ad_outCall-list.jsp">修改</a>
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
                    window.location.href="/admin/page/ad_doctor-list.jsp";
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