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
        function repair(date, type) {
            var desc = prompt("请输入补签申请：");
            if (desc == null) {
                return;
            }
            window.location.href = "${APP_PATH}/att/repair?dateStr=" + encodeURI(encodeURI(date)) + "&type=" + encodeURI(encodeURI(type)) + "&desc=" + encodeURI(encodeURI(desc));
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
                        <th width="30%">缺卡日期</th>
                        <th>星期</th>
                        <th>缺卡类型</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${notAttRecords}" var="notAttRecord">
                        <tr>
                            <th scope="row">${notAttRecord.notAttDate}</th>
                            <td>${notAttRecord.notAttWeek}</td>
                            <td>${notAttRecord.notAttType}</td>
                            <td class="text-center">
                                <c:if test="${notAttRecord.repairStatus == null}">
                                    <button type="button" class="btn btn-info"
                                            onclick="repair('${notAttRecord.notAttDate}','${notAttRecord.notAttType}')">申请补签
                                    </button>
                                </c:if>
                                <c:if test="${notAttRecord.repairStatus == '审核中'}">
                                    <button type="button" class="btn btn-warning" disabled="disabled">${notAttRecord.repairStatus}
                                    </button>
                                </c:if>
                                <c:if test="${notAttRecord.repairStatus == '已补卡'}">
                                    <button type="button" class="btn btn-success" disabled="disabled">${notAttRecord.repairStatus}
                                    </button>
                                </c:if>
                                <c:if test="${notAttRecord.repairStatus == '被驳回'}">
                                    <button type="button" class="btn btn-danger" disabled="disabled">${notAttRecord.repairStatus}
                                    </button>
                                </c:if>
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
