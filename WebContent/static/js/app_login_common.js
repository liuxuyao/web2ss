﻿//打开字滑入效果
window.onload = function () {
    $(".connect p").eq(0).animate({"left": "0%"}, 600);
    $(".connect p").eq(1).animate({"left": "0%"}, 400);
};
//jquery.validate表单验证
$(document).ready(function () {
    //登录表单验证(表单提交)
   /* $("#loginForm").validate({
        onsubmit: true,// 是否在提交时验证
        submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form
            layer.load();
            $(form).ajaxSubmit({
                success: function (result) {
                    layer.closeAll();
                    if (result == "success") {
                        saveCookie();
                        window.location.href = "${ctx}/main/index";
                    } else if (result == "usererror") {
                        layer.msg('用户名或密码错误！', {
                            icon: 5,
                            time: 2000
                        }, function () {
                            layer.closeAll();
                            $("#loginForm").reset();
                            $("#username").focus();
                        });
                    } else {
                        layer.alert("系统异常，请联系管理员！", {
                            icon: 5
                        });
                    }
                }, error: function (data) {
                    layer.closeAll();
                    layer.alert(data, {
                        icon: 5
                    });
                }
            });
        },
        rules: {
            username: {
                required: true,//必填
                minlength: 3, //最少6个字符
                maxlength: 32//最多20个字符
            },
            password: {
                required: true,
                minlength: 3,
                maxlength: 32
            }
        },
        //错误信息提示
        messages: {
            username: {
                required: "必须填写用户名",
                minlength: "用户名至少为3个字符",
                maxlength: "用户名至多为32个字符"
            },
            password: {
                required: "必须填写密码",
                minlength: "密码至少为3个字符",
                maxlength: "密码至多为32个字符"
            }
        }
    });
    //登陆表单验证(失去焦点)
    $("#loginForm").validate({
        onsubmit: false,// 是否在提交时验证
        onfocusout: true,
        rules: {
            username: {
                required: true,//必填
                minlength: 3, //最少6个字符
                maxlength: 32//最多20个字符
            },
            password: {
                required: true,
                minlength: 3,
                maxlength: 32
            }
        },
        //错误信息提示
        messages: {
            username: {
                required: "必须填写用户名",
                minlength: "用户名至少为3个字符",
                maxlength: "用户名至多为32个字符",
                remote: "用户名已存在"
            },
            password: {
                required: "必须填写密码",
                minlength: "密码至少为3个字符",
                maxlength: "密码至多为32个字符"
            },
        }
    });*/
    //注册表单验证
    $("#registerForm").validate({
        rules: {
            username: {
                required: true,//必填
                minlength: 3, //最少6个字符
                maxlength: 32,//最多20个字符
                remote: {
                    url: "http://kouss.com/demo/Sharelink/remote.json",//用户名重复检查，别跨域调用
                    type: "post",
                },
            },
            password: {
                required: true,
                minlength: 3,
                maxlength: 32,
            },
            email: {
                required: true,
                email: true,
            },
            confirm_password: {
                required: true,
                minlength: 3,
                equalTo: '.password'
            },
            phone_number: {
                required: true,
                phone_number: true,//自定义的规则
                digits: true,//整数
            }
        },
        //错误信息提示
        messages: {
            username: {
                required: "必须填写用户名",
                minlength: "用户名至少为3个字符",
                maxlength: "用户名至多为32个字符",
                remote: "用户名已存在",
            },
            password: {
                required: "必须填写密码",
                minlength: "密码至少为3个字符",
                maxlength: "密码至多为32个字符",
            },
            email: {
                required: "请输入邮箱地址",
                email: "请输入正确的email地址"
            },
            confirm_password: {
                required: "请再次输入密码",
                minlength: "确认密码不能少于3个字符",
                equalTo: "两次输入密码不一致",//与另一个元素相同
            },
            phone_number: {
                required: "请输入手机号码",
                digits: "请输入正确的手机号码",
            },
        },
    });
    //添加自定义验证规则
    jQuery.validator.addMethod("phone_number", function (value, element) {
        var length = value.length;
        var phone_number = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/
        return this.optional(element) || (length == 11 && phone_number.test(value));
    }, "手机号码格式错误");
});