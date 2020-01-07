<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LDS
  Date: 2019/11/26
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="icon" href="${APP_PATH}/static/images/favicon.png" type="image/x-icon">
    <script type="text/javascript" src="static/js/jquery-3.4.1.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" type="text/css">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap-theme.min.css" type="text/css">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>



</head>
<body>
<div class="row" style="height: 15%;width: 100%;background-color: #00bbee">
    <div class="col-md-12">.col-md-1</div>
</div>
<div class="row" style="height: 85%;width: 100%">
    <div class="col-md-2" style="background-color: #00ff6b;height: 100%">

    </div>
    <div class="col-md-10" style="background-color: #9acfea;height: 100%">.col-md-8</div>
</div>
</body>
</html>
