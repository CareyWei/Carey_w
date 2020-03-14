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
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=7">
    <meta name="description" content="广州市网上预约挂号">
    <meta name="keywords" content="预约挂号，广州挂号，网上挂号,自助终端挂号">
    <meta name="robots" content="all">
    <title>预医小能手</title>
    <link rel="stylesheet" type="text/css" href="/css/common/base.css">
    <link rel="stylesheet" type="text/css" href="/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="/css/common/mod.css">
    <link rel="stylesheet" type="text/css" href="/css/common/ui.datepicker.css">
    <link rel="stylesheet" type="text/css" href="/css/common/jquery-ui-1.8.20.custom.css">
    <link rel="stylesheet" type="text/css" href="/css/common/hospital_detail.css">
    <link rel="stylesheet" type="text/css" href="/css/common/doctor.css">
    <link rel="stylesheet" type="text/css" href="/css/common/doctor_detail.css">
    <link rel="stylesheet" type="text/css" href="/css/common/appointment_form.css">

</head>
<script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/js/EasyUI/jquery.js"></script>
<script type="text/javascript" src="/js/EasyUI/base.js"></script>
<script type="text/javascript" src="/js/appointment.js"></script>
<script type="text/javascript" src="/js/EasyUI/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/EasyUI/index.js"></script>
<script type="text/javascript" src="/js/EasyUI/sso-client.js" ></script>
<script type="text/javascript" src="/js/EasyUI/jquery-ui-1.8.20.custom.min.js"></script>
<script type="text/javascript" src="/js/EasyUI/md5.js"></script>
<script type="text/javascript" src="/js/EasyUI/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/EasyUI/formValidator.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/EasyUI/jquery.autocomplete.js"></script>
<body>
<script language="javascript">
    var manageId = "${sessionScope.user}"
     if (manageId.length == 0 || manageId == null) {
        alert("您尚未登录！");
        top.location = "/login.jsp";
    }

