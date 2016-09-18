<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${ctx}/static/css/amazeui.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/style.css">
</head>
<body>
<header class="am-topbar">
    <div class="am-topbar-brand" style="">
        <h2>景德镇民窑博物馆后台管理系统</h2>
    </div>
</header>
<div class="login-cont" id="loginCont">
    <div class="login-box">
        <div class="login-box-top">
            <span>管理员登录</span>
        </div>
        <form action="${ctx}/login" method="post">
            <ul class="login-cont-inp">
                <li class="l1">
                    <input type="text" required placeholder="请输入用户名" name="username" value="${username}">
                </li>
                <li class="l2">
                    <input type="password" required placeholder="请输入密码" name="password">
                </li>
                <c:if test="${not empty msg}">
                    <li class="l3" style="color: red;">${msg}</li>
                </c:if>
                <li class="l4">
                    <button type="submit" class="am-btn1 am-btn-primary">登录</button>
                </li>
            </ul>
        </form>
    </div>
</div>

<script type="text/javascript">
    // 控制屏幕自适应高度
    var flowShow = document.getElementById("loginCont");
    document.body.style.height = view().h + "px";
    flowShow.style.height = document.body.style.height = view().h - 100 + "px";
    function view() {
        return {
            w: document.documentElement.clientWidth,
            h: document.documentElement.clientHeight
        };
    }
</script>
</body>
</html>