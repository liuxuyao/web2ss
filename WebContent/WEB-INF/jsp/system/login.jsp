<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../include/base.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/static/bootstrap/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/animate.css" rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/style.css?v=4.1.0" rel="stylesheet">

<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
	function refreshCaptcha() {
		document.getElementById("img_captcha").src = "${ctx}/static/images/kaptcha.jpg?t=" + Math.random();
	}
</script>
</head>

<body class="gray-bg">
	<div class="middle-box text-center loginscreen  animated fadeInDown">
		<div>
			<div>
				<h5 class="logo-name">港</h5>
			</div>
			<h3>欢迎使用 </h3>
			<form class="m-t" role="form" method="post" action="${ctx}/admin/login">
				<div class="form-group">
					<input id="username" name="username" type="text" class="form-control" placeholder="用户名" required="required">
				</div>
				<div class="form-group">
					<input id="password" name="password" type="password" class="form-control" placeholder="密码" required="required">
				</div>
				<!-- <div class="form-group form-inline text-left ">
					<input id="captcha" name="captcha" type="password" class="form-control" placeholder="验证码" required="" style="width:170px;"> <img alt="点击刷新验证码" src="${ctx}/static/images/1.jpg" class="" align="absmiddle" title="点击更换" id="img_captcha" onclick="refreshCaptcha();" style="width:120px;height:33px; vertical-align:middle;" />
				</div> -->
				<button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
				<a href="${ctx}/jsp/app/regist">
               <button type="button" class="btn btn-primary block full-width m-b">注册</button>
             </a>
			</form>
		</div>
	</div>

	<!-- 全局js -->
	<script src="${ctx}/static/bootstrap/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.6"></script>
	<c:choose>
		<c:when test="${error eq 'net.huadong.core.shiro.CaptchaException'}">
			<script>
				alert("验证码错误，请重试");
			</script>
		</c:when>
		<c:when test="${error eq 'org.apache.shiro.authc.UnknownAccountException'}">
			<script>
				alert("用户名不存在，请重试");
			</script>
		</c:when>
		<c:when test="${error eq 'org.apache.shiro.authc.IncorrectCredentialsException'}">
			<script>
				alert("密码错误，请重试");
			</script>
		</c:when>
	</c:choose>

</body>

</html>
