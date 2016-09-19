<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="am-touch js cssanimations" style="">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>景德镇民窑博物馆后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="apple-mobile-web-app-title" content="Amaze UI">
    <link rel="stylesheet" href="${ctx}/static/css/amazeui.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/style.css">
    <script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
</head>
<body class="m-body">
<header class="am-topbar admin-header">
    <div class="am-topbar-brand">
        <small style="font-size: 20px;margin-top: 10px;">景德镇民窑博物馆后台管理系统</small>
    </div>
    <div class="am-topbar-collapse am-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
            <li>
                <a href="${ctx}/logout"><span class="am-icon-power-off"></span>退出</a>
            </li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">
    <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
        <div class="am-offcanvas-bar admin-offcanvas-bar am-offcanvas-bar-overlay">
            <ul class="am-list admin-sidebar-list" id="accordion">
                <li><a href="javascript:loadContent('user')"><span class="am-icon-user"></span> 用户管理</a></li>
                <li><a href="javascript:loadContent('message')"><span class="am-icon-envelope"></span> 用户留言管理</a></li>
                <li><a href="javascript:loadContent('myOrder')"><span class="am-icon-heart"></span> 用户预约管理</a></li>
                <li><a href="javascript:loadContent('collection')"><span class="am-icon-book"></span> 藏品介绍管理</a></li>
                <li><a href="javascript:loadContent('distribution')"><span class="am-icon-flag"></span> 遗产分布管理</a></li>
                <li><a href="javascript:loadContent('myInfo')"><span class="am-icon-newspaper-o"></span> 民窑资讯管理</a></li>
                <li><a href="javascript:loadContent('myDh')"><span class="am-icon-arrows-alt"></span> 民窑导航管理</a></li>
            </ul>
        </div>
    </div>
    <!-- sidebar end -->
    <!-- content start -->
    <div class="admin-content" id="admin-content" style="margin: 0;padding: 0;">
        <iframe src='${ctx}/user' allowTransparency='true' frameBorder='0' style='border:0;width:100%;height:99%;'></iframe>
    </div>
    <!-- content end -->
</div>

<script src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/easyui/easyui-lang-zh_CN.js"></script>
<!--<![endif]-->
<script src="${ctx}/static/js/amazeui.min.js"></script>
<script type="text/javascript">
    //自适应高度
    var flowShow = document.getElementById("admin-offcanvas");
    var adminContent = document.getElementById("admin-content");
    document.body.style.height = view().h + "px";
    flowShow.style.height = document.body.style.height = view().h - 90 + "px";
    adminContent.style.height = flowShow.style.height;
    function view() {
        return {
            w: document.documentElement.clientWidth,
            h: document.documentElement.clientHeight
        };
    }

    function loadContent(url) {
        $("#admin-content").html("<iframe src='${ctx}/" + url + "' allowTransparency='true' frameBorder='0' style='border:0;width:100%;height:99%;'></iframe>")
    }
</script>
</body>
</html>