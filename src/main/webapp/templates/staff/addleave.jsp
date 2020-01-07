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
    <title>Staff Page</title>
    <link rel="icon" href="${APP_PATH}/static/favicon.png" type="image/x-icon">
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap-theme.min.css" type="text/css">
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function submitInfo() {
            var beginDay = $("#beginDay").val();
            var endDay = $("#endDay").val();
            var leaveDesc = $("#leaveDesc").val();

            if (beginDay == '') {
                alert("请设置开始日期！");
                $("#userInfo").html("更新失败！");
                return;
            }
            ;
            if (endDay == '') {
                alert("请设置结束日期！");
                $("#userInfo").html("更新失败！");
                return;
            }
            ;
            if (leaveDesc == '') {
                alert("请输入请假原因！");
                $("#userInfo").html("更新失败！");
                return;
            }
            ;
            if (beginDay > endDay) {
                alert("开始日期不能比结束日期早！");
                $("#userInfo").html("更新失败！");
                return;
            };

            $("#form1").submit();

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
                <form id="form1" class="form-horizontal" action="${APP_PATH}/att/addLeave" method="post">

                    <div class="form-group">
                        <label for="beginDay" class="col-sm-2 control-label">开始日期：</label>
                        <div class="col-sm-10">
                            <input type="date" id="beginDay" name="beginDay">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="endDay" class="col-sm-2 control-label">结束日期：</label>
                        <div class="col-sm-10">
                            <input type="date" id="endDay" name="endDay">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="selectDept" class="col-sm-2 control-label">请假类型：</label>
                        <div class="col-sm-10">
                            <select id="selectDept" class="form-control" name="leaveType">
                                <option value="病假">--病假--</option>
                                <option value="事假">--事假--</option>
                                <option value="婚假">--婚假--</option>
                                <option value="产假">--产假--</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="leaveDesc" class="col-sm-2 control-label">请假原因：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="leaveDesc" id="leaveDesc" placeholder="请假原因...">
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
