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
<body>
<script language="javascript">
    var manageId = "${sessionScope.user}"
    if (manageId.length == 0 || manageId == null) {
        alert("您尚未登录！");
        top.location = "/login.jsp";
    }

</script>
<script src="https://cdn.staticfile.org/jquery/2.2.4/jquery.min.js"></script>
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
            <div class="ys-util-bg-gray container-box">
                <article class="container-frame">
                    <section class="container-summary">
                        <div class="summary-img ys-util-img"><a class="ys-img-lazy-frame" href="javascript:void(0);">
                            <img class="" src="/images/index/yisheng1.png" style="height: 100%;"></a></div>
                        <div class="summary-list">
                            <div class="summary-row" style="line-height: 16px;">
                                <h1 class="ys-util-text-medium">${doctor.name}</h1>
                                <a href="#" target="_blank">
                                    <img class="ys-icon-image ys-util-margin-l5"
                                         src="/images/index/pic_identify_bdys.png"><span
                                        class="identify-text ys-util-text-min ys-util-text-auxiliary only-one-line a-hover">认证医生</span></a><label
                                    class="ys-util-margin-l5"><span class="ys-util-margin-l5">
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
                                <span class="ys-util-text-primary ys-util-text-medium summary-comment-score ys-util-margin-r20"></span><label
                                    class="ys-util-text-secondary ys-util-margin-r10">医生态度<span
                                    class="ys-util-margin-l6 ys-util-text-primary">9.0</span></label><label
                                    class="ys-util-text-secondary">治疗效果<span
                                    class="ys-util-margin-l6 ys-util-text-primary">7.0</span></label>
                            </div>
                            <div class="summary-row ys-util-margin-t12"><span
                                    class="ys-util-text-normal ys-util-margin-r10"><a class="a-hover" target="_blank"
                                                                                      href="hospital/detail/${doctor.hospital.hId}">${doctor.hospital.hName}</a></span><span
                                    class="ys-util-text-normal ys-util-margin-r10"><a class="a-hover" target="_blank"
                                                                                      href="#">${doctor.deptlist.dname}</a></span>
                            </div>
                            <div class="summary-row ys-util-margin-t5 doctor-goodat">
                                <h6 class="ys-util-text-normal ys-util-text-secondary">擅长：</h6>
                                <label class="ys-util-text-normal" id="goodat-label">${doctor.skill}</label>
                            </div>
                        </div>
                    </section>
                </article>
                <div class="time-and-pay">
                    <span class="info-time"><span>就诊时间：</span>${dayInfo}</span><br>
                    <span class="pay-info"></span>
                </div>
            </div>
            <div class="container">
                <div class="write-list">
                    <p class="doctor-title">请填写预约信息(真实有效)<span>(输入的预约信息，我们将为你保密)</span><span
                            class="right-info"><span>*</span>为必填项</span></p>
                    <form id="appForm"  class="appForm" method="post" action="#" onsubmit="return false;">
                        <input type="hidden" name="dCid" value="${doctor.dCid}"/>
                        <input type="hidden" name="appointTime" value="${dayInfo}"/>
                        <table>
                            <tbody>
                            <tr>
                                <td class="label">真实姓名</td>
                                <td class="essential-mark"><span class="star-red">*</span></td>
                                <td>
                                    <div class="widget-input" id="widget-input-name">
                                        <input type="text" id="apName" name="apName">
                                        <span class="remind1" name="remind1" id="remind1"></span>
                                    </div>
                                </td>
                            </tr>
                            <tr id="id-card-tr">
                                <td class="label">身份证号</td>
                                <td class="essential-mark"><span class="star-red">*</span></td>
                                <td>
                                    <div class="widget-input" id="widget-input-identity">
                                        <input type="text" id="idcast" name="idcast">
                                        <span class="remind2" name="remind2" id="remind2"></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">联系手机</td>
                                <td class="essential-mark"><span class="star-red">*</span></td>
                                <td>
                                    <div class="widget-input" id="widget-input-phone">
                                        <input type="text" id="aphone" name="aphone">
                                        <span class="remind3" name="remind3" id="remind3"></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">地址</td>
                                <td class="essential-mark"><span class="star-red">*</span></td>
                                <td>
                                    <div class="widget-input" id="widget-input-address">
                                        <input type="text" id="apAddress" name="apAddress">
                                        <span class="remind4" name="remind4" id="remind4"></span>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <div id="su" class="widget-input submit-button" style="margin-top: -5px;padding-top: 50px;padding-left: 25px">
                                        <input type="submit" class="btn btn03" id="sub" >
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>

                </div>

            </div>
            <aside class="container-aside">
                <article class="broad" style="border-bottom: none; margin-bottom: 0px;">
                    <div class="title">挂号规则</div>
                    <div class="ct">
                        <p class="depics"><span class="sq">1.&nbsp;</span><span class="text">每日8:00左右更新后一天号源</span></p>
                        <p class="depics"><span class="sq">2.&nbsp;</span><span class="text">可预约当天和未来2周号源</span></p>
                        <p class="depics"><span class="sq">3.&nbsp;</span><span class="text">请参考短信提示，到医院就诊</span></p>
                        <p class="depics"><span class="sq">4.&nbsp;</span><span class="text">就诊前一天16:00前</span>
                        </p>
                        <p class="depics"><span class="sq">5.&nbsp;</span><span class="text">如需帮助，可拨打客服4000-xxx-xxx(10:00-18:00)</span>
                        </p>
                    </div>
                </article>
                <article class="broad" style="margin-bottom: 0px;">

                </article>

            </aside>
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
<script type="text/javascript" src="/js/appointment.js"></script>

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
<script type="text/javascript" src="/js/EasyUI/sso-client.js" ></script>
<script type="text/javascript" src="/js/EasyUI/jquery-ui-1.8.20.custom.min.js"></script>
<script type="text/javascript" src="/js/EasyUI/md5.js"></script>
<script type="text/javascript" src="/js/EasyUI/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/EasyUI/formValidator.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/EasyUI/jquery.autocomplete.js"></script>


<iframe id="sso_background_frame" src="about:blank" width="0" height="0"></iframe>
</body>
</html>
