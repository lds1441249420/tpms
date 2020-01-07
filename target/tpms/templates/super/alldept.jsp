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
    <title>Super Page</title>
    <link rel="icon" href="${APP_PATH}/static/favicon.png" type="image/x-icon">
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap-theme.min.css" type="text/css">
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function delDept(deptId, deptName) {
            var answer = confirm("确定删除" + deptName + "吗？");
            if (answer == false) {
                return;
            } else {
                $.post(
                    "${APP_PATH}/dept/deptIsExist",
                    {"deptId": deptId},
                    function (data) {
                        if (data == '1') {
                            alert("删除失败，此部门还有员工！")
                        } else {
                            window.location.href = "${APP_PATH}/dept/delDept?deptId=" + deptId;
                        }
                    },
                    "json"
                );
            }
        }

        function updateDept(deptId) {
            window.location.href="${APP_PATH}/show/showEditDept?deptId=" + deptId;
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
            <div class="col-md-10" style="margin-top: 10%">
                <table class="table table-hover" style="table-layout:fixed;">
                    <thead>
                    <tr>
                        <th width="10%">ID</th>
                        <th width="15%">部门名称</th>
                        <th width="15%">部门经理</th>
                        <th width="40%">部门描述</th>
                        <th width="20%" colspan="2" class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${depts}" var="dept">
                        <tr>
                            <th scope="row">${dept.deptId}</th>
                            <td>${dept.deptName}</td>
                            <td>${dept.empNo}</td>
                            <td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${dept.deptDesc}</td>
                            <td class="text-center">
                                <button type="button" class="btn btn-info" onclick="updateDept(${dept.deptId})">修改
                                </button>
                            </td>
                            <td class="text-center">
                                <button type="button" class="btn btn-danger" onclick="delDept('${dept.deptId}','${dept.deptName}')">删除</button>
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
