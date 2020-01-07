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

    <!-- 引入 echarts.js -->
    <script src="${APP_PATH}/static/js/echarts.js"></script>

    <script type="text/javascript">
        setTimeout(function () {
            // 基于准备好的dom，初始化echarts实例
            //'product', '上六周', '上五周', '上四周', '上三周', '上二周', '上一周'
            var myChart = echarts.init(document.getElementById('main'));

            option = {
                legend: {},
                tooltip: {
                    trigger: 'axis',
                    showContent: false
                },
                dataset: {
                    source: [
                        ['product', '${d4}', '${d3}', '${d2}', '${d1}'],
                        ['正常出勤', ${d4Att0}, ${d3Att0}, ${d2Att0}, ${d1Att0}],
                        ['迟到次数', ${d4Att1}, ${d3Att1}, ${d2Att1}, ${d1Att1}],
                        ['早退次数', ${d4Att2}, ${d3Att2}, ${d2Att2}, ${d1Att2}],
                        ['缺勤次数', ${d4Att3}, ${d3Att3}, ${d2Att3}, ${d1Att3}]
                    ]
                },
                color: ['#5cb85c','#5bc0de','#f0ad4e','#d9534f'],
                xAxis: {type: 'category'},
                yAxis: {gridIndex: 0},
                grid: {top: '55%'},
                series: [
                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                    {
                        type: 'pie',
                        id: 'pie',
                        radius: '30%',
                        center: ['50%', '25%'],
                        label: {
                            formatter: '{b}: {@2012} ({d}%)'
                        },
                        encode: {
                            itemName: 'product',
                            value: '2012',
                            tooltip: '2012'
                        }
                    }
                ]
            };

            myChart.on('updateAxisPointer', function (event) {
                var xAxisInfo = event.axesInfo[0];
                if (xAxisInfo) {
                    var dimension = xAxisInfo.value + 1;
                    myChart.setOption({
                        series: {
                            id: 'pie',
                            label: {
                                formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                            },
                            encode: {
                                value: dimension,
                                tooltip: dimension
                            }
                        }
                    });
                }
            });

            myChart.setOption(option);

        });
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
            <div class="col-md-11" style="margin-top: 10%">
                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                <div id="main" style="width: 100%;height:85%;"></div>
            </div>


        </div>
    </div>
</div>
<div class="col-md-2" style="height: 100%"></div>
</body>
</html>
