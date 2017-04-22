<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="../include/base.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>港口通 - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->

    <!-- 登录、注册 -->
    <link href="${ctx}/static/css/app_login_style.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div class="login-container">
        <h1>港口通 | 用户登录</h1>
        <div class="connect">
            <p>集港动态零距离，预约查询百分百</p>
        </div>
        <form action="${ctx }/admin/validateNamePwd" method="post" id="loginForm">
            <div>
                <input type="text" id="username" name="username" class="username" placeholder="用户名" autocomplete="off"/>
            </div>
            <div>
                <input type="password" id="password" name="password" class="password" placeholder="密码"
                       oncontextmenu="return false"
                       onpaste="return false"/>
            </div>
            <button id="submit" type="submit">登 陆</button>
        </form>
        <a href="${ctx}/jsp/app/regist.jsp">
            <button type="button" class="register-tis">还有没有账号？</button>
        </a>
    </div>
    <br/><br/><br/><br/>
    <div class="footer" style="line-height: 14px;font-size: 12px;">港口通，最专业，最快捷的移动应用<br/>
        汇集集港动态，集装箱预约状态查询等功能<br/>
        致力于为企业用户提供专业的港口物流查询平台
    </div>
</div>

<!-- 全局js -->
<script src="${ctx}/static/bootstrap/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/static/bootstrap/js/plugins/layer/layer.min.js"></script>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 登录、注册 -->
<script src="${ctx}/static/js/app_login_common.js"></script>
<!--背景图片自动更换-->
<script src="${ctx}/static/js/supersized.3.2.7.min.js"></script>
<!--表单验证-->
<script src="${ctx}/static/js/jquery.validate.min.js"></script>
<script src="${ctx}/static/js/jquery.cookie.js"></script>
<script src="${ctx}/static/bootstrap/js/plugins/validate/messages_zh.min.js"></script>

<script src="${ctx}/static/bootstrap/js/demo/form-validate-demo.js"></script>
<!-- iCheck -->
<script src="${ctx}/static/bootstrap/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/static/bootstrap/js/plugins/form/jquery.fom.js"></script>
<script src="${ctx}/static/bootstrap/js//plugins/layer/layer.min.js"></script>
<script>
    $(function () {
        $.supersized({
            // 功能
            slide_interval: 4000,    // 转换之间的长度
            transition: 1,    // 0 - 无，1 - 淡入淡出，2 - 滑动顶，3 - 滑动向右，4 - 滑底，5 - 滑块向左，6 - 旋转木马右键，7 - 左旋转木马
            transition_speed: 1000,    // 转型速度
            performance: 1,    // 0 - 正常，1 - 混合速度/质量，2 - 更优的图像质量，三优的转换速度//（仅适用于火狐/ IE浏览器，而不是Webkit的）
            // 大小和位置
            min_width: 0,    // 最小允许宽度（以像素为单位）
            min_height: 0,    // 最小允许高度（以像素为单位）
            vertical_center: 1,    // 垂直居中背景
            horizontal_center: 1,    // 水平中心的背景
            fit_always: 0,    // 图像绝不会超过浏览器的宽度或高度（忽略分钟。尺寸）
            fit_portrait: 1,    // 纵向图像将不超过浏览器高度
            fit_landscape: 0,    // 景观的图像将不超过宽度的浏览器
            // 组件
            slide_links: 'blank',    // 个别环节为每张幻灯片（选项：假的，'民'，'名'，'空'）
            slides: [    // 幻灯片影像
                {image: '${ctx}/static/images/1.jpg'}
            ]
        });
    });
    //jquery.validate表单验证
    $(document).ready(function () {
        //登录表单验证(表单提交)
        $("#loginForm").validate({
            onsubmit: true,// 是否在提交时验证
            submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form
                layer.load();
                $(form).ajaxSubmit({
                    success: function (result) {
                        alert(result);
                        layer.closeAll();
                        if (result == "success") {
                            alert("aaaa");
                            //saveCookie();
                            window.location.href = "${ctx}/admin/index";
                        } else if (result == "usererror") {
                            layer.msg('用户名或密码错误！', {
                                icon: 2,
                                time: 2000
                            }, function () {
                                layer.closeAll();
                                $("#loginForm").reset();
                                $("#username").focus();
                            });
                        } else {
                            layer.alert("系统异常，请联系管理员！", {
                                icon: 2
                            });
                        }
                    }, error: function (data) {
                        layer.closeAll();
                        layer.alert(data, {
                            icon: 2
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
        });
        jQuery(function () {
            var loginname = $.cookie('loginname');
            var password = $.cookie('password');
            if (typeof(loginname) != "undefined"
                    && typeof(password) != "undefined") {
                $("#username").val(loginname);
                $("#password").val(password);
                //$("#saveid").attr("checked", true);
            }
        });
    });
    // 记住密码
    /*function savePaw() {
     if (!$("#saveid").attr("checked")) {
     $.cookie('loginname', '', {
     expires : -1
     });
     $.cookie('password', '', {
     expires : -1
     });
     $("#username").val('');
     $("#password").val('');
     }
     }*/
    // cookie
    function saveCookie() {
        if ($("#saveid").attr("checked")) {
            $.cookie('loginname', $("#username").val(), {
                expires: 7
            });
            $.cookie('password', $("#password").val(), {
                expires: 7
            });
        }
    }
</script>

</body>

</html>
