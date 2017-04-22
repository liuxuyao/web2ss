<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../include/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>用户编辑</title>
<meta name="keywords" content="用户">
<meta name="description" content="用户">

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
						<h5>用户编辑</h5>
						<div class="ibox-tools"></div>
					</div>
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="signupForm" method="post" action="${ctx }/user/${method}">
							<input type="hidden" name="id" value="${user.id}">
							<div class="form-group">
								<label class="col-sm-3 control-label">用户名：</label>
								<div class="col-sm-8">
									<input id="username" name="username" class="form-control" type="text" value="${user.username}"> <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 用户名必须6个字符以上</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">性别：</label>
								<div class="col-sm-8">
									<div class="radio i-checks">
										<label> <input type="radio" value="1" name="sex" <c:if test="${user.sex==1}">checked="checked"</c:if>> <i></i> 男
										</label> <label> <input type="radio" value="0" name="sex" <c:if test="${user.sex==0}">checked="checked"</c:if>> <i></i>女
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">E-mail：</label>
								<div class="col-sm-8">
									<input id="email" name="email" class="form-control" type="email" value="${user.email }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">手机：</label>
								<div class="col-sm-8">
									<input id="mobile" name="mobile" class="form-control" type="mobile" value="${user.mobile }">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<button class="btn btn-primary" type="submit">提交</button>
								</div>
							</div>
					 </form>
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
	<script src="${ctx}/static/bootstrap/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="${ctx}/static/bootstrap/js/plugins/validate/messages_zh.min.js"></script>

	<script src="${ctx}/static/bootstrap/js/demo/form-validate-demo.js"></script>
	<!-- iCheck -->
	<script src="${ctx}/static/bootstrap/js/plugins/iCheck/icheck.min.js"></script>

	<script>
		$(function() {
			var icon = "<i class='fa fa-times-circle'></i> ";
			$("#signupForm").validate({
				rules : {
					username : {
						required : true,
						minlength : 6
					},
					email : {
						email : true
					},
					mobile : {
						required : true
					}
				},
				messages : {
					username : {
						required : icon + "请输入您的用户名",
						minlength : icon + "用户名必须6个字符以上"
					},
					mobile : {
						required : icon + "请输入您的手机号",
					}

				}
			});
			$(".i-checks").iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});
	</script>
</body>
</html>
