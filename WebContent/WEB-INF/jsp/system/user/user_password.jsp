<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../include/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>密码修改</title>
<meta name="keywords" content="密码修改">
<meta name="description" content="密码修改">

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
						<h5>个人密码修改</h5>
						<div class="ibox-tools"></div>
					</div>
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="signupForm" method="post" action="${ctx }/user/savePassword">
							<input type="hidden" name="id" value="${user.id}">
							<div class="form-group">
								<label class="col-sm-3 control-label">旧密码：</label>
								<div class="col-sm-8">
									<input id="old_password" name="old_password" class="form-control" type="password" value=""> <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 密码必须6个字符以上</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">新密码：</label>
								<div class="col-sm-8">
									<input id="new_password" name="new_password" class="form-control" type="password" value=""> <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 密码必须6个字符以上</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">新密码确认：</label>
								<div class="col-sm-8">
									<input id="re_password" name="re_password" class="form-control" type="password" value=""> <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 密码必须6个字符以上</span>
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

	<c:if test="${message!=null}">
		<script>
			parent.layer.alert('${message}', {
				icon : 6
			});
		</script>
	</c:if>

	<script>
		$(function() {
			var icon = "<i class='fa fa-times-circle'></i> ";
			$("#signupForm").validate({
				rules : {
					old_password : {
						required : true,
						minlength : 6
					},
					new_password : {
						required : true,
						minlength : 6
					},
					re_password : {
						required : true,
						minlength : 6,
						equalTo : "#new_password"
					}
				},
				messages : {
					username : {
						required : icon + "请输入您的原始密码",
						minlength : icon + "密码必须6个字符以上"
					},
					new_password : {
						required : icon + "请输入您的新密码",
						minlength : icon + "密码必须6个字符以上"
					},
					re_password : {
						required : icon + "请输入您的新密码确认",
						minlength : icon + "密码必须6个字符以上",
						equalTo : "两次密码输入不一致"
					},
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
