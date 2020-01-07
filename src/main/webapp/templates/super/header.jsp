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
<script type="text/javascript">
    function logOut() {
        window.location.href = "${APP_PATH}/login/logout";
    }
</script>
<body>
<div class="col-md-12">

    <div class="col-md-2"><img  class="img-rounded" src="${APP_PATH}/static/favicon.png"/></div>
    <div class="col-md-8">
        <div class="page-header">

            <c:if test="${employee.empType == 'super'}">
                <h1>超级管理员：<small>${employee.empName}</small></h1>
            </c:if>

            <c:if test="${employee.empType == 'admin'}">
                <h1>项目经理：<small>${employee.empName}</small></h1>
            </c:if>

            <c:if test="${employee.empType == 'staff'}">
                <h1>员工：<small>${employee.empName}</small></h1>
            </c:if>
        </div>
    </div>
    <div class="col-md-2">
        <button type="button" class="btn btn-info" onclick="logOut()">登出</button>
    </div>
</div>
</body>

</html>