</script>
<div class="wrap">
    <div class="headerBg clearfix">
        <div class="header">
            <p class="header-topTxt mb10">
                <c:if test="${empty sessionScope.user }">
                    <a href="login.jsp">登录</a>&nbsp;|&nbsp;<a href="login.jsp">注册</a>&nbsp;|&nbsp;
                </c:if>
                <c:if test="${!empty sessionScope.user }">
                    您好，[<font color="red">${sessionScope.user.name}</font>]<a href="#">个人信息</a>&nbsp;|&nbsp;<a href="/login.jsp">退出登录</a>
                </c:if>
                &nbsp;|&nbsp;<span>投诉电话：020-00000</span>

            </p>
            <p class="header-logo"><span class="hotPhone">预约热线：<b class="hotPhone-no">020-00000</b></span></p>
            <form action="/quit_login.xhtml" method="post" name="quitLogin"></form>
        </div>
    </div>
    <div style="width:960px;margin:0 auto;display:none;" id="noticBlock">
        <div style="float:left;border:1px solid #FECB66;width:938px;padding:10px;background-color:#FEFEE4;color:#FE0000;">
            <p>尊敬的用户：</p>
            <p style="text-indent:2em;" id="comNoticeCnt"></p>
        </div>
    </div>


    <div class="menuBar mb15 clearfix">
        <div class="menu menuL"></div>
        <div class="menuX menu_nav">
            <ul class="top">
                <li><a class="on" id="01" href="http://localhost:8888/hospital/" item="#index" title="首页">首&nbsp;页</a></li>
                <li><a id="02" href="http://localhost:8888/selectDoc?grade=&dTid=&did=" item="#reserve" class="">挂号服务</a></li>
                <li><a id="03" href="/AppointManage" item="#regmng">预约管理</a></li>

                <li><a id="05" href="/tingzhens.xhtml" item="#notice" class="">通知及反馈</a></li>
            </ul>
            <div style="clear:both;display:block;"></div>
            <ul id="reserve" class="bot" style="display: none; padding-left: 84px;">
                <li><a id="0201" title="预约挂号" href="http://localhost:8888/selectDoc?grade=&dTid=&did="><span>预约挂号</span></a></li>
                <!--<li><a id="0202" title="当天挂号" href="/OPTSPUB1/PTS130135.dow"><span>当天挂号</span></a></li>-->
            </ul>
            <ul id="notice" class="bot" style="display: none; padding-left: 490px;">
                <li><a id="0501" title="停诊通知" href="/tingzhens.xhtml"><span>停诊通知</span></a></li>
            </ul>
            <!-- <div style="clear:both;display:block;"></div> -->
        </div>
    </div>
    <div class="bd">
        <div class="clearfix brdD7">

            <div class="userInfo">
                <div class="basicInfo mb10">

                    <p>
                        <span class="infoR">真实姓名：</span>
                        <span class="infoR">${appointMent.apName}</span>
                    </p>
                    <p>
                        <span class="infoR">证件号：</span>
                        <span class="infoL">${appointMent.idcast}</span> </p>
                    <p>
                        <span class="infoR">手机号码：</span>
                        <span class="infoR">${appointMent.aphone}</span>
                    </p>

                    <p>
                        <span class="infoR">家庭地址：</span>
                        <span class="infoR">${appointMent.apAddress}</span>
                    </p>
                </div>

                <p class="c_red" style="line-height:20px;width: 664px;margin-top:10px;">请注意：请按时就诊，如不能按时就诊请在就诊日前一天取消预约订单。</p>
                <p class="c_red" style="line-height:20px;width: 664px;">部分医院的订单状态需就诊后第二天更新，请耐心等待。</p>
            </div>
            <a name="orderList"></a>
            <div class="record">
                <div class="tabWidget mb20">
                    <ul class="tabWidget-item" id="tabWidget">
                        <li class="on" item="list1">所有预约</li>
                    </ul>
                </div>
                <c:if test="${ empty ListAppoint }" >
                <div class="recordTable" id="list1" style="display: block;">
                   暂无数据
                </div>
                </c:if>
                <c:if test="${ !empty ListAppoint }" >
                    <div class="recordTable" id="list1" style="display: block;">
                        <table class="tableStyle">
                            <thead>
                            <tr>
                                <th width="15%">订单号</th>
                                <th width="10%">就诊医生</th>
                                <th width="12%">就诊日期</th>
                                <th width="15%">医院</th>
                                <th width="10%">预约渠道</th>
                                <th width="12%">预约状态</th>
                                <th width="18%">操作管理</th>
                            </tr>
                            <c:forEach items="${ListAppoint}" var="appoint">
                            <tr>
                                <th width="15%">${appoint.apId}</th>
                                <th width="10%">${appoint.apName}</th>
                                <th width="12%">${appoint.appointTime}</th>
                                <th width="15%">${appoint.doctor.hospital.hName}</th>
                                <th width="10%">网上</th>
                                <th width="12%">成功</th>
                                <th width="18%"><a href="http://localhost:8888/hospital" id="appoint" >取消预约</a></th>


                            </tr>
                                <input type="hidden" id="apId" value="${appoint.apId}">
                            </c:forEach>
                            </thead>
                        </table>


                    </div>
                </c:if>
                <div class="recordTable" id="list2" style="display:none"></div>
                <div class="recordTable" id="list3" style="display:none"></div>
            </div>
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>
    <script type="text/javascript" >
        var apId = $('#apId').val();
        $(function () {
            $('#appoint').click(function(){
                $.ajax({
                    type: "POST",
                    url:'/appointDelete?apId='+apId,
                    data:apId=$('#apId').val(),// 你的formid
                    async: false,
                    error: function(request) {
                        alert("服务器异常,无法完成操作!");
                    },
                    success: function(data) {
                        if(data=='1'){
                            alert("取消成功");
                        }
                        else {
                            alert('取消失败');
                        }
                    }
                });

            });
        });
    </script>
<div class="bg_gray">


    <div class="footer">
        <div class="line_bt"></div>
        <div class="footer-content">
            <div class="footer-logo"><span></span></div>
            <span class="ml10">地址：广东培正学院</span>
            <span class="ml10">技术支持：广东培正学院</span>
            <span class="ml10">广东培正学院版权所有</span><br>
            <span class="ml10">粤ICP备000000号</span>
            <span class="ml10"><a target="_blank"
                                  href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44010402000394"><img
                    style="vertical-align:middle"
                    src="./images/common/beian.png">&nbsp;粤公网安备&nbsp;44010402000394号</a></span>&nbsp;
            <script src="http://s25.cnzz.com/stat.php?id=4589427&amp;web_id=4589427&amp;show=pic1"
                    language="JavaScript"></script>
            <script src="http://c.cnzz.com/core.php?web_id=4589427&amp;show=pic1&amp;t=z" charset="utf-8"
                    type="text/javascript"></script>
            <a href="https://www.cnzz.com/stat/website.php?web_id=4589427" target="_blank" title="站长统计"><img border="0"
                                                                                                             hspace="0"
                                                                                                             vspace="0"
                                                                                                             src="http://icon.cnzz.com/img/pic1.gif"></a><br>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        navInit();//初始化菜单
        sso_check_login();//单点登录检测
    });
    /*
    * highOnclick(pId,curId)
    * curId 二级菜单当前ID名称
    */
    var curStr = "0101";
    if (curStr != "" && curStr != "null") {
        highOnclick(curStr);
    }

</script>



<iframe id="sso_background_frame" src="about:blank" width="0" height="0"></iframe>
</body>
</html>
