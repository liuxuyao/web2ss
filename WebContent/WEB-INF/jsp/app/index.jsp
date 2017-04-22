<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../include/base.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${ctx}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>HD开发平台_后台管理</title>
    <meta name="keywords" content="后台管理">
    <meta name="description" content="后台管理">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->

    <link rel="shortcut icon" href="${ctx}/favicon.ico"> 
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/static/bootstrap/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/static/bootstrap/css/animate.css" rel="stylesheet">
    <link href="${ctx}/static/bootstrap/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close">
            <i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle" src="${ctx}/static/bootstrap/img/profile_small.jpg"/></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span class="clear"> <span
                                class="block m-t-xs"><strong class="font-bold">${user.username }</strong></span> 
							</span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="J_menuItem" href="${ctx}/user/forPassword">修改密码</a></li>
                            <li class="divider"></li>
                            <li><a href="${ctx}/admin/logout">安全退出</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">E</div>
                </li>
                <li><a href="${ctx}/user/list">用户管理</a></li>
                <li><a href="${ctx}/port/forList">码头管理</a></li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="javascript:void(0);"><i
                            class="fa fa-bars"></i> </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#"> <i
                            class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                    </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li class="m-t-xs">
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left"> <img alt="image" class="img-circle"
                                                                                   src="${ctx}/static/bootstrap/img/a7.jpg">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46小时前</small>
                                        <strong>小四</strong> 这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？ <br>
                                        <small class="text-muted">3天前 2014.11.8</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left"> <img alt="image" class="img-circle"
                                                                                   src="${ctx}/static/bootstrap/img/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">25小时前</small>
                                        <strong>国民岳父</strong> 如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶 <br>
                                        <small class="text-muted">昨天</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="mailbox.html"> <i class="fa fa-envelope"></i> <strong>
                                        查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#"> <i
                            class="fa fa-bell"></i> <span class="label label-primary">8</span>
                    </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li><a href="mailbox.html">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息 <span
                                        class="pull-right text-muted small">4分钟前</span>
                                </div>
                            </a></li>
                            <li class="divider"></li>
                            <li><a href="profile.html">
                                <div>
                                    <i class="fa fa-qq fa-fw"></i> 3条新回复 <span
                                        class="pull-right text-muted small">12分钟钱</span>
                                </div>
                            </a></li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="notifications.html"> <strong>查看所有 </strong> <i
                                            class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft">
                <i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:void(0);" class="active J_menuTab" data-id="${ctx }/admin/main">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight">
                <i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">
                    关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a></li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
                </ul>
            </div>
            <a href="${ctx}/admin/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/admin/main" frameborder="0"
                    data-id="${ctx}/admin/main" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">
                &copy; 2017
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
</div>

<!-- 全局js -->
<script src="${ctx}/static/bootstrap/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/static/bootstrap/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/static/bootstrap/js/plugins/layer/layer.min.js"></script>
<script src="${ctx}/static/bootstrap/js/plugins/layer/extend/layer.ext.js"></script>

<!-- 自定义js -->
<script src="${ctx}/static/bootstrap/js/hplus.js?v=4.1.0"></script>
<script type="text/javascript" src="${ctx}/static/bootstrap/js/contabs.js"></script>

<!-- 第三方插件 -->
<script src="${ctx}/static/bootstrap/js/plugins/pace/pace.min.js"></script>

</body>

</html>