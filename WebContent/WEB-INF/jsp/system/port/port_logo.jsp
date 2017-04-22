<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../../include/base.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${ctx}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>码头LOGO上传</title>
    <meta name="keywords" content="码头LOGO上传">
    <meta name="description" content="码头LOGO上传">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/static/bootstrap/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/static/bootstrap/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${ctx}/static/bootstrap/css/animate.css" rel="stylesheet">
    <link href="${ctx}/static/bootstrap/css/style.css?v=4.1.0" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${ctx}/static/bootstrap/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <link rel="stylesheet" href="${ctx}/static/bootstrap/js/plugins/webuploader/webuploader.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap/css/demo/webuploader-demo.css"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content" style="padding:0;">
                    <form class="form-horizontal m-t" id="imgForm" method="post" action="">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div id="uploader" class="wu-example">
                                    <div class="queueList">
                                        <div id="dndArea" class="placeholder"
                                             style="min-height: 160px;padding-top: 138px;">
                                            <%-- <div id="filePicker" class="webuploader-container">
                                                 <div class="webuploader-pick" onclick="javascript:$('#inputFile').click();">点击选择图片</div>--%>
                                            <%--<div style="position: absolute; top: 0px; left: 423px; width: 168px; height: 44px; overflow: hidden; bottom: auto; right: auto;">
                                                <input type="file" id="inputFile" name="inputFile" class="webuploader-element-invisible"
                                                       accept="image/*" onchange="javasdcript:uploadFile();"/>
                                                <label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
                                            </div>
                                        </div>--%>
                                            <p id="uploadInfo">请上传码头logo</p>
                                        </div>
                                    </div>
                                </div>
                                <input type="file" id="inputFile" name="inputFile" class="form-control hide"
                                       accept="image/*" onchange="javasdcript:uploadFile();"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12" style="margin-left:20px;">
                                <button id="uploadBtn" type="button" class="btn  btn-primary" title="选择图片"
                                        style="margin-bottom:0px;"
                                        onclick="javascript:$('#inputFile').click();">
                                    <i class="glyphicon glyphicon-upload" aria-hidden="true" id="buttonInfo"></i> 选择图片
                                </button>
                            </div>
                        </div>
                        <input type="hidden" id="portId" name="portId" value="${portId}"/>
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

<!-- iCheck -->
<script src="${ctx}/static/bootstrap/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/static/bootstrap/js/plugins/layer/layer.min.js"></script>
<script src="${ctx}/static/bootstrap/js/ajaxfileupload.js"></script>
<script src="${ctx}/static/bootstrap/js/plugins/webuploader/webuploader.js"></script>
<script>
    $(document).ready(function () {
        if ("${logoUrl}" != null && "${logoUrl}" != "null" && "${logoUrl}" != "") {
            $("#dndArea").css({
                "background-image": "url(${ctx}/upfile/${logoUrl}",
                "background-size": "auto"
            });
            $("#uploadInfo").html("");
            $("#uploadBtn").html("<i class='glyphicon glyphicon-upload' aria-hidden='true' ></i> 更换图片");
        }
    });
    // 上传
    function uploadFile() {
    	debugger
        var portId = $("#portId").val();
        var file = $("#inputFile").val();
        if (file != "" && file != null) {
            var loader = parent.layer.load();
            
            $.ajaxFileUpload({
                url: "${ctx}/port/uploadLogo",
                type: "post",
                data: {
                    portId: portId
                },
                secureuri: false,
                fileElementId: 'inputFile',//file标签的id
                dataType: 'json',//返回数据的类型
                success: function (data) {
                    parent.layer.close(loader);
                    console.log(data+"========");
                    debugger
                    if (data != null) {
                        if (data.split(";").length > 1 && data.split(";")[0] == "success") {
                            $("#dndArea").css({
                                "background-image": "url(${ctx}/upfile/" + data.split(";")[1],
                                "background-size": "cover"
                            });
                            $("#uploadInfo").html("");
                            $("#uploadBtn").html("<i class='glyphicon glyphicon-upload' aria-hidden='true' ></i> 更换图片");
                            parent.layer.msg('上传成功！', {
                                icon: 1,
                                time: 2000
                            }, function () {
                                $("#inputFile").val("");
                            });
                        } else {
                            $("#dndArea").css({
                                "background-image": "url(${ctx}/static/bootstrap/img/webuploader.png",
                                "background-size": "auto"
                            });
                            $("#uploadInfo").html("请上传码头logo");
                            $("#uploadBtn").html("<i class='glyphicon glyphicon-upload' aria-hidden='true' ></i> 选择图片");
                            if (data == "fileError") {
                                parent.layer.msg('上传文件为空！', {
                                    icon: 2,
                                    time: 2000
                                }, function () {
                                    $("#inputFile").val("");
                                });
                            } else if (data == "portError") {
                                parent.layer.msg('查询码头失败！', {
                                    icon: 2,
                                    time: 2000
                                }, function () {
                                    $("#inputFile").val("");
                                });
                            } else if (data == "oldFileError") {
                                parent.layer.msg('删除原logo文件失败！', {
                                    icon: 2,
                                    time: 2000
                                }, function () {
                                    $("#inputFile").val("");
                                });
                            } else if (data == "uploadError") {
                                parent.layer.msg('上传失败！', {
                                    icon: 2,
                                    time: 2000
                                }, function () {
                                    $("#inputFile").val("");
                                });
                            }
                        }
                    }
                }, error: function (data) {
                	//parent.layer.close(loader);
                	console.log(data);
                	console.log("==========");
                	parent.layer.closeAll();
                    parent.layer.alert(data, {
                        icon: 2
                    }); 
                }
            });
        } else {
            parent.layer.alert('请选择要上传的文件！', {
                icon: 2
            });
        }
    }
    // 初始化Web Uploader
    //var uploader = WebUploader.create({});

</script>
</body>
</html>