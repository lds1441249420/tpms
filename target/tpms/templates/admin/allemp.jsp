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
    <title>Admin Page</title>
    <link rel="icon" href="${APP_PATH}/static/favicon.png" type="image/x-icon">
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap-theme.min.css" type="text/css">
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function delEmp(empId, realName) {
            var answer = confirm("确定删除" + realName + "吗？");
            if (answer == false) {
                return;
            } else {
                window.location.href = "${APP_PATH}/emp/delEmpById?empId=" + empId;
            }
        }

    </script>

</head>
<body>

<div class="col-md-2" style="height: 100%"></div>
<div class="col-md-8">
    <div class="row" style="height: 15%;width: 100%;padding: 2%">

        <jsp:include page="header.jsp"/>

    </div>
    <div class="row" style="height: 85%;">
        <div class="col-md-2" style="height: 100%;">
            <jsp:include page="tree.jsp"/>
        </div>
        <div id="context" class="col-md-10" style="height: 100%;">
            <h4 style="color: orangered" id="userInfo">
                <c:if test="${msg!=null}">
                    ${msg}
                </c:if>
            </h4>
            <div class="col-md-1"></div>
            <div class="col-md-8" style="margin-top: 10%">
                <table class="table table-hover" style="table-layout:fixed;">
                    <thead>
                    <tr>
                        <th width="10%">ID</th>
                        <th>昵称</th>
                        <th>员工号</th>
                        <th>真实姓名</th>
                        <th>性别</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${emps}" var="emp">
                        <tr>
                            <th scope="row">${emp.empId}</th>
                            <td>
                                <c:if test="${emp.empName == null}">
                                    未设置昵称
                                </c:if>
                                <c:if test="${emp.empName != null}">
                                    ${emp.empName}
                                </c:if>
                            </td>
                            <td>${emp.empNo}</td>
                            <td>${emp.realName}</td>
                            <td>
                                <c:if test="${emp.empSex == 1}">男</c:if>
                                <c:if test="${emp.empSex == 0}">女</c:if>
                            </td>
                            <td class="text-center">
                                <button type="button" class="btn btn-danger"
                                        onclick="delEmp('${emp.empId}','${emp.realName}')">删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>


        </div>
    </div>
</div>
<div class="col-md-2" style="height: 100%"></div>
</body>
</html>
