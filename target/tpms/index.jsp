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
    <title>登录</title>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>

    <link rel="icon" href="${APP_PATH}/static/images/favicon.png" type="image/x-icon">

    <link rel="stylesheet" href="${APP_PATH}/static/css/style.css">

    <script type="text/javascript">
        function checkUser() {
            var username = $("#username").val();
            var pwd = $("#password").val();

            if (username == '') {
                $("#userInfo").html("请输入员工号！");
                return;
            }
            ;

            if (pwd == '') {
                $("#userInfo").html("请输入密码！");
                return;
            }
            ;

            $.post(
                "${APP_PATH}/login/checkPwd",
                {"username": username, "password": pwd},
                function (data) {
                    var usernameInfo = "";
                    if (data == '0' && username != "") {
                        usernameInfo = "此用户不存在！";
                    }
                    ;
                    if (data == '1') {
                        usernameInfo = "密码错误！";
                    }
                    ;
                    if (data == '2') {
                        $("#login_form").submit();
                    }
                    ;
                    $("#userInfo").html(usernameInfo);
                },
                "json"
            );
        }

    </script>

</head>
<body class="on-start document-loaded">
<main>
    <form id="login_form" class="form" action="${APP_PATH}/login/login" method="post">
        <div class="form__cover"></div>
        <div class="form__loader">
            <div class="spinner active">
                <svg class="spinner__circular" viewBox="25 25 50 50">
                    <circle class="spinner__path" cx="50" cy="50" r="20" fill="none" stroke-width="4"
                            stroke-miterlimit="10"></circle>
                </svg>
            </div>
        </div>
        <div class="form__content">
            <h1>Authorization</h1>
            <h4 style="color: #714cab" id="userInfo">
                <c:if test="${msg!=null}">
                    ${msg}
                </c:if>
            </h4>
            <div class="styled-input">
                <input type="text" id="username" class="styled-input__input" name="username">
                <div class="styled-input__placeholder">
                    <span class="styled-input__placeholder-text">员工号</span>
                </div>
                <div class="styled-input__circle"></div>
            </div>
            <div class="styled-input">
                <input type="password" id="password" name="password" class="styled-input__input">
                <div class="styled-input__placeholder">
                    <span class="styled-input__placeholder-text">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
                </div>
                <div class="styled-input__circle"></div>
            </div>
            <button type="button" id="login_submit" onclick="checkUser()" class="styled-button">
                    <span class="styled-button__real-text-holder">
                        <span class="styled-button__real-text">登&nbsp;&nbsp;&nbsp;&nbsp;录</span>
                        <span class="styled-button__moving-block face">
                            <span class="styled-button__text-holder">
                                <span class="styled-button__text">登&nbsp;&nbsp;&nbsp;&nbsp;录</span>
                            </span>
                        </span><span class="styled-button__moving-block back">
                            <span class="styled-button__text-holder">
                                <span class="styled-button__text">登&nbsp;&nbsp;&nbsp;&nbsp;录</span>
                            </span>
                        </span>
                    </span>
            </button>
        </div>

    </form>
</main>

<script src="${APP_PATH}/static/js/index.js"></script>


</body>
</html>
