<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../include/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>用户编辑</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/static/bootstrap/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/animate.css" rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/style.css?v=4.1.0" rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/plugins/iCheck/custom.css" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>用户详情</h5>
						<div class="ibox-tools"></div>
					</div>
					<div class="ibox-content">
						<p>
							<label class="col-sm-3 control-label">用户名：</label>${user.username}</p>
						<p>
							<label class="col-sm-3 control-label">性别：</label>
							<c:if test="${user.sex==1}">男</c:if>
							<c:if test="${user.sex==0}">女</c:if>
						</p>
						<p>
							<label class="col-sm-3 control-label">E-mail：</label>${user.email }</p>
						<p>
							<label class="col-sm-3 control-label">手机：</label>${user.mobile }
						</p>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- 全局js -->
	<script src="${ctx}/static/bootstrap/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.6"></script>

	<!-- 自定义js -->
	<script src="${ctx}/static/bootstrap/js/content.js?v=1.0.0"></script>

	<!-- jQuery Validation plugin javascript-->
	<script src="${ctx}/static/bootstrap/js/validate/jquery.validate.min.js"></script>
	<script src="${ctx}/static/bootstrap/js/validate/messages_zh.min.js"></script>

	<script src="${ctx}/static/bootstrap/js/demo/form-validate-demo.js"></script>
	<!-- iCheck -->
	<script src="${ctx}/static/bootstrap/js/iCheck/icheck.min.js"></script>

	<script>

	</script>
</body>
</html>
