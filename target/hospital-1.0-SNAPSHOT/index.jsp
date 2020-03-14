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
    <script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="/js/EasyUI/jquery.js"></script>
    <script type="text/javascript" src="/js/EasyUI/base.js"></script>
    <script type="text/javascript" src="/js/EasyUI/jquery.ui.datepicker.js"></script>
    <script type="text/javascript" src="/js/EasyUI/index.js"></script>
    <script src="/js/EasyUI/sso-client.js" type="text/javascript"></script>
    <script type="text/javascript"
            src="/js/EasyUI/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="/js/EasyUI/md5.js"></script>
    <script type="text/javascript" src="/js/EasyUI/jquery.cookie.js"></script>
    <script type="text/javascript" src="/js/EasyUI/formValidator.js" charset="UTF-8"></script>

    <script type="text/javascript" src="js/EasyUI/jquery.autocomplete.js"></script>


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
                    <a href="/login.jsp">登录</a>&nbsp;|&nbsp;<a href="/login.jsp">注册</a>&nbsp;|&nbsp;
                </c:if>
                <c:if test="${!empty sessionScope.user }">
                    您好，[<font color="red">${sessionScope.user.name}</font>]<a href="/personal">个人信息</a>&nbsp;|&nbsp;<a href="/login/logout">退出登录</a>
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

    <div class="bd-index clearfix ">
        <div class="leftSider">


            <div class="flashSlider mb10">
                <ul class="slider" style="top: 0px;">
                    <li>
                        <a>
                            <img src="/images/index/flash_140723_2.jpg" alt="微信已开通" width="675" height="260">
                        </a>
                    </li>
                    <li>
                        <a>
                            <img src="/images/index/flash_140723_1.jpg" alt="手机客户端已开通" width="675" height="260">
                        </a>
                    </li>
                    <li>
                        <a>
                            <img src="/images/index/flash_140808_2.jpg" alt="新医院上线" width="675" height="260">
                        </a>
                    </li>
                </ul>
                <ul class="num">
                    <li class="on">1</li>
                    <li class="">2</li>
                    <li class="">3</li>
                </ul>
            </div>


            <div class="mb10"><img src="/images/index/guahaoStep.jpg" alt="预约挂号流程" height="60" width="675"
                                   usemap="#step">
                <map name="step">
                    <area shape="rect" coords="65,0,170,60" href="/flow_ghbyweb.xhtml#map1" alt="用户注册登录" title="用户注册登录">
                    <area shape="rect" coords="185,0,320,60" href="/flow_ghbyweb.xhtml#map2" alt="选择医生及就诊时间"
                          title="选择医生及就诊时间">
                    <area shape="rect" coords="335,0,440,60" href="/flow_ghbyweb.xhtml#map3" alt="确认网上支付"
                          title="确认网上支付">
                    <area shape="rect" coords="455,0,580,60" href="/flow_ghbyweb.xhtml#map4" alt="接收预约成功短信"
                          title="接收预约成功短信">
                    <area shape="rect" coords="590,0,675,60" href="/flow_ghbyweb.xhtml#map5" alt="取号就诊" title="取号就诊">
                </map>
            </div>


            <div class="content-block brdBtNone">
                <h3 class="block-hd mb10"><b class="txt">按照医院找医生</b><b class="bg"></b></h3>
                <div class="block-bd">
                    <ul class="content-tab mb10" id="areaList">
                        <li data-department-flag="1" data-value="0" id="depart0" <c:if
                                test="${arId==null}"> class="on"</c:if> data-child="1">
                            <a href="http://localhost:8888/hospital">广州市</a></li>
                        <c:forEach items="${area}" var="area1">
                            <li data-department-flag="1" data-value="0" id="depart0" <c:if
                                    test="${arId==area1.arId }"> class="on"</c:if> data-child="1">
                                <a href="http://localhost:8888/hospital?arId=${area1.arId}&hId=${hId}">${area1.arname}</a></li>
                        </c:forEach>
                    </ul>
                    <div id="hospitalList">
                        <ul class="content-hospitalList">
                            <c:forEach items="${page.data}" var="hospital">
                                <li><p class="iconImg"></p>
                                    <a title="" href="/hospitalList?arId=${hospital.arId}&hId=${hospital.hId}">${hospital.hName}</a>
                                </li>
                            </c:forEach>
                        </ul>

                        <div class="pageBar fr mt10">

                            <div class="dg_page pwm_record_page_w">
                                <div class="page_bar fr">
                                    <a href="http://localhost:8888/hospital?pageNum=${page.pageNum-1}"
                                            <c:if test="${page.pageNum<=1}"> onclick="javascript:return false"</c:if>
                                    >
                                        上一页
                                    </a>
                                    <a href="http://localhost:8888/hospital?pageNum=${page.pageNum+1}"
                                            <c:if test="${page.pageNum>=page.totalPage}"> onclick="javascript:return false"</c:if>
                                    >
                                        下一页
                                    </a>
                                    共有${page.totalCount}间医院
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <div class="content-block">
                <h3 class="block-hd mb10"><b class="txt">按照疾病找医生</b><b class="bg"></b>
                    <a href="/selectDoc?grade=${grade}&dTid=${dTid}&did=${did}">更多疾病&gt;&gt;</a>
                </h3>
                <ul class="block-bd content-departmentList" id="deptList">
                    <c:forEach items="${dept}" var="de">
                        <li><label><a href="/selectDoc?${key}&grade=${grade}&dTid=${dTid}&did=${de.did}">${de.dname}</a></label>
                            <span class="deptNm">
                            <c:forEach items="${de.deptlistT}" var="dT">
                                <a href="/selectDoc?${key}&grade=${grade}&dTid=${dT.dTid}&did=${de.did}">${dT.dTname}</a>
                            </c:forEach>
                        </span>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="content-block">
                <h3 class="block-hd mb10"><b class="txt">名师推荐</b><b class="bg"></b><a href="/selectDoc?grade=${grade}&dTid=${dTid}&did=${did}">更多医生&gt;&gt;</a>
                </h3>
                <ul class="block-bd  content-doctorList" id="deptList1">
                    <c:forEach var="doctor" items="${doc}">
                        <li class="doctor-first" style="background-color: rgb(249, 249, 249);"  >
                            <a href="/doctor/detail/${doctor.did}" >
                                <img height="80px" src="/images/index/yisheng1.png">
                            </a>
                            <p><a target="_blank" href="/doctor/detail/${doctor.dCid}"><span>${doctor.name}</span></a>
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
                            <p class="btn-appoint"><a href="/doctor/detail/${doctor.dCid}"><span style="border-color: rgb(1, 151, 241); color: rgb(255, 255, 255); background-color: rgb(1, 151, 241);">一键预约</span></a></p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="rightSider">


            <div class="loginBox mb10">
                <h1 class="block-hd mb10"><b>公告栏</b></h1>
                <form action="" method="post" name="login_form">
                    <ul class="loginBox-content" >
                        <!-- <input type="button" value='立即注册' class="btn btn_register"/> -->
                      <li>  <h1><font style="color: black" size="5px" >全国已开通</font></h1></li>
                        <li>
                            <font style="color: red" size="5px">${hospital.size()}</font><font style="" size="4px">家医院</font>
                        </li>
                    </ul>

                </form>
                <div class="loginBox-registerBtn">
                <h1>武汉加油</h1>
                </div>
            </div>


            <div class="content-block brdBtNone pb20">
                <h3 class="block-hd mb10"><b>快速检索</b></h3>
                <div class="block-bd">
                    <form method="post" action="/search" id="searchForm" name="searchForm">
                        <div class="btn inputSSBg">
                            <input type="text" placeholder="请输入医院/医生/疾病名称" id="Dname" name="Dname" class="inputTxt c_gray9 ac_input">

                            <input type="submit" value="" class="btn icon_search" >>
                        </div>
                    </form>
                </div>
            </div>

                <%--出诊查询--%>
            <div class="content-block brdBtNone">
                <h3 class="block-hd mb10"><b>医生出诊查询</b></h3>
                <div class="block-bd">
                    <form action="/selectDoc" method="post" name="searchDocForm" >
                        <ul class="searchDoctorBox">

                            <li>
                                <span>就医地区：</span>
                                <select class="AreaT" id="AreaT" name="AreaT"  >
                                    <option value="">------请选择地区-----</option>
                                    <c:forEach items="${area}" var="c1">
                                        <option value="${c1.arname}"  onclick="testJson1();">${c1.arname}</option>
                                    </c:forEach>
                                </select>
                            </li>
                            <li>
                                <span>就医医院：</span>
                                <select class="hospital" id="hospital" name="hospital">
                                    <option value="">------请选择医院-----</option>

                                </select>
                            </li>
                            <li>
                                <span>一级科室：</span>
                                <select class="Dept" name="Dept" id="Dept" >
                                    <option value="">-----请选择一级科室----</option>
                                    <c:forEach items="${dept}" var="c2">
                                        <option value="${c2.dname}"  onclick="testJson2();">${c2.dname}</option>
                                    </c:forEach>
                                </select>
                            </li>
                            <li>
                                <span>二级科室：</span>
                                <select class="DeptT" name="DeptT" id="DeptT">
                                    <option value="">-----请选择二级科室----</option>
                                </select>
                            </li>

                            <li class="searchBtn">
                                <span>&nbsp;</span><input type="submit" value="查  询" class="btn btn03" id="submit" >
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
    <%--二级联动--%>
            <script type="text/javascript" >
                function testJson1(){
                    var pr_name = $("#AreaT").val();
                    $("#hospital").html('<option value="">----请选择地区----</option>');
                    $.ajax({
                        url : "/AjaxArea",
                        type : "GET",
                        dataType : "json",
                        data:{arname:pr_name},
                        success : function(data){
                            if(data!=null){
                                $(data).each(function(index){
                                    $("#hospital").append(
                                        '<option value="'+data[index].hName+'">'+data[index].hName+'</option>'
                                    );
                                });
                            }
                        }
                    });
                }
                function testJson2(){
                    var dname = $("#Dept").val();
                    $("#DeptT").html('<option value="">----请选择科室----</option>');
                    $.ajax({
                        url : "/AjaxDept",
                        type : "GET",
                        dataType : "json",
                        data:{dname:dname},
                        success : function(data){
                            if(data!=null){
                                $(data).each(function(index){
                                    $(data[index].deptlistT).each(function(indexT){
                                    $("#DeptT").append(
                                        '<option value="'+data[index].deptlistT[indexT].dTname+'">'+data[index].deptlistT[indexT].dTname+'</option>'
                                    );
                                    });
                                });
                            }
                        }
                    });
                }
            //检查下拉框是否为空
                $(function(){
                    $("#submit").click(function(){
                        var area=$("#AreaT").val();
                        var hospital=$("#hospital").val();
                        var Dept=$("#Dept").val();
                        var DeptT=$("#DeptT").val();
                        if(area == 0) {
                            alert("请选择一个地区");
                            return false;
                        }
                        if(hospital == 0) {
                            alert("请选择一个医院");
                            return false;
                        }
                        if(Dept == 0) {
                            alert("请选择一级科室");
                            return false;
                        }
                        if(DeptT == 0) {
                            alert("请选择二级科室");
                            return false;
                        }

                    });

                });
            </script>

            <div class="content-block"><img src="/images/index/ad_01.jpg" ></div>
            <div class="content-block">

                <div class="block-bd">

                </div>
            </div>


        </div>
    </div>


    <div class="friendLink mt10">
        <h3 class="block-hd"><b>友情链接</b></h3>
        <div class="friendLink-list clearfix" id="friendLink">
            <div class="bg-select hosp-list"><span class="hosp-typ">省属医院</span>
                <ul class="hosp-link-list" style="display:none;"></ul>
            </div>
            <div class="bg-select hosp-list"><span class="hosp-typ">部队医院</span>
                <ul class="hosp-link-list" style="display:none;"></ul>
            </div>
            <div class="bg-select hosp-list"><span class="hosp-typ">高校附属医院</span>
                <ul class="hosp-link-list" style="display:none;"></ul>
            </div>
            <div class="bg-select hosp-list"><span class="hosp-typ">市属医院</span>
                <ul class="hosp-link-list" style="display:none;"></ul>
            </div>
            <div class="bg-select hosp-list"><span class="hosp-typ">区属医院</span>
                <ul class="hosp-link-list" style="display:none;"></ul>
            </div>
            <div class="bg-select hosp-list"><span class="hosp-typ">其他相关医院</span>
                <ul class="hosp-link-list" style="display:none;"></ul>
            </div>
        </div>
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
<div id="ui-datepicker-div"
     class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-helper-hidden-accessible"></div>
</body>
</html>
