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
    </div>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary">
                    <input type="checkbox" name="all" id="all" value="all">
                </div>
                医生名称： ${doctor.name}
            </th>
            <th>星期一</th>
            <th>星期二</th>
            <th>星期三</th>
            <th>星期四</th>
            <th>星期五</th>
            <th>星期六</th>
            <th>星期日</th>
            <th>操作</th>
        </tr>
        </thead>

        <tbody id="checklist1">
        <tr>
            <td>
                <input type="hidden" value="${doctor.dCid}" id="dCid">
                Forenoon
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>Forenoon</div>
            </td>
            <td>
                上午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item1" class="id" name="id" value="星期一上午"></div>
            </td>
            <td>
                上午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item2" class="id" name="id" value="星期二上午"></div>
            </td>
            <td>
                上午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item3" class="id" name="id" value="星期三上午"></div>
            </td>
            <td>
                上午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item4" class="id" name="id" value="星期四上午"></div>
            </td>
            <td>
                上午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item5" class="id" name="id" value="星期五上午"></div>
            </td>
            <td>
                上午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item6" class="id" name="id" value="星期六上午"></div>
            </td>
            <td>
                上午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item7" class="id" name="id" value="星期日上午"></div>
            </td>
            <td class="td-manage">

            </td>
        </tr>
        </tbody>
        <tbody id="checklist2">
        <tr>
            <td>
                Afternoon
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    Afternoon
                </div>
            </td>
            <td>
                下午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item8" class="id" name="id" value="星期一下午"></div>
            </td>
            <td>
                下午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item9" class="id" name="id" value="星期二下午"></div>
            </td>
            <td>
                下午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item10" class="id" name="id" value="星期三下午"></div>
            </td>
            <td>
                下午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item11" class="id" name="id" value="星期四下午"></div>
            </td>
            <td>
                下午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item12" class="id" name="id" value="星期五下午"></div>
            </td>
            <td>
                下午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item13" class="id" name="id" value="星期六下午"></div>
            </td>
            <td>
                下午
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
                    <input type="checkbox" id="checkbox_item14" class="id" name="id" value="星期日上午"></div>
            </td>
            <td class="td-manage">
                <button  title="修改" id="update" name="update" class="layui-btn">
                    <i class="layui-icon">修改</i>
                </button>
            </td>
        </tr>
        </tbody>
    </table>
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
    $("#update").click(function () {
        var dCid = $("#dCid").val();
        var test = window.document.getElementsByName("id");
        var a = "";
        for (var i = 0; i < test.length; i++) {
            if (test[i].checked) {
                var b = test[i].value;

                if (a == "") {
                    a = b;
                } else {
                    a += "," + b

                }
            }
        }
        if (a.length == 0) {
            alert("请选择您的出诊时间");
            return;
        }
        var c = layer.confirm("确认删除吗?")
        if (c == true) {
            $.ajax({//利用ajax发出请求
                type: "get",//请求类型
                url: "/updateTime", //向Controller里的batchDeleYyb传输ids
                data: {
                    surgeryweek: a, dCid: dCid
                },     //键值对
                success: function (data) {//删除成功后，后台会返回一个"ok";
                    if (data == "ok") {
                        layer.confirm("修改成功");//返回ok后弹出一个对话框。
                        window.location.href = window.location.href;
                    } else {
                        layer.confirm("修改失败");
                    }
                }
            });
        }


    });


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