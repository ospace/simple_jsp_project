<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="ex" uri="/WEB-INF/tld/ex.tld" %>
<%@ page import = "com.tistory.ospace.simplejsp.util.YN "%>

<jsp:useBean id="dateUtils" class="com.tistory.ospace.simplejsp.util.DateUtils"/>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring Boot Application with JSP</title>
    <style>
	</style> 
</head>
<body>
    <tags:now/>
	<div class="wrapper">
    	<ex:Title message="Hello"/>
    	<ex:Title>, Spring Boot App</ex:Title>
    	
    	<ul>
    	<c:forEach var="each" items="${YN.values()}">
    	   <li><c:out value="${each.name}"/>:<c:out value="${each.value}"/></li>
    	</c:forEach>
    	</ul>
    	
	    <div>
	        <tags:paging pagination="${pagination}"></tags:paging>
	    </div>
	        
    </div>
</body>
</html>
