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


</head>
<body>
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

            <div class="resultHd">
                <h3 class="content-hd mb20"><b>快速检索结果</b></h3>
            </div>
            <div class="block-bd">
                <form method="post" action="/search" id="searchForm" name="searchForm"
                      accept-charset="UTF-8">
                    <div class="btn inputSSBg">
                        <input type="text" placeholder="请输入医院/医生/疾病名称" id="Dname" name="Dname" class="inputTxt c_gray9 ac_input" value="${key}">

                        <input type="submit" value="" class="btn icon_search" >>
                    </div>
                </form>
            </div>
            <div class="resultBd">
                <c:if test="${empty Dpage.data}">
                <p class="key mb20">检索关键字：<b class="c_red">${key}</b></p>
                <div class="resultList mb20 clearfix" id="keySearchResult">
                    <div style="text-align:center;border:1px solid #FED1AF;background-color: #FEFFCA;color: #FF6701;float:left;line-height:22px;padding:5px 15px;width: 470px;">
                        没有找到与<b>${key}</b>相关的医生，建议更改关键词再试试。
                    </div>
                </div>
                </c:if>
                <c:if test="${!empty Dpage.data}">
                    <p class="key mb20">检索关键字：<b class="c_red">${key}</b></p>
                    <div class="resultList mb20 clearfix" id="keySearchResult">
                        <ul class="block-bd  content-doctorList" id="deptList1">
                            <c:forEach var="doctor" items="${Dpage.data}">
                                <li class="doctor-first" style="background-color: rgb(249, 249, 249);">
                                    <a href="doctor/detail/${doctor.did}" >
                                        <img height="80px" src="/images/index/yisheng1.png">
                                    </a>
                                    <p><a target="_blank" href="#"><span>${doctor.name}</span></a>
                                        <span class="doctor-level">
                                            <c:choose>
                                                <c:when test="${doctor.grade == 1}">主任医师</c:when>
                                                <c:when test="${doctor.grade == 2}">副主任医师</c:when>
                                                <c:when test="${doctor.grade == 3}">主治医师</c:when>
                                                <c:when test="${doctor.grade == 4}">普通医师</c:when>
                                            </c:choose>
                                        </span>
                                    </p>
                                    <p>${doctor.deptlist.dname}/${doctor.deptlistT.dTname}</p>
                                    <p title="${doctor.hospital.hName}">${doctor.hospital.hName}</p>
                                    <p class="btn-appoint"><a href="doctor/detail/${doctor.dCid}"><span style="border-color: rgb(1, 151, 241); color: rgb(255, 255, 255); background-color: rgb(1, 151, 241);">一键预约</span></a></p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </div>
            <div class="pageBar fr mt10">

                <div class="dg_page pwm_record_page_w">
                    <div class="page_bar fr">
                        <a href="http://localhost:8888/search?pageNum=${Dpage.pageNum-1}"
                                <c:if test="${Dpage.pageNum<=1}"> onclick="javascript:return false"</c:if>
                        >
                            上一页
                        </a>
                        <a href="http://localhost:8888/search?pageNum=${Dpage.pageNum+1}"
                                <c:if test="${Dpage.pageNum>=Dpage.totalPage}"> onclick="javascript:return false"</c:if>
                        >
                            下一页
                        </a>

                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="clearfix"></div>
</div>

<div class="bg_gray">


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
</div>
<script type="text/javascript" src="js/EasyUI/jquery.js"></script>
<script type="text/javascript" src="js/EasyUI/base.js"></script>

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
<script type="text/javascript" src="js/EasyUI/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="js/EasyUI/index.js"></script>
<script src="js/EasyUI/sso-client.js" type="text/javascript"></script>
<script type="text/javascript"
        src="js/EasyUI/jquery-ui-1.8.20.custom.min.js"></script>
<script type="text/javascript" src="js/EasyUI/md5.js"></script>
<script type="text/javascript" src="js/EasyUI/jquery.cookie.js"></script>
<script type="text/javascript" src="js/EasyUI/formValidator.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/EasyUI/jquery.autocomplete.js"></script>


<iframe id="sso_background_frame" src="about:blank" width="0" height="0"></iframe>
<div id="ui-datepicker-div"
     class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-helper-hidden-accessible"></div>
</body>
</html>
