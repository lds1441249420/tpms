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
        function submitInfo() {
            var empName = $("#empName").val();
            var realName = $("#realName").val();
            var empSex = $('input[name="sex"]:checked').val();

            if (empName == '' || realName == '') {
                alert("请将信息填写完整！");
                return;
            };

            window.location.href = "${APP_PATH}/info/edit?empName=" + encodeURI(encodeURI(empName)) + "&realName=" + encodeURI(encodeURI(realName)) + "&empSex=" + empSex;
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
                <form class="form-horizontal" action="${APP_PATH}/info/edit" method="post">
                    <div class="form-group">
                        <label for="empName" class="col-sm-2 control-label">昵称：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName" name="empName" value="${employee.empName}"
                                   placeholder="${employee.empName}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="realName" class="col-sm-2 control-label">姓名：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="realName" name="realName" value="${employee.realName}"
                                   placeholder="${employee.realName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-10">

                            <c:if test="${employee.empSex == 1}">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="1" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="0"> 女
                                </label>
                            </c:if>

                            <c:if test="${employee.empSex != 1}">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="1"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="0" checked> 女
                                </label>
                            </c:if>
                            <h4 style="color: lightgreen" id="msg">
                                <c:if test="${msg!=null}">
                                    ${msg}
                                </c:if>
                            </h4>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" onclick="submitInfo()" class="btn btn-default">确定</button>
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
