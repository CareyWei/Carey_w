$(function () {
    $.each($("input"), function (i, val) {
        $(val).blur(function () {
            if ($(val).attr("name") == "cpwd") {

                var pwd1 = val.value;

                if (pwd1 == "" || pwd1.trim() == "") {
                    flag5 = false;
                    $("#remind5").html("<font color='red'>不能为空</font>");
                    ;
                } else {
                    $.ajax({
                        type: "POST",
                        url: "/checkpwd",//提交地址
                        data: "pwd2=" + pwd1,//提交数据
                        dataType: "json",//返回json格式
                        //contentType:"application/json;charset=utf-8",
                        success: function (data) {
                            if (data == '1') {//后端传来的msg的值是no,不能注册。反之。

                                $("#remind3").html("<font color='red'>密码输入错误</font>");

                            }
                            if (data =='0' ) {

                                $("#remind3").html("");//如果没有被注册，将提示语清空。
                            }
                        }
                    });

                }
            }
            else  if ($(val).attr("name") == "newpwd") {
                $(".pwdMsg").remove();
                var pwd = val.value;
                var regPwd = /^\w{4,10}$/;
                if (pwd == " " || pwd.trim() == "") {
                    $("#remind1").html("<font color='red'>密码不能为空</font>");
                } else if (!regPwd.test(pwd)) {

                    $("#remind1").html("<font color='red'>格式错误</font>");
                } else {

                    $("#remind1").html("<font color='red'>OK</font>");
                }

            }else if ($(val).attr("name") == "conpwd") {
                $(".pwd2Msg").remove();
                var pwd2 = val.value;
                var pwd = $("#newpwd").val();

                if (pwd2 == "" || pwd2.trim() == "" ) {

                    $("#remind2").html("<font color='red'>密码不为空！</font>");
                } else if(pwd2!=pwd) {

                    $("#remind2").html("<font color='red'>两次密码输入不一致</font>");
                }else{

                    $("#remind2").html("<font color='red'>OK</font>");
                }

            }


        });
    });



});


    $(function () {
    $('#submit1').click(function () {
        $.ajax({
            type: "POST",
            url: '/updateInfor',
            data: $('#appForm').serialize(),// 你的formid
            async: false,
            error: function (request) {
                alert("服务器异常,无法完成操作!");
            },
            success: function (data) {
                if (data == '1') {
                    alert("修改成功");
                } else {
                    alert("修改失败");
                }
            }
        });

    });
});
$(function () {
    $('#submit2').click(function () {
        $.ajax({
            type: "POST",
            url: '/updatePwd',
            data: $('#appForm2').serialize(),// 你的formid
            async: false,
            error: function (request) {
                alert("服务器异常,无法完成操作!");
            },
            success: function (data) {
                if (data == '1') {
                    alert("修改成功");
                } else {
                    alert("修改失败");
                }
            }
        });

    });
});

