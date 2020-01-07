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
        Date.prototype.format = function (fmt) {
            var o = {
                "y+": this.getFullYear, //年
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds() //秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
        setInterval("document.getElementById('dateTime').innerHTML = (new Date()).format('yyyy年MM月dd日 hh:mm:ss');", 1000);
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
            <div class="col-md-10" style="height: 70%">
                <div class="page-header">
                    <h1><small>工号：${employee.empNo}</small></h1>
                </div>
                <div>
                    <c:choose>

                        <c:when test="${flag2 == '星期一' ||flag2 == '星期二' ||flag2 == '星期三' ||flag2 == '星期四' ||flag2 == '星期五'}">
                            <c:if test="${flag1 == '上午'}">
                                <table>
                                    <thead>
                                    <tr>
                                        <td width="10%"></td>
                                        <td>上班时间：</td>
                                        <td>${attTime.timeWork}</td>
                                        <td width="30%"></td>
                                        <td>下班时间：</td>
                                        <td>${attTime.timeOff}</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr style="height: 20px"></tr>
                                    <tr>
                                        <td width="10%"></td>
                                        <td>上班打卡：</td>
                                        <td>
                                            <c:if test="${recordAm == null && status == 'beforeWork'}">
                                                <a href="${APP_PATH}/att/attend">
                                                    <button class="btn btn-success">点击打卡</button>
                                                </a>
                                            </c:if>
                                            <c:if test="${recordAm == null && status == 'inWork'}">
                                                <a href="${APP_PATH}/att/attend">
                                                    <button class="btn btn-warning">点击打卡</button>
                                                </a>
                                            </c:if>
                                            <c:if test="${recordAm != null && recordAm.attType == 1}">
                                                <button class="btn btn-warning" disabled="disabled">今日迟到</button>
                                            </c:if>
                                            <c:if test="${recordAm != null && recordAm.attType == 0}">
                                                <button class="btn btn-success" disabled="disabled">打卡成功</button>
                                            </c:if>
                                        </td>
                                        <td width="30%"></td>
                                        <td>下班打卡：</td>
                                        <td>
                                            <button class="btn btn-success" disabled="disabled">还未开始</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${flag1 == '下午'}">
                                <table>
                                    <thead>
                                    <tr>
                                        <td width="10%"></td>
                                        <td>上班时间：</td>
                                        <td>${attTime.timeWork}</td>
                                        <td width="30%"></td>
                                        <td>下班时间：</td>
                                        <td>${attTime.timeOff}</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr style="height: 20px"></tr>
                                    <tr>
                                        <td width="10%"></td>
                                        <td>上班打卡：</td>
                                        <td>
                                            <c:if test="${recordAm != null && recordAm.attType == 0}">
                                                <button class="btn btn-success" disabled="disabled">打卡成功</button>
                                            </c:if>
                                            <c:if test="${recordAm != null && recordAm.attType == 1}">
                                                <button class="btn btn-warning" disabled="disabled">今日迟到</button>
                                            </c:if>
                                            <c:if test="${recordAm == null}">
                                                <button class="btn btn-danger" disabled="disabled">缺卡</button>
                                            </c:if>
                                        </td>
                                        <td width="30%"></td>
                                        <td>下班打卡：</td>
                                        <td>
                                            <c:if test="${recordPm == null && status == 'afterWork'}">
                                                <a href="${APP_PATH}/att/attend">
                                                    <button class="btn btn-success">点击打卡</button>
                                                </a>
                                            </c:if>
                                            <c:if test="${recordPm == null && status == 'inWork'}">
                                                <a href="${APP_PATH}/att/attend">
                                                    <button class="btn btn-warning">点击打卡</button>
                                                </a>
                                            </c:if>
                                            <c:if test="${recordPm != null && recordPm.attType == 2}">
                                                <button class="btn btn-warning" disabled="disabled">今日早退</button>
                                            </c:if>
                                            <c:if test="${recordPm != null && recordPm.attType == 0}">
                                                <button class="btn btn-success" disabled="disabled">打卡成功</button>
                                            </c:if>
                                        </td>
                                    </tr>
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
            <div class="page-header">
                <h1 class="text-right"><small id="dateTime"></small></h1>
            </div>


        </div>
    </div>
</div>
<div class="col-md-2" style="height: 100%"></div>
</body>
</html>
