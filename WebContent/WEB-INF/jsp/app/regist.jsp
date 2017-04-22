<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="../include/base.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>港口通 - 注册</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->

    <!-- 登录 -->
    <link href="${ctx}/static/css/app_login_style.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div class="register-container">
        <h1>港口通 | 用户注册</h1>
        <div class="connect">
            <p>通关一体化，贸易可视化</p>
        </div>

        <form action="${ctx}/jsp/app/login.jsp" method="post" id="registerForm">
            <div>
                <input type="text" name="username" class="username" placeholder="您的用户名" autocomplete="off"/>
            </div>
            <div>
                <input type="password" name="password" class="password" placeholder="输入密码" oncontextmenu="return false"
                       onpaste="return false"/>
            </div>
            <div>
                <input type="password" name="confirm_password" class="confirm_password" placeholder="再次输入密码"
                       oncontextmenu="return false" onpaste="return false"/>
            </div>
            <div>
                <input type="text" name="phone_number" class="phone_number" placeholder="输入手机号码" autocomplete="off"
                       id="number"/>
            </div>
            <div>
                <input type="email" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false"
                       onpaste="return false"/>
            </div>

            <button id="submit" type="submit">注 册</button>
        </form>
        <a href="${ctx}/jsp/system/login.jsp">
            <button type="button" class="register-tis">已经有账号？</button>
        </a>
    </div>
</div>

<!-- 全局js -->
<script src="${ctx}/static/bootstrap/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 登录、注册 -->
<script src="${ctx}/static/js/app_login_common.js"></script>
<!--背景图片自动更换-->
<script src="${ctx}/static/js/supersized.3.2.7.min.js"></script>
<!--表单验证-->
<script src="${ctx}/static/js/jquery.validate.min.js?var1.14.0"></script>
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
</script>

</body>

</html>
