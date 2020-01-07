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
            var empName = $("#empName").val();
            var password = $("#password").val();
            var empSex = $("#empSex").val();
            var deptId = $("#selectDept").val();
            var empNo = $("#empNo").val();

            if (empName == '' || password == '' || deptId == 0) {
                alert("请补充完整信息！");
                return;
            }
            ;

            window.location.href = "${APP_PATH}/emp/addEmp?empName=" + encodeURI(encodeURI(empName)) + "&password=" + password + "&empSex=" + empSex + "&deptId=" + deptId + "&empNo=" + empNo;
        }

        function genEmpNoByDeptId() {

            var deptId = $("#selectDept").val();
            if (deptId == '0') {
                $("#empNo").val('');
                $("#empNo").placeholder = "工号...";
                return;
            }
            ;
            $.ajax(
                {
                    type: "POST",
                    data: {"deptId": deptId},
                    dataType: "text",
                    url: "${APP_PATH}/emp/genEmpNoByDeptId",
                    success: function (data) {
                        $("#empNo").val(data);
                        $("#empNo").placeholder = data;
                    }
                }
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
                <form id="updatePwd_form" class="form-horizontal" action="${APP_PATH}/dept/addDept" method="post">

                    <div class="form-group">
                        <label for="empName" class="col-sm-2 control-label">员工姓名：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="deptName" id="empName" placeholder="姓名...">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码：</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" placeholder="初始密码...">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="empSex" class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-10">
                            <select name="type" id="empSex" class="form-control">
                                <option value="1">男</option>
                                <option value="0">女</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="selectDept" class="col-sm-2 control-label">从属部门：</label>
                        <div class="col-sm-10">
                            <select id="selectDept" class="form-control" onchange="genEmpNoByDeptId()">
                                <option value="0">--请选择--</option>
                                <c:forEach items="${depts}" var="dept">
                                    <option value="${dept.deptId}">${dept.deptName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="empNo" class="col-sm-2 control-label">员工号：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="deptName" id="empNo" placeholder="工号..."
                                   disabled>
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
