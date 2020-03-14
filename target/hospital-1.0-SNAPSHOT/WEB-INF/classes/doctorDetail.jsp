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

</head>
<body>
<script language="javascript">
    var manageId="${sessionScope.user}"
    if(manageId.length==0||manageId==null){
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
    <div class="wrap">
    <div class="ys-doctor-detail">
        <section class="container-crumb ys-util-text-auxiliary">
            <h5><a class="ys-util-text-min ys-util-text-auxiliary a-hover" href="hospital/detail/${doctor.hospital.hId}">首页</a></h5>
            &nbsp;&gt;&nbsp;<h5>
            <label class="ys-util-text-min ys-util-text-auxiliary">"${doctor.name}"医生个人主页</label></h5>
        </section>
        <div class="ys-util-bg-gray container-box">
            <article class="container-frame">
                <section class="container-summary">
                    <div class="summary-img ys-util-img"><a class="ys-img-lazy-frame" href="javascript:void(0);">
                        <img class="" src="/images/index/yisheng1.png"  style="height: 100%;"></a></div>
                    <div class="summary-list">
                        <div class="summary-row" style="line-height: 16px;">
                            <h1 class="ys-util-text-medium">${doctor.name}</h1>
                            <a href="#" target="_blank">
                                <img class="ys-icon-image ys-util-margin-l5" src="/images/index/pic_identify_bdys.png" ><span class="identify-text ys-util-text-min ys-util-text-auxiliary only-one-line a-hover">认证医生</span></a><label class="ys-util-margin-l5"><span class="ys-util-margin-l5">
                            <c:choose>
                                <c:when test="${doctor.grade == 1}">
                                    主任医师
                                </c:when>
                                <c:when test="${doctor.grade == 2}">
                                    副主任医师
                                </c:when>
                                <c:when test="${doctor.grade == 3}">
                                    主治医师
                                </c:when>
                                <c:when test="${doctor.grade == 4}">
                                    普通医师
                                </c:when>
                            </c:choose>
                        </span><span class="ys-util-margin-l5"></span></label></div>
                        <div class="summary-row ys-util-margin-t12">
                            <span class="container-comment-star">

                                <img src="/images/index/pic_star_light.png" class="ys-star-small">

                                <img src="/images/index/pic_star_light.png" class="ys-star-small">

                                <img src="/images/index/pic_star_light.png" class="ys-star-small">

                                <img src="/images/index/pic_star_light.png" class="ys-star-small">

                                <img src="/images/index/pic_star_light_gray.png" class="ys-star-small">
                            </span>
                            <span class="ys-util-text-primary ys-util-text-medium summary-comment-score ys-util-margin-r20"></span><label class="ys-util-text-secondary ys-util-margin-r10">医生态度<span class="ys-util-margin-l6 ys-util-text-primary">9.0</span></label><label class="ys-util-text-secondary">治疗效果<span class="ys-util-margin-l6 ys-util-text-primary">7.0</span></label>
                        </div>
                        <div class="summary-row ys-util-margin-t12"><span class="ys-util-text-normal ys-util-margin-r10"><a class="a-hover" target="_blank" href="hospital/detail/${doctor.hospital.hId}">${doctor.hospital.hName}</a></span><span class="ys-util-text-normal ys-util-margin-r10"><a class="a-hover" target="_blank" href="#">${doctor.deptlist.dname}</a></span></div>
                        <div class="summary-row ys-util-margin-t5 doctor-goodat">
                            <h6 class="ys-util-text-normal ys-util-text-secondary">擅长：</h6>
                            <label class="ys-util-text-normal" id="goodat-label">${doctor.skill}</label>
                        </div>
                    </div>
                </section>
            </article>

        </div>
        <div class="map-layer" id="map-layer">
            <div class="container-tab-content">
                <article class="container-main">
                    <!-- Tab页：医生详情 -->
                    <div id="doctorInfo" class="tab-doctorInfo">
                        <div class="doctor-time">
                            <article class="select-card">
                                <h3 class="ys-util-text-medium" id="schedule-anchor">选择就诊时间</h3>
                                <div class="table">
                                    <div class="schedule-left">
                                        <table class="schedule">
                                            <tbody>
                                            <tr>
                                                <th class="ph">
                                                    <div class="inner-border">&nbsp;&nbsp;&nbsp;就诊时段</div>
                                                </th>
                                            </tr>
                                            <tr>
                                                <td class="ph">
                                                    <div class="inner-border">上午</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="ph">
                                                    <div class="inner-border">下午</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="ph">
                                                    <div class="inner-border">夜诊</div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="schedule-main">
                                        <i class="left-arrow"></i>
                                        <div class="arrow-bar left-arrow-bar">
                                            <i></i>
                                        </div>
                                        <div class="schedule-main-outer">
                                            <table id="f" class="schedule" style="">
                                                <tbody>
                                                <tr>
                                                    <c:forEach items="${dayInfoList}" var="dayInfo">
                                                        <th>
                                                            <div class="date">${dayInfo.date}</div>
                                                            <div class="text">${dayInfo.week}</div>
                                                        </th>
                                                    </c:forEach>
                                                </tr>

                                                <tr>
                                                    <!--<td class="ph">上午</td>-->
                                                    <c:forEach items="${dayInfoList}" var="dayInfo">

                                                        <td>
                                                            <c:if test="${dayInfo.sw != 1}">
                                                                <c:choose>
                                                                    <c:when test="${dayInfo.swstate ==1 }">
                                                                        <div class="inner-border opening">
                                                                            <a hidefocus="true" class="opening" href="/appointment/${doctor.dCid}?dayInfo=${dayInfo.fullDate}(${dayInfo.week})上午">
                                                                                <span class="normal-type">点击预约</span>
                                                                            </a>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${dayInfo.swstate ==0 }">
                                                                        <div class="inner-border opening">
                                                                            <div class="inner-border" style="padding-top: 20px">
                                                                                <span class="normal-a" >预约已满</span>
                                                                            </div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="inner-border" style="padding-top: 20px">
                                                                            <span class="normal-a">1</span>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                            </c:if>
                                                            <c:if test="${dayInfo.sw == 1}">
                                                                <div class="inner-border" style="padding-top: 20px">
                                                                    <span class="normal-a">出诊</span>

                                                                </div>
                                                            </c:if>
                                                        </td>
                                                    </c:forEach>
                                                </tr>

                                                <tr>
                                                    <!--<td class="ph">下午</td>-->
                                                    <c:forEach items="${dayInfoList}" var="dayInfo">
                                                        <td>
                                                            <c:if test="${dayInfo.xw != 1}">
                                                                <c:if test="${dayInfo.xwstate == 0}">
                                                                    <div class="inner-border opening">
                                                                        <a hidefocus="true" class="opening" href="/appointment/${doctor.dCid}?dayInfo=${dayInfo.fullDate}(${dayInfo.week})下午">
                                                                            <span class="normal-type">点击预约</span>
                                                                        </a>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${dayInfo.xwstate !=0}">
                                                                    <div class="inner-border" style="padding-top: 20px">
                                                                        <span class="normal-a">已预约满</span>
                                                                    </div>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${dayInfo.xw == 1}">
                                                                <div class="inner-border" style="padding-top: 20px">
                                                                    <span class="normal-a">出诊</span>

                                                                </div>
                                                            </c:if>
                                                        </td>
                                                    </c:forEach>

                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- 向右箭头替代方案
                                            <i class="right-arrow disabled"></i>-->
                                        <div class="arrow-bar right-arrow-bar">
                                            <i>

                                            </i>
                                        </div>

                                    </div>

                                </div>

                            </article>
                        </div>
                        <div class="doctor-experience">
                            <h3 class="ys-util-text-medium">执业经历</h3>
                            <p class="ys-util-text-smaller ys-util-margin-t10">${doctor.description}</p>
                        </div>
                        <!-- 用户评价 -->


                    </div>
                </article>


                <aside class="container-aside">
                    <article class="broad" style="border-bottom: none; margin-bottom: 0px;">
                        <div class="title">挂号规则</div>
                        <div class="ct">
                            <p class="depics"><span class="sq">1.&nbsp;</span><span class="text">每日8:00左右更新后一天号源</span></p>
                            <p class="depics"><span class="sq">2.&nbsp;</span><span class="text">可预约当天和未来2周号源</span></p>
                            <p class="depics"><span class="sq">3.&nbsp;</span><span class="text">请参考短信提示，到医院就诊</span></p>
                            <p class="depics"><span class="sq">4.&nbsp;</span><span class="text">就诊前一天16:00前</span></p>
                            <p class="depics"><span class="sq">5.&nbsp;</span><span class="text">如需帮助，可拨打客服4000-xxx-xxx(10:00-18:00)</span></p>
                        </div>
                    </article>
                    <article class="broad" style="margin-bottom: 0px;">

                    </article>

                </aside>
            </div>
        </div>
    </div>
</div>
    <div class="clearfix">
    </div>
</div>

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
<script type="text/javascript" src="/js/EasyUI/jquery.js"></script>
<script type="text/javascript" src="/js/EasyUI/base.js"></script>

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
<script type="text/javascript" src="/js/EasyUI/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/EasyUI/index.js"></script>
<script src="/js/EasyUI/sso-client.js" type="text/javascript"></script>
<script type="text/javascript"
        src="/js/EasyUI/jquery-ui-1.8.20.custom.min.js"></script>
<script type="text/javascript" src="/js/EasyUI/md5.js"></script>
<script type="text/javascript" src="/js/EasyUI/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/EasyUI/formValidator.js" charset="UTF-8"></script>


<script type="text/javascript" src="/js/EasyUI/jquery.autocomplete.js"></script>


<iframe id="sso_background_frame" src="about:blank" width="0" height="0"></iframe>
<div id="ui-datepicker-div"
     class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-helper-hidden-accessible"></div>
</body>
</html>
