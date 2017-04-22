<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../../include/base.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${ctx}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑码头</title>
    <meta name="keywords" content="编辑码头">
    <meta name="description" content="编辑码头">

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
                    <h5>码头编辑</h5>
                    <div class="ibox-tools"></div>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t" id="portForm" method="post" action="${ctx }/port/${method}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">码头代码：</label>
                            <div class="col-sm-8">
                                <input id="port_cod" name="port_cod" class="form-control" type="text"
                                       value="${cPort.port_cod}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">码头中文名：</label>
                            <div class="col-sm-8">
                                <input id="c_port_nam" name="c_port_nam" class="form-control" type="text"
                                       value="${cPort.c_port_nam }">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">码头英文名：</label>
                            <div class="col-sm-8">
                                <input id="e_port_nam" name="e_port_nam" class="form-control" type="text"
                                       value="${cPort.e_port_nam }">
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
<script src="${ctx}/static/bootstrap/js/plugins/form/jquery.fom.js"></script>
<script src="${ctx}/static/bootstrap/js/plugins/layer/layer.min.js"></script>

<script>
    $(function () {
        var icon = "<i class='fa fa-times-circle'></i> ";
        $("#portForm").validate({
            onsubmit: true,// 是否在提交时验证
            submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form
                parent.layer.load();
                $(form).ajaxSubmit({
                    success: function (result) {
                        layer.closeAll();
                        if (result == "success") {
                            parent.layer.msg('保存成功！', {
                                icon: 1,
                                time: 2000
                            }, function () {
                                parent.layer.closeAll();
                            });
                        } else {
                            parent.layer.alert("系统异常，请联系管理员！", {
                                icon: 5
                            });
                        }
                    }, error: function (data) {
                        layer.closeAll();
                        parent.layer.alert(data, {
                            icon: 5
                        });
                    }
                });
            },
            rules: {
                port_cod: {
                    required: true
                },
                c_port_nam: {
                    required: true
                },
                e_port_nam: {
                    required: true
                }
            },
            messages: {
                port_cod: {
                    required: icon + '请输入码头代码'
                },
                c_port_nam: {
                    required: icon + '请输入码头中文名'
                },
                e_port_nam: {
                    required: icon + '请输入码头英文名'
                }
            }
        });
        $("#portForm").validate({
            onsubmit: false,// 是否在提交时验证
            onfocusout: true,
            rules: {
                port_cod: {
                    required: true
                },
                c_port_nam: {
                    required: true
                },
                e_port_nam: {
                    required: true
                }
            },
            messages: {
                port_cod: {
                    required: icon + '请输入码头代码'
                },
                c_port_nam: {
                    required: icon + '请输入码头中文名'
                },
                e_port_nam: {
                    required: icon + '请输入码头英文名'
                }
            }
        });
    });
</script>
</body>
</html>
