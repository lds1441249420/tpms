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
        function selRecordByDate(date) {
            if (date == '') {
                date = "${today}"
            }
            window.location.href = "${APP_PATH}/att/selRecordByDate?date=" + date;
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
            <div class="col-md-8">
                <%-- 按日期查询 --%>
                查询往日打卡记录：<input type="date" value="${today}" onchange="selRecordByDate(value)">

                <c:choose>

                    <c:when test="${flag2 == '星期一' ||flag2 == '星期二' ||flag2 == '星期三' ||flag2 == '星期四' ||flag2 == '星期五'}">
                        <c:if test="${flag1 == '上午'}">
                            <%--<P>-------------------------------------------------------------今日上班打卡-------------------------------------------------------------</P>--%>
                            <table class="table table-hover" style="table-layout:fixed;">
                                <thead>
                                <tr>
                                    <th colspan="5" class="text-center">今日上班打卡</th>
                                </tr>
                                <tr class="active">
                                    <th width="10%">ID</th>
                                    <th>打卡人</th>
                                    <th>打卡时间</th>
                                    <th>打卡类型</th>
                                    <th>打卡状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${employeesAm}" var="employee">
                                    <c:if test="${employee.attRecord.attAt == 'am' || employee.attRecord.attAt == null}">
                                        <c:if test="${employee.attRecord == null && employee.leave == null}">
                                            <tr class="danger">
                                                <th scope="row">Null</th>
                                                <td>${employee.realName}</td>
                                                <td>Null</td>
                                                <td>上班打卡</td>
                                                <td>缺勤</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord == null && employee.leave != null}">
                                            <tr class="danger">
                                                <th scope="row">Null</th>
                                                <td>${employee.realName}</td>
                                                <td>Null</td>
                                                <td>上班打卡</td>
                                                <td>请假</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord.attType == '0'}">
                                            <tr class="success">
                                                <th scope="row">${employee.attRecord.attId}</th>
                                                <td>${employee.realName}</td>
                                                <td>${employee.attRecord.attTime}</td>
                                                <td>上班打卡</td>
                                                <td>正常</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord.attType == '1'}">
                                            <tr class="warning">
                                                <th scope="row">${employee.attRecord.attId}</th>
                                                <td>${employee.realName}</td>
                                                <td>${employee.attRecord.attTime}</td>
                                                <td>上班打卡</td>
                                                <td>迟到</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord.attType == '2'}">
                                            <tr class="warning">
                                                <th scope="row">${employee.attRecord.attId}</th>
                                                <td>${employee.realName}</td>
                                                <td>${employee.attRecord.attTime}</td>
                                                <td>上班打卡</td>
                                                <td>早退</td>
                                            </tr>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>

                        <c:if test="${flag1 == '下午'}">

                            <%--<P>-------------------------------------------------------------今日上班打卡-------------------------------------------------------------</P>--%>
                            <table class="table table-hover" style="table-layout:fixed;">
                                <thead>
                                <tr>
                                    <th colspan="5" class="text-center">今日上班打卡</th>
                                </tr>
                                <tr class="active">
                                    <th width="10%">ID</th>
                                    <th>打卡人</th>
                                    <th>打卡时间</th>
                                    <th>打卡类型</th>
                                    <th>打卡状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${employeesAm}" var="employee">
                                    <c:if test="${employee.attRecord.attAt == 'am' || employee.attRecord.attAt == null}">
                                        <c:if test="${employee.attRecord == null && employee.leave == null}">
                                            <tr class="danger">
                                                <th scope="row">Null</th>
                                                <td>${employee.realName}</td>
                                                <td>Null</td>
                                                <td>上班打卡</td>
                                                <td>缺勤</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord == null && employee.leave != null}">
                                            <tr class="danger">
                                                <th scope="row">Null</th>
                                                <td>${employee.realName}</td>
                                                <td>Null</td>
                                                <td>上班打卡</td>
                                                <td>请假</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord.attType == '0'}">
                                            <tr class="success">
                                                <th scope="row">${employee.attRecord.attId}</th>
                                                <td>${employee.realName}</td>
                                                <td>${employee.attRecord.attTime}</td>
                                                <td>上班打卡</td>
                                                <td>正常</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord.attType == '1'}">
                                            <tr class="warning">
                                                <th scope="row">${employee.attRecord.attId}</th>
                                                <td>${employee.realName}</td>
                                                <td>${employee.attRecord.attTime}</td>
                                                <td>上班打卡</td>
                                                <td>迟到</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord.attType == '2'}">
                                            <tr class="warning">
                                                <th scope="row">${employee.attRecord.attId}</th>
                                                <td>${employee.realName}</td>
                                                <td>${employee.attRecord.attTime}</td>
                                                <td>上班打卡</td>
                                                <td>早退</td>
                                            </tr>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>

                            <%--<P>-------------------------------------------------------------今日下班打卡-------------------------------------------------------------</P>--%>
                            <table class="table table-hover" style="table-layout:fixed;">
                                <thead>
                                <tr>
                                    <th colspan="5" class="text-center">今日下班打卡</th>
                                </tr>
                                <tr class="active">
                                    <th width="10%">ID</th>
                                    <th>打卡人</th>
                                    <th>打卡时间</th>
                                    <th>打卡类型</th>
                                    <th>打卡状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${employeesPm}" var="employee">
                                    <c:if test="${employee.attRecord.attAt == 'pm' || employee.attRecord.attAt == null}">
                                        <c:if test="${employee.attRecord == null && employee.leave == null}">
                                            <tr class="danger">
                                                <th scope="row">Null</th>
                                                <td>${employee.realName}</td>
                                                <td>Null</td>
                                                <td>下班打卡</td>
                                                <td>缺勤</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord == null && employee.leave != null}">
                                            <tr class="danger">
                                                <th scope="row">Null</th>
                                                <td>${employee.realName}</td>
                                                <td>Null</td>
                                                <td>下班打卡</td>
                                                <td>请假</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord.attType == '0'}">
                                            <tr class="success">
                                                <th scope="row">${employee.attRecord.attId}</th>
                                                <td>${employee.realName}</td>
                                                <td>${employee.attRecord.attTime}</td>
                                                <td>下班打卡</td>
                                                <td>正常</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord.attType == '1'}">
                                            <tr class="warning">
                                                <th scope="row">${employee.attRecord.attId}</th>
                                                <td>${employee.realName}</td>
                                                <td>${employee.attRecord.attTime}</td>
                                                <td>下班打卡</td>
                                                <td>迟到</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${employee.attRecord.attType == '2'}">
                                            <tr class="warning">
                                                <th scope="row">${employee.attRecord.attId}</th>
                                                <td>${employee.realName}</td>
                                                <td>${employee.attRecord.attTime}</td>
                                                <td>下班打卡</td>
                                                <td>早退</td>
                                            </tr>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>

                        </c:if>
                    </c:when>

                    <c:otherwise>
                        <h1>今天是${flag2}，不需要上班！</h1>
                    </c:otherwise>

                </c:choose>

            </div>

        </div>
    </div>
</div>
<div class="col-md-2" style="height: 100%"></div>
</body>
</html>
