var flag1 = false;
var flag2 = false;
var flag3 = false;
var flag4 = false;
$(function () {
    $.each($("input"),function (i, val) {
        $(val).blur(function () {
            if ($(val).attr("name") == "apName") {
                $(".nameMsg").remove();
                var userName = val.value;
                var regName = /^[\u4E00-\u9FA5]{2,4}$/
                if (userName == "" || userName.trim() == "") {
                    $("#remind1").html("<font color='red'>用户名不能为空</font>");
                    flag1 =false;
                } else if (!regName.test(userName)) {
                    flag1=false;
                    $("#remind1").html("<font color='red'>中文</font>");
                } else {
                    flag1=true;
                    $("#remind1").html("<font color='red'>OK</font>");

                }

            }else if ($(val).attr("name") == "idcast") {
                $(".phoneMsg").remove();
                var idcast = val.value;
                var idcast1 = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
                if (idcast == "" || idcast.trim() == "") {
                    flag2 =false;
                    $("#remind2").html("<font color='red'>身份证不能为空</font>");
                } else if (!idcast1.test(idcast)) {
                    flag2 =false;
                    $("#remind2").html("<font color='red'>格式错误</font>");

                } else {
                    flag2 =true;
                    $("#remind2").html("<font color='red'>OK</font>");
                }

            }else if ($(val).attr("name") == "aphone") {
                $(".phoneMsg").remove();
                var phone = val.value;
                var regPhone = /[13,15,18]\d{9}/;
                if (phone == "" || phone.trim() == "") {
                    flag3 =false;
                    $("#remind3").html("<font color='red'>手机不能为空</font>");
                } else if (!regPhone.test(phone)) {
                    flag3 =false;
                    $("#remind3").html("<font color='red'>格式错误</font>");

                } else {
                    flag3 =true;
                    $("#remind3").html("<font color='red'>OK</font>");
                }

            }else if ($(val).attr("name") == "apAddress") {
                $(".phoneMsg").remove();
                var address = val.value;
                if (address == "" || address.trim() == "") {
                    flag4 = false;
                    $("#remind4").html("<font color='red'>地址不能为空</font>");
                } else {
                    flag4 = true;
                    $("#remind4").html("<font color='red'>OK</font>");
                }
            }
        });
    });
});
$("#sub").bind("click",function(){
    if(flag1&&flag2&&flag3&&flag4){
            $.ajax({
                type: "POST",
                url:'/submit',
                data:$('#appForm').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("服务器异常,无法完成操作!");
                },
                success: function(data) {
                    if(data=='0'){
                        alert("该医生预约已满,请更换日期或医生!");
                    }
                    else if(data=='-1'){
                        alert('就诊人不存在,请先注册就诊人信息!');
                        location.href = '/login.jsp';
                    }
                    else if(data=='-2'){
                        alert('对不起,您已经预约过该医生了,不能重复预约!');
                    }
                    else{
                        alert('恭喜您,预约成功,您的预约顺序号是：'+data+',请记住您的序号!');
                        location.href = '/login.jsp';
                    }

                }
            });
    }else{
        alert("提交失败");
        return false;
    }
});


