<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../include/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<base href="${ctx}">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>用户管理</title>
<meta name="keywords" content="用户管理">
<meta name="description" content="用户管理">
<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/static/bootstrap/css/bootstrap.min.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/font-awesome.css?v=4.4.0"
	rel="stylesheet">
<link
	href="${ctx}/static/bootstrap/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/animate.css" rel="stylesheet">
<link href="${ctx}/static/bootstrap/css/style.css?v=4.1.0"
	rel="stylesheet">
<!-- Sweet Alert -->
<link
	href="${ctx}/static/bootstrap/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>用户列表</h5>
				<div class="ibox-tools"></div>
				<div class="ibox-content">
					<div class="row row-lg">
						<div class="col-sm-12">
							<!-- Example Toolbar -->
							<div class="example-wrap">
								<form role="form" class="form-inline"
									action="javascript:void(0);">
									<div class="form-group">
										<label for="username" class="sr-only">用户名</label> <input
											type="text" placeholder="用户名" id="username"
											class="form-control">
									</div>
									
									<button class="btn btn-primary" style="margin-bottom:0px;"
										type="submit" onclick="searchUser();">
										<i class="fa fa-search" aria-hidden="true"></i> 查询
									</button>
								</form>
								<div class="example">
									<div class=" hidden-xs" id="exampleToolbar" role="group">
										<!--	<button type="button" class="btn  btn-primary" title="添加"
												onclick="addUser();">
												<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
												添加
											</button>
										<button type="button" class="btn  btn-primary" title="修改"
											onclick="updateUser();">
											<i class="glyphicon glyphicon-edit" aria-hidden="true"></i>
											修改
										</button>    -->
										<button type="button" class="btn  btn-primary" title="查看"
											onclick="viewUser();">
											<i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i>
											查看
										</button>
										<button type="button" class="btn  btn-primary" title="删除"
											onclick="deleteUser();">
											<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
											删除
										</button>
									</div>
									<table id="user_table" data-mobile-responsive="true">
									</table>
								</div>
							</div>
							<!-- End Example Toolbar -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 全局js -->
	<script src="${ctx}/static/bootstrap/js/jquery.min.js?v=2.1.4"></script>
	<script src="${ctx}/static/bootstrap/js/plugins/layer/layer.min.js"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.6"></script>

	<!-- 自定义js -->
	<script src="${ctx}/static/bootstrap/js/content.js?v=1.0.0"></script>


	<!-- Bootstrap table -->
	<script
		src="${ctx}/static/bootstrap/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="${ctx}/static/bootstrap/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="${ctx}/static/bootstrap/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<!-- Peity -->
	<!-- Sweet alert -->
	<script
		src="${ctx}/static/bootstrap/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script>
	//带参到后台去得参数
		var userQuaeryParams = function(params) {
			var temp = {
				username : $("#username").val()
			}
			return $.extend(params, temp);
		}

		$(function() {
			$('#user_table')
					.bootstrapTable(
							{
								url : '${ctx}/user/list',
								method : 'post',
								pagination : true,//设置为 true 会在表格底部显示分页条
								pageList : [ 10, 20 ],//设置可供选择的页面数据条数
								pageSize : 10,//页面数据条数
								pageNumber : 1,//首页页码
								striped : true,//设置为 true 会有隔行变色效果
								sortable : true,//该列是否排序（表头显示双箭头）
								search : false,//是否启用搜索框
								showRefresh : true,//是否显示 刷新按钮
								showToggle : true,//是否显示 切换试图（table/card）按钮
								showColumns : true,//是否显示 内容列下拉框
								contentType : "application/x-www-form-urlencoded",//发送到服务器的数据编码类型
								sidePagination : 'server',//设置在哪里进行分页，设置 ‘server’时，必须设置 服务器数据地址（url）或者重写ajax方法
								queryParams : userQuaeryParams,//参数
								showRefresh : true,
								minimumCountColumns : 2,
								clickToSelect : true,
								smartDisplay : true,//设置为 true可以在分页和卡片视图快速切换po
								columns : [
										{
											checkbox : true
										},
										{
											field : 'id',
											title : 'ID',
											width : '50',
											visible : false
										},
										{
											field : 'username',
											title : '用户名',
											align : 'center',
											width : '120',
											sortable : true,
											valign : 'middle'
										},
										 {
											field : 'createtime',
											title : '创建(注册)时间',
											align : 'center',
											width : '120',
											valign : 'middle',
											sortable : true,
										} ],
								toolbar : '#exampleToolbar',
								iconSize : 'outline',
								icons : {
									refresh : 'glyphicon-repeat',
									toggle : 'glyphicon-list-alt',
									columns : 'glyphicon-list'
								}
							});
		});
		function searchUser() {
			$('#user_table').bootstrapTable('refresh', userQuaeryParams);
		}
		function addUser() {
			parent.layer.open({
				type : 2,
				title : '用户编辑',
				shadeClose : true,
				shade : 0.6,
				maxmin : true, //开启最大化最小化按钮
				area : [ '500px', '500px' ],
				content : '${ctx}/user/add',
				end : function() {
					searchUser();
				}
			});
		}
		function updateUser() {
			var select = $('#user_table').bootstrapTable('getSelections');
			if (select.length != 1) {
				parent.layer.alert('请选择一条记录！', {
					icon : 5
				});
				return;
			}
			parent.layer.open({
				type : 2,
				title : '用户编辑',
				shadeClose : true,
				shade : 0.6,
				maxmin : true, //开启最大化最小化按钮
				area : [ '500px', '500px' ],
				content : '${ctx}/user/update/' + select[0].id,
				end : function() {
					searchUser();
				}
			});
		}
		function viewUser() {
			var select = $('#user_table').bootstrapTable('getSelections');
			if (select.length != 1) {
				parent.layer.alert('请选择一条记录！', {
					icon : 5
				});
				return;
			}
			parent.layer.open({
				type : 2,
				title : '用户详情',
				shadeClose : true,
				shade : 0.6,
				maxmin : true, //开启最大化最小化按钮
				area : [ '500px', '500px' ],
				content : '${ctx}/user/get/' + select[0].id
			});
		}
		function viewRole() {
			var select = $('#user_table').bootstrapTable('getSelections');
			if (select.length != 1) {
				parent.layer.alert('请选择一条记录！', {
					icon : 5
				});
				return;
			}
			parent.layer.open({
				type : 2,
				title : '角色选择',
				skin : 'layui-layer-rim', //加上边框
				area : [ '700px', '500px' ], //宽高
				fix : false, //不固定
				content : '${ctx}/role/select/' + select[0].id

			});

		}

		function deleteUser() {
			var select = $('#user_table').bootstrapTable('getSelections');
			if (select.length != 1) {
				parent.layer.alert('请选择一条记录！', {
					icon : 5
				});
				return;
			}
			swal({
				title : "您确定要删除这条信息吗",
				text : "删除后将无法恢复，请谨慎操作！",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "是的，我要删除！",
				cancelButtonText : "让我再考虑一下…",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						type : "get", //提交方式   
						url : "${ctx}/user/delete/" + select[0].id,//路径   
						data : {
							"org.id" : "${org.id}"
						},//数据，这里使用的是Json格式进行传输   
						success : function(result) {//返回数据根据结果进行相应的处理   
							swal("删除成功！", "您已经永久删除了这条信息。", "success");
							searchUser();
						}
					});
				} else {
					swal("已取消", "您取消了删除操作！", "error");
				}
			});
		}
	</script>
</body>