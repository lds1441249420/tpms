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
        function submitInfo() {
            var deptName = $("#deptName").val();

            if (deptName == '') {
                $("#userInfo").html("部门名称不能为空！");
                return;
            };

            $.post(
                "${APP_PATH}/dept/checkName",
                {"deptName": deptName},
                function (data) {
                    var usernameInfo = "";
                    if (data == '1') {
                        usernameInfo = "此部门已存在！";
                    };
                    if (data == '0') {
                        $("#updatePwd_form").submit();
                    };
                    $("#userInfo").html(usernameInfo);
                },
                "json"
            );
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
        <div id="context" class="col-md-8" style="height: 100%;">
            <div class="col-md-2"></div>
            <div class="col-md-10" style="margin-top: 10%">
                <form id="updatePwd_form" class="form-horizontal" action="${APP_PATH}/dept/updateDept?deptId=${dept.deptId}" method="post">

                    <div class="form-group">
                        <label for="deptName" class="col-sm-2 control-label">部门名称：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="deptName" id="deptName" placeholder="${dept.deptName}" value="${dept.deptName}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="deptDesc" class="col-sm-2 control-label">部门描述：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="deptDesc" id="deptDesc" placeholder="${dept.deptDesc}" value="${dept.deptDesc}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <h4 style="color: orangered" id="userInfo">
                                <c:if test="${msg!=null}">
                                    ${msg}
                                </c:if>
                            </h4>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" onclick="submitInfo()" class="btn btn-default">确定</button>
                        </div>
                    </div>
                </form>
            </div>


        </div>
    </div>
</div>
<div class="col-md-2" style="height: 100%"></div>
</body>
</html>
