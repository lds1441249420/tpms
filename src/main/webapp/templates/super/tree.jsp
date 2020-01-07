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

<body>
<c:forEach items="${menus}" var="menu">
    <ul class="list-group">${menu.text}
        <c:forEach items="${menu.children}" var="chil">
            <li class="list-group-item">
                <c:if test="${chil.url == null || chil.url == ''}">
                    <a href="#">${chil.text}</a>
                </c:if>
                <c:if test="${chil.url != null}">
                    <a href="${APP_PATH}${chil.url}">${chil.text}</a>
                </c:if>

            </li>
        </c:forEach>
    </ul>
</c:forEach>
</body>
</html>
