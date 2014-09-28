<!doctype html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add article</title>
</head>
<body>


<c:url var="formActionUrl" value="/articles/add/"/>
<%--<c:if test="${!empty article.id}">--%>
    <%--<c:url var="formActionUrl" value="/articles/edit/${article.id}"/>--%>
<%--</c:if>--%>

<form:form method="post" action="${formActionUrl}" modelAttribute="article">
    Post size: <form:select items="${articleSizes}" path="type"/><br/>
    Title: <form:input path="title"/><br/>
    Author: <form:input path="author"/><br/>
    Date: <form:input path="date"/><br/>
    Content: <form:textarea path="content"/><br/>
    <input type="submit" value="Done"/>
</form:form>
</body>
</html>
