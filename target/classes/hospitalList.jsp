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
    <link rel="stylesheet" type="text/css" href="/css/common/doctor.css">

</head>
<script language="javascript">
    var manageId = "${sessionScope.user}"
    if (manageId.length == 0 || manageId == null) {
        alert("您尚未登录！");
        top.location = "/login.jsp";
    }

</script>
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
    <div class="wrap">

        <div class="container" data-accuracy="0">
            <div class="select-condition">
                <div class="select-detail" data-type="1">
                    <h4>区域选择:</h4>
                    <ul class="dropmenus" id="depart-level1-ul" style="margin-bottom: 10px;">
                        <li data-department-flag="1" data-value="0" id="depart0" <c:if test="${empty arId }"> class="select-cur" </c:if> data-child="1">
                            <a href="/hospitalList?key=${key}">全部</a></li>
                        <c:forEach items="${area}" var="a">
                            <li data-department-flag="1"  <c:if test="${arId == a.arId }"> class="select-cur" </c:if>   id="${a.arname}">
                                <a href="/hospitalList?key=${key}&hId=${hId}&arId=${a.arId}">${a.arname}</a></li>
                        </c:forEach>

                    </ul>

                </div>


            </div>
            <div class="doctor-info-box">
                <h4>符合条件的有
                    <label class="curdotor"><em id="doc_total">${Dpage.totalCount}</em></label>
                    间医院</h4>
                <ul id="doctor-info-list" class="doctor-info-list" style="display: block;">
                    <c:forEach var="hospital" items="${Dpage.data}">
                        <li class="doctor-info-single" style="border-top-width: 1px; border-right-width: 1px; border-left-width: 1px; border-style: solid solid none; border-top-color: rgb(234, 234, 234); border-right-color: rgb(255, 255, 255); border-left-color: rgb(255, 255, 255);">
                            <div class="doctor-card clearfix">
                                <div class="info-pic"><a href="doctor/detail/" target="_blank">
                                    <img src="/images/index/yisheng1.png"></a></div>
                                <div class="infos">
                                    <div class="info-title" style="margin-top: -10px"><a href="doctor/detail/" target="_blank">
                                        <div>${hospital.hName}</div>
                                    </a><span class="doctor-medtitle">
                                <c:choose>
                                    <c:when test="${hospital.hLevel == 1}">公立三甲</c:when>
                                    <c:when test="${hospital.hLevel == 2}">公立二甲</c:when>
                                    <c:when test="${hospital.hLevel== 3}">公立一甲</c:when>
                                    <c:when test="${hospital.hLevel == 4}">公立三乙</c:when>
                                </c:choose>

                            </span><p class="info-hospittal">
                                        <span>医院电话：</span>
                                        <span>${hospital.hPhone}</span>
                                        <table cellspacing="0" cellpadding="0">
                                            <tbody>
                                            <tr >
                                                <td class="first-td" valign="top">医院地址: </td>
                                                <td class="last-td" valign="top">${hospital.hAddress}</td>
                                            </tr>

                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                                <div class="server-but fr">
                                    <p><a href="/hospital/detail/${hospital.hId}" target="_self">进入医院</a></p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>

                </ul>

                <c:if test="${empty Dpage.data}">
                    <div class="result-empty doctor-empty" style="display: block;">
                        <img src="images/no-doctor.png" class="resultimg">
                        <div class="result-text">抱歉！没有符合条件的医生</div>
                    </div>
                </c:if>
            </div>
            <c:if test="${!empty Dpage.data}">


                <div class="pagination-x pull-right" style="margin-top: 100px">
                <span class="pagers">
                    <ul class="pagination-x-list">
                        <ul>
                                <li>
                                   <a class="dropmenus" href="/hospitalList?pageNum=1&key=${key}&arId=${arId}" >
                                    <label>首页</label>
                                   </a>
                               </li>
                            <c:if test="${Dpage.pageNum == 1}" >
                            <li>
                            <a class="prev-off" >
                                <label>上一页</label>
                            </a>
                            </li>
                            </c:if>
                            <c:if test="${Dpage.pageNum != 1}">
                                <li>
                                 <a class="prev-on" href="/hospitalList?pageNum=${Dpage.pageNum-1}&key=${key}&arId=${arId}">
                                    <label>上一页</label>
                                </a>
                                </li>
                            </c:if>
                                <li>
                                    <span>
                                    第${Dpage.pageNum}页/共${Dpage.totalPage}页
                                    </span>
                               </li>

                            <c:if test="${Dpage.pageNum == Dpage.totalPage}">
                               <li>
                                   <a class="next-off" >
                                    <label>下一页</label>
                                   </a>
                               </li>
                            </c:if>
                           <c:if test="${Dpage.pageNum != Dpage.totalPage}">
                           <li>
                           <a class="next-on" href = "/hospitalList?pageNum=${Dpage.pageNum+1}&key=${key}&hId=${hId}&arId=${arId}">
                                <label>下一页</label>
                           </a>
                            </li>
                           </c:if>
                                <li>
                                   <a class="dropmenus" href="/hospitalList?pageNum=${Dpage.totalPage}&hId=${hId}&arId=${arId}">
                                    <label>末页</label>
                                   </a>
                               </li>
                        </ul>
                    </ul>
                </span>
                </div>
            </c:if>


        </div>


        <input type="hidden" id="search-tag" value=""><aside class="right-sidebar">
        <article class="broad" style="border-bottom: none; margin-bottom: 0px;">
            <h1 class="title">挂号规则</h1>
            <div class="ct">
                <p class="depics"><b class="sq">1.</b>每日8:00左右更新后一天号源</p>
                <p class="depics"><b class="sq">2.</b>可预约当天和未来2周号源</p>
                <p class="depics"><b class="sq">3.</b>请参考短信提示，到医院就诊</p>
                <p class="depics"><b class="sq">4.</b>就诊前一天16:00前</p>
            </div>
        </article>
        <article class="broad" style="margin-bottom: 0px;">

        </article>


    </aside>
        <div class="result-empty hospital-empty" style="display: none;">
            <img src="images/no-hospital.png" class="resultimg"><div class="result-text">抱歉！没有符合条件的医院</div>
        </div>
    </div>

    <div class="clearfix">



    </div>
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
