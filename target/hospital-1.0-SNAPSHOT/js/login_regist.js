/*登录验证*/
function login() {
    // console.info("点击了登录");
    var userName = $("#email1").val();
    // console.info(userName)
    var userPass = $("#pwd").val();
    // console.info(userPass);
    if (userName == "" || userName == null) {
            alert("邮箱不能为空");
            return false;
    } else if (userPass == "" || userPass == null) {
        alert("密码不能为空");
        return false;
    } else {
        return true;
    }
}
var flag1 = false;
var flag2 = false;
var flag3 = false;

var flag5 = false;

/*注冊模块*/
$(function () {
    $.each($("input"), function (i, val) {
        $(val).blur(function () {
            if ($(val).attr("name") == "name") {
                $(".nameMsg").remove();
                var userName = val.value;
                var regName = /^[\u4E00-\u9FA5]{2,4}$/
                if (userName == "" || userName.trim() == "") {
                    $("#remind1").html("<font color='red'>用户名不能为空</font>");
                    flag1 =false;
                } else if (!regName.test(userName)) {
                    flag1=false;
                    $("#remind1").html("<font color='red'>姓名必须中文</font>");
                } else {
                    flag1=true;
                    $("#remind1").html("<font color='red'>OK</font>");

                }

            } else if ($(val).attr("name") == "pwd") {
                $(".pwdMsg").remove();
                var pwd = val.value;
                var regPwd = /^\w{4,10}$/;
                if (pwd == "" || pwd.trim() == "") {
                    flag2 =false;
                    $("#remind2").html("<font color='red'>密码不能为空</font>");
                } else if (!regPwd.test(pwd)) {
                    flag2 =false;
                    $("#remind2").html("<font color='red'>格式错误</font>");
                } else {
                    flag2 =true;
                    $("#remind2").html("<font color='red'>OK</font>");
                }

            } else if ($(val).attr("name") == "rupwd") {
                $(".pwd2Msg").remove();
                var pwd2 = val.value;
                var pwd = $("#upwd").val();

                if (pwd2 == "" || pwd2.trim() == "" ) {
                    flag3 =false;
                    $("#remind3").html("<font color='red'>密码不为空！</font>");
                } else if(pwd2!=pwd) {
                    flag3 =false;
                    $("#remind3").html("<font color='red'>两次密码输入不一致</font>");
                }else{
                    flag3 =true;
                    $("#remind3").html("<font color='red'>OK</font>");
                }

            }else if ($(val).attr("id") == "email") {
                $(".dateMsg").remove();
                var email = val.value;
                var regDate = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
                if (email == "" || email.trim() == "") {
                    flag5 =false;
                    $("#remind5").html("<font color='red'>请输入邮箱</font>");;
                } else if (!regDate.test(email)) {
                    flag5 =false;
                    $("#remind5").html("<font color='red'>格式错误！</font>");
                } else {
                    $.ajax({
                        type:"POST",
                        url:"check/checkname",//提交地址
                        data:"email="+email,//提交数据
                        dataType:"json",//返回json格式
                        //contentType:"application/json;charset=utf-8",
                        success:function(data){
                            if ("no" == data.msg) {//后端传来的msg的值是no,不能注册。反之。
                                flag5 =false;
                                $("#remind5").html("<font color='red'>抱歉，该用户已被注册，请更换！</font>");

                            }if("yes" == data.msg){
                                flag5 =true;
                                $("#remind5").html("OK");//如果没有被注册，将提示语清空。
                            }
                        }
                    });

                }

            }
        });
    });



});
    function checkAll(){
        if(flag1&&flag2&&flag3&&flag5){
            return true;
        }else{
            return false;
        }


}
/*邮箱唯一性验证*/

  /*发送验证码*/

$(function () {

                $("#btn").click(function () {
                        if ($("#email").val()) {
                            $.ajax({
                                type: "POST",
                                url: "vildeCode?random",
                                data:{email:$("#email").val()},
                                success: function (data) {
                                    alert("验证码发送成功，请注意查收。");
                                },
                            })
                        } else {
                            alert("邮箱发送失败");
                            $("#notice").html("请填写邮箱");
                            setTimeout(function () {
                                $("#notice").hide();
                            }, 1000);
                        }
                    }
                );


})


//忘记密码
$(function() {
    $('#forSend').click(function() {
        var email = $('#email3').val();
        var regex = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;

        if(email != 'undefined' && email.length<=0) {
            $("#remind1").html("请输入e-mail地址");
            return false;
        }else if(!regex.test(email)) {
            $("#remind1").html("e-mail地址不正确！");
        }else {
            $("#remind1").html('');
        }
        $.ajax({
            type : 'get',
            url : '/ForgetPwd',//请求后台接口
            data : {'email':email},//获取输入的邮箱地址
            dataType : 'json',
            async : false,
            success : function(data) {
                //0-发送失败	1-发送成功		2-无此用户
                if(data == '1') {
                    alert("邮箱发送成功")
                }else if(data == '0') {
                    alert("邮箱发送失败")
                }
            }
        });
    });
})








