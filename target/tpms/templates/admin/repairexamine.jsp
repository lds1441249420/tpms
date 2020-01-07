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
        function repairExamine(repairId, repairStatus) {
            window.location.href = "${APP_PATH}/att/repairExamine?repairId=" + repairId + "&repairStatus=" + repairStatus;
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
                        <th width="5%">ID</th>
                        <th width="15%">申请人</th>
                        <th width="10%">员工号</th>
                        <th width="15%">补卡日期</th>
                        <th width="10%">补卡时间</th>
                        <th width="25%">申请理由</th>
                        <th width="10%">状态</th>
                        <th width="10%" class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${allRepairs}" var="allRepair">
                        <tr>
                            <th scope="row">${allRepair.repairId}</th>
                            <td>${allRepair.repairEmpRealName}</td>
                            <td>${allRepair.repairEmpNo}</td>
                            <td>${allRepair.repairRecordDate}</td>
                            <td>${allRepair.repairRecordAt}</td>
                            <td>${allRepair.repairDesc}</td>
                            <td>
                                <c:if test="${allRepair.repairStatus == 0}">
                                    待审核
                                </c:if>
                                <c:if test="${allRepair.repairStatus == 1}">
                                    已批准
                                </c:if>
                                <c:if test="${allRepair.repairStatus == 2}">
                                    已驳回
                                </c:if>
                            </td>
                            <td class="text-center">
                                <div class="dropdown">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                        操作
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <c:if test="${allRepair.repairStatus == 1 || allRepair.repairStatus == 2}">
                                            <li class="disabled" onclick="repairExamine('${allRepair.repairId}','1')"><a>同意</a></li>
                                            <li class="disabled" onclick="repairExamine('${allRepair.repairId}','2')"><a>驳回</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li onclick="repairExamine('${allRepair.repairId}','del')"><a>删除</a></li>
                                        </c:if>
                                        <c:if test="${allRepair.repairStatus == 0}">
                                            <li onclick="repairExamine('${allRepair.repairId}','1')"><a>同意</a></li>
                                            <li onclick="repairExamine('${allRepair.repairId}','2')"><a>驳回</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li onclick="repairExamine('${allRepair.repairId}','del')"><a>删除</a></li>
                                        </c:if>
                                    </ul>
                                </div>
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
