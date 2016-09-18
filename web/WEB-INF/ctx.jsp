<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" />
--%>
<!-- easyui 主题 -->
<link rel="stylesheet" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<!-- easyui 图标 -->
<link rel="stylesheet" href="${ctx}/static/easyui/themes/icon.css" />
<link rel="stylesheet" href="${ctx}/static/easyui/themes/icons.css" />
<link rel="stylesheet" href="${ctx}/static/easyui/themes/icon-standard.css" />
<!-- JQuery -->
<script type="text/javascript" src="${ctx}/static/easyui/jquery.min.js"></script>
<!-- easyui -->
<script type="text/javascript" src="${ctx}/static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/easyui/easyui-lang-zh_CN.js"></script>
<!-- easyui扩展JS -->
<script type="text/javascript" src="${ctx}/static/easyui/easyui-util.js"></script>
<%--自己写的JS--%>
<script type="text/javascript" src="${ctx}/static/easyui/util.js"></script>

<script>
    window.ctx = "${ctx}";
</script>
<style>
    td{
        font-size: 12px;
        height: 18px;
        line-height: 18px;
        margin: 0;
        overflow: hidden;
        padding: 0 4px;
        white-space: nowrap;
        word-wrap: normal;
    }
</style>





