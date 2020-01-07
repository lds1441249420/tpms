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
        function submitInfo(username) {
            var oldPwd = $("#oldPwd").val();
            var newPwd = $("#newPwd").val();
            var rePwd = $("#rePwd").val();

            if (oldPwd == '' || newPwd == '' || rePwd == '') {
                $("#userInfo").html("密码不能为空！");
                return;
            }
            ;

            if (newPwd != rePwd) {
                $("#userInfo").html("两次密码输入不一致！");
                return;
            }
            ;

            $.post(
                "${APP_PATH}/login/checkPwd",
                {"username": username, "password": oldPwd},
                function (data) {
                    var usernameInfo = "";
                    if (data == '0') {
                        usernameInfo = "此用户不存在！";
                    }
                    ;
                    if (data == '1') {
                        usernameInfo = "旧密码错误！";
                    }
                    ;
                    if (data == '2') {
                        $("#updatePwd_form").submit();
                    }
                    ;
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
                <form id="updatePwd_form" class="form-horizontal" action="${APP_PATH}/info/updatePwd" method="post">
                    <div class="form-group">
                        <label for="oldPwd" class="col-sm-3 control-label">旧密码：</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="oldPwd" id="oldPwd"
                                   placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="newPwd" class="col-sm-3 control-label">新密码：</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="newPwd" id="newPwd"
                                   placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="rePwd" class="col-sm-3 control-label">确认新密码：</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="rePwd" id="rePwd" placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="rePwd" class="col-sm-9 control-label"></label>
                        <div class="col-sm-9">
                            <h4 style="color: orangered" id="userInfo">
                                <c:if test="${msg!=null}">
                                    ${msg}
                                </c:if>
                            </h4>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-10">
                            <button type="button" onclick="submitInfo('${employee.empNo}')" class="btn btn-default">确定
                            </button>
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
