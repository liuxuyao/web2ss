<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../../include/base.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${ctx}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>港口管理</title>
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
            <h5>码头列表</h5>
            <div class="ibox-tools"></div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <!-- Example Toolbar -->
                        <div class="example-wrap">
                            <form role="form" class="form-inline"
                                  action="javascript:void(0);">
                                <div class=" hidden-xs form-inline" id="portToolbar" role="group">
                                    <div class="form-group">
                                        <input type="text" placeholder="码头名称" id="portName"
                                               class="form-control">
                                    </div>
                                    <button class="btn btn-primary" style="margin-bottom:0px;"
                                            title="查询" type="submit" onclick="searchPort();">
                                        <i class="fa fa-search" aria-hidden="true"></i> 查询
                                    </button>
                                    <button type="button" class="btn  btn-primary" style="margin-bottom:0px;"
                                            title="添加" onclick="addPort();">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                        添加
                                    </button>
                                    <button type="button" class="btn  btn-primary" title="修改"
                                            style="margin-bottom:0px;" onclick="updatePort();">
                                        <i class="glyphicon glyphicon-edit" aria-hidden="true"></i>
                                        修改
                                    </button>
                                    <button type="button" class="btn  btn-primary" title="删除"
                                            style="margin-bottom:0px;" onclick="deletePort();">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                        删除
                                    </button>
                                    <button type="button" class="btn  btn-primary" title="上传码头LOGO"
                                            style="margin-bottom:0px;" onclick="uploadPic();">
                                        <i class="glyphicon glyphicon-picture" aria-hidden="true"></i>
                                        上传码头LOGO
                                    </button>
                                    <button type="button" class="btn  btn-primary" title="上传码头堆场位置"
                                            style="margin-bottom:0px;" onclick="uploadPorsition();">
                                        <i class="glyphicon glyphicon-picture" aria-hidden="true"></i>
                                        上传码头堆场位置
                                    </button>
                                </div>
                            </form>
                            <table id="port_table" data-mobile-responsive="true">
                            </table>
                        </div>
                    </div>
                    <!-- End Example Toolbar -->
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
    var portQueryParams = function (params) {
        var temp = {
            c_port_nam: $("#portName").val()
        }
        return $.extend(params, temp);
    }
    $(function () {
        $('#port_table')
                .bootstrapTable(
                        {
                            url: '${ctx}/port/query',
                            method: 'post',
                            pagination: true,
                            pageList: [10, 20],
                            pageSize: 10,
                            pageNumber: 1,
                            striped: true,
                            sortable: true,
                            search: false,
                            showToggle: false,
                            contentType: "application/x-www-form-urlencoded",
                            sidePagination: 'server',
                            queryParams: portQueryParams,//参数
                            showColumns: false,
                            showRefresh: false,
                            minimumCountColumns: 2,
                            singleSelect: true,
                            clickToSelect: true,
                            smartDisplay: true,
                            columns: [
                                {
                                    checkbox: true
                                },
                                {
                                    field: 'id',
                                    title: 'ID',
                                    align: 'center',
                                    width: '120',
                                    visible: false
                                },
                                {
                                    field: 'port_cod',
                                    title: '码头代码',
                                    align: 'center',
                                    width: '120',
                                    valign: 'middle'
                                },
                                {
                                    field: 'c_port_nam',
                                    title: '码头中文名',
                                    align: 'center',
                                    width: '120',
                                    valign: 'middle'
                                },
                                {
                                    field: 'e_port_nam',
                                    title: '码头英文名',
                                    align: 'center',
                                    width: '120',
                                    valign: 'middle'
                                },
                                {
                                    field: 'create_user',
                                    title: '创建人',
                                    align: 'center',
                                    width: '120',
                                    valign: 'middle'
                                },
                                {
                                    field: 'create_time',
                                    title: '创建时间',
                                    align: 'center',
                                    width: '120',
                                    valign: 'middle'
                                },
                                {
                                    field: 'save_file_name',
                                    title: '码头LOGO',
                                    align: 'center',
                                    width: '120',
                                    formatter: function (value, row, index) {
                                        if (typeof(value) != "undefined") {
                                            return '<img src="${ctx}/upfile/' + value + '" width="98%" height="50" />';
                                        } else {
                                            return "";
                                        }
                                    }
                                },
                                {
                                    filed:'',
                                    title:'堆场位置',
                                    align: 'center',
                                    width: '120',
                                    formatter:function(value,row,index){
                                        return '<button  onclick="queryPorsition();"  class="btn btn-primary">查看</button>'
                                    }
                                }
                            ],
                            toolbar: '#portToolbar',
                            iconSize: 'outline',
                            icons: {
                                refresh: 'glyphicon-repeat',
                                toggle: 'glyphicon-list-alt',
                                columns: 'glyphicon-list'
                            }
                        });
    });
    // 查询
    function searchPort() {
        $('#port_table').bootstrapTable('refresh', portQueryParams);
    }
    //添加
    function addPort() {
        parent.layer.open({
            type: 2,
            title: '添加',
            shadeClose: true,
            maxmin: true,
            area: ['500px', '450px'],
            content: ['${ctx}/port/addPage', 'no'],
            end: function () {
                searchPort();
            }
        })
    }
    //更新
    function updatePort() {
        var select = $('#port_table').bootstrapTable('getSelections');
        if (select.length != 1) {
            parent.layer.alert('请选择一条记录！', {
                icon: 5
            });
            return;
        }
        parent.layer.open({
            type: 2,
            title: '用户编辑',
            shadeClose: true,
            shade: 0.6,
            maxmin: true,
            area: ['500px', '450px'],
            content: ['${ctx}/port/update/' + select[0].id, 'no'],
            end: function () {
                searchPort();
            }
        });
    }
    //删除
    function deletePort() {
        var select = $('#port_table').bootstrapTable('getSelections');
        if (select.length != 1) {
            parent.layer.alert('请选择一条记录！', {
                icon: 5
            });
            return;
        }
        parent.layer.confirm('确定删除吗？', {
            title: "提示",
            btn: ['确定', '取消'] //按钮
        }, function () {
            $.ajax({
                type: "get", //提交方式
                url: "${ctx}/port/delete/" + select[0].ID,//路径
                data: {},//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    parent.layer.msg('删除成功！', {
                        icon: 1,
                        time: 2000
                    }, function () {
                        parent.layer.closeAll();
                    });
                    searchPort();
                }
            });
        }, function () {
            parent.layer.closeAll();
        });
    }
    //码头LOGO上传
    function uploadPic() {
        var select = $('#port_table').bootstrapTable('getSelections');
        if (select.length != 1) {
            parent.layer.alert('请选择一条记录！', {
                icon: 5
            });
            return;
        }
        parent.layer.open({
            type: 2,
            title: '码头LOGO上传',
            shadeClose: true,
            shade: 0.6,
            maxmin: true,
            area: ['500px', '360px'],
            content: ['${ctx}/port/upload/' + select[0].id, 'no'],
            end: function () {
                searchPort();
            }
        })
    }
    //上传码头堆场位置图片
    function uploadPorsition(){
        var select=$("#port_table").bootstrapTable('getSelections');
        if(select.length!=1){
            parent.layer.alert('请选择一条记录', {
                icon: 5
            });
            return;
        }
        parent.layer.open({
            type:2,
            title:'堆场位置图片上传',
            shadeClose:true,
            shade:0.6,
            maxmin:true,
            area: ['500px', '500px'],
            content: ['${ctx}/port/uploadYard/' + select[0].id, 'no'],
            end:function(){
                searchPort();
            }
        })
    }
    //堆场图片查看
    function queryPorsition(){
        var select=$("#port_table").bootstrapTable('getSelections');
        if(select.length!=1){
            parent.layer.alert('请选择一条记录', function () {
                icon:5
            });
            return;
        }
        parent.layer.open({
            type:2,
            title:'堆场图片',
            shadeClose:false,
            shade:0.6,
            maxmin:true,
            area: ['500px', '500px'],
            content: ['${ctx}/port/uploadYardLook/' + select[0].id, 'no'],
            end:function(){
                searchPort();
            }
        })
    }
</script>
</body>
</html>
