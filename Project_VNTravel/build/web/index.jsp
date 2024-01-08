<%-- 
    Document   : index
    Created on : Jan 6, 2024, 8:39:21 PM
    Author     : hello
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TravelVN</title>
    </head>
    <body>
        <c:set value="${sessionScope.account}" var="a"/>
        <h1>TravelVN</h1>
        <c:if test="${sessionScope.account == null}" >
            <h3><a href="./login.jsp">login</a>|<a href="./register.jsp">register</a></h3>
        </c:if>
        <c:if test="${sessionScope.account != null}" >
            <h1>Hello ${a.username}</h1>

        </c:if>


    </body>
</html>
