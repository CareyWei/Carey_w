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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/admin/css/font.css">
    <link rel="stylesheet" href="/admin/css/xadmin.css">
    <link rel="stylesheet" href="/css/common/doctor.css">
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
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">医生信息</a>
        <a>
          <cite>导航</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/DeptDMessage">

            <input type="text" name="key" placeholder="请输入用户姓名" autocomplete="off" class="layui-input">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">搜索</i></button>

        </form>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" id="delete_all_btn"><i class="layui-icon"></i>批量删除</button>
        <a class="layui-btn" href="/selectInsert"><i class="layui-icon"></i>添加
        </a>

        <span class="x-right" style="line-height:40px">共有数据：${Dpage.total} 条</span>
    </xblock>
    <table class="layui-table">
    <thead>
    <tr>
        <th>
            <div class="layui-unselect header layui-form-checkbox" lay-skin="primary">
                <input type="checkbox" name="all" id="all" value="all"></div>
        </th>
        <th>部门编号</th>
        <th>部门名</th>
        <th>操作</th>
    </tr>
    </thead>

    <tbody id="checklist">
    <c:forEach items="${dt}" var="dept">
        <tr>
            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item" class="id" name="id" value="${dept.did}"></div>
            </td>
            <td>${dept.did}</td>
            <td>${dept.dname}</td>
            <td class="td-manage">
                <a title="删除" href="javascript:;" onclick="return deleteKey(${dept.did});">
                    <i class="layui-icon" >删除</i>
                </a>||
                <a title="编辑" href="/selectUpdate?did=${dept.did}&dname=${dept.dname}" >
                    <i class="layui-icon">编辑</i>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>
    <div class="pagination-x pull-right" style="margin-top: 100px">
      <span class="pagers">

            <ul class="pagination-x-list">
                <ul>
                    <li>
                        <a class="dropmenus"
                           href="/DeptDMessage?pageNum=${Dpage.firstPage}&key=${key}&grade=${grade}&did=${did}&dTid${dTid}">
                            <label>首页</label>
                        </a>
                    </li>
                    <c:if test="${Dpage.pageNum ==1}">
                        <li>
                            <a class="prev-off">
                                <label>上一页</label>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${Dpage.pageNum != 1}">
                        <li>
                            <a class="prev-on"
                               href="/DeptDMessage?pageNum=${Dpage.pageNum-1}&key=${key}&grade=${grade}&did=${did}&dTid${dTid}">
                                <label>上一页</label>
                            </a>
                        </li>
                    </c:if>
                    <li>
                                    <span>
                                    第${Dpage.pageNum}页/共${Dpage.pages}页
                                    </span>
                    </li>

                    <c:if test="${Dpage.pageNum == Dpage.pages}">
                        <li>
                            <a class="next-off">
                                <label>下一页</label>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${Dpage.pageNum != Dpage.pages}">
                        <li>
                            <a class="next-on"
                               href="/DeptDMessage?pageNum=${Dpage.pageNum+1}&key=${key}&grade=${grade}&did=${did}&dTid=${dTid}">
                                <label>下一页</label>
                            </a>
                        </li>
                    </c:if>
                    <li>
                        <a class="dropmenus"
                           href="/DeptDMessage?pageNum=${Dpage.lastPage}&key=${key}&grade=${grade}&did=${did}&dTid=${dTid}">
                            <label>末页</label>
                        </a>
                    </li>
                </ul>
            </ul>

      </span>
    </div>

</div>
<script>


    $("#all").click(function () {
        /*
        * 如果使用attr来获取check的值返回的是undefined
        * 用prop获取返回的就是true
        * 获取和修改dom原生的属性推荐使用prop,自定义的属性使用attr
        * */
        $(".id").prop("checked", $(this).prop("checked"));
    });


    /*用户-删除*/
    //批量
    $("#delete_all_btn").click(function () {

        var test = window.document.getElementsByName("id");
        var a = "";
        for (var i = 0; i < test.length; i++) {
            if (test[i].checked) {
                var b = test[i].value;

                if (a == "") {
                    a = b;
                } else {
                a+=","+b

                }
            }
        }
        if (a.length==0) {
            alert("请选择要删除的app!");
            return;
        }
        var c =layer.confirm("确认删除吗?")
        if (c ==true) {
            $.ajax({//利用ajax发出请求
                type: "get",//请求类型
                url: "/dept/delete", //向Controller里的batchDeleYyb传输ids
                        data: {did: a},     //键值对
                    success: function (data) {//删除成功后，后台会返回一个"ok";
                        if (data == "ok") {
                            layer.confirm("删除成功");//返回ok后弹出一个对话框。
                            window.location.href=window.location.href
                        } else {
                            layer.confirm("删除失败");
                        }
                }
            });
        }



    });

    //单删
    function deleteKey(a){
    var b = a;
        $.ajax({//利用ajax发出请求
            type: "post",//请求类型
            url: "/dept/delete", //向Controller里的batchDeleYyb传输ids
            data: {did: b},     //键值对
            success: function (data) {//删除成功后，后台会返回一个"ok";
                if (data == "ok") {
                    layer.confirm("删除成功");//返回ok后弹出一个对话框。
                    window.location.href=window.location.href
                } else {
                    layer.confirm("删除失败");
                }
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