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
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台登录-X-admin2.0</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="shortcut icon" href="/admin/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/admin/css/font.css">
    <link rel="stylesheet" href="/admin/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/admin/js/xadmin.js"></script>

</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="/admin/page/ad_index.jsp">后台管理中心</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>

    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${user11.name}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="/login.jsp">切换帐号</a></dd>
                <dd><a href="/login/logout">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="/hospital">前台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <c:forEach items="${Menu}" var="menu">
            <ul id="nav">
                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#xe6b8;</i>
                        <cite>${menu.mname}</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <c:forEach items="${menu.child}" var="child">
                        <ul class="sub-menu">
                            <li>
                                <c:if test="${child.url =='/AppointMessage'}">

                                    <a _href="${child.url}?rid=${user11.rid}&dCid=${user11.dCid}">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>${child.mname}</cite>
                                    </a>
                                </c:if>

                                <c:if test="${child.url =='/DocOnDuty'}">

                                    <a _href="${child.url}?rid=${user11.rid}&dCid=${user11.dCid}">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>${child.mname}</cite>
                                    </a>
                                </c:if>
                                <c:if test="${child.url =='/PersonalMessage'}">

                                    <a _href="${child.url}?rid=${user11.rid}&dCid=${user11.dCid}">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>${child.mname}</cite>
                                    </a>
                                </c:if>
                                <c:if test="${child.url =='/ChangePwd'}">

                                    <a _href="${child.url}?rid=${user11.rid}&dCid=${user11.dCid}">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>${child.mname}</cite>
                                    </a>
                                </c:if>

                                <c:if test="${child.url != '/AppointMessage'}">
                                    <c:if test="${child.url !='/DocOnDuty'}">
                                        <c:if test="${child.url !='/PersonalMessage'}">
                                            <c:if test="${child.url !='/ChangePwd'}">
                                                <a _href="${child.url}">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>${child.mname}</cite>
                                                </a>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                </c:if>
                            </li>
                        </ul>
                    </c:forEach>
                </li>

            </ul>
        </c:forEach>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='/admin/page/welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2017 x-admin v2.3 All Rights Reserved</div>
</div>
<!-- 底部结束 -->
<script>
    //百度统计可去掉
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>
</html>