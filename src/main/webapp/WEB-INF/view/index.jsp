<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import = "com.tistory.ospace.simplejsp.util.YN "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="ex" uri="/WEB-INF/tld/ex.tld" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<sec:authentication var="info" property="principal" />
<jsp:useBean id="dateUtils" class="com.tistory.ospace.simplejsp.util.DateUtils"/>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring Boot Application with JSP</title>
    <style>
	</style> 
</head>
<body>
    <p>
        레이아웃 선택<br/>
        <a href="/none">미적용</a> | 
        <a href="/">적용</a>
    </p>
    <p>
        Include 사용<br/> 
    </p>
    <p>
        사용정의 태그사용<br>
        <tags:now/><br>
        <tags:paging pagination="${pagination}"></tags:paging>
    </p>
    <p>
        사용자정의 라이브러리 사용<br>
        <ex:Title message="Hello"/>
        <ex:Title>, Spring Boot App</ex:Title>
    </p> 
    <p>
        기본 모델 객체<br>
        ${ say }
        <ul>
        <c:forEach var="each" items="${YN.values()}">
           <li><c:out value="${each.name}"/>:<c:out value="${each.value}"/></li>
        </c:forEach>
        </ul>
    </p>
    <p>
        데이터 모델객체<br>    
        Account: ${ account }<br>
        Pagination: ${ pagination }<br>
    </p>
    <p>
        i18n 샘플<br>
        <b><spring:message code="greeting" arguments="" text="NA"/></b>
    </p>
    <p>
        Javascript 객체<br>
        <button onclick="showAccount()">Account보여주기</button>  
    </p>
    <script>
        function showAccount() {
            var data = ${ account };   
            alert('Account: '+JSON.stringify(data));
        }
    </script>
</body>
</html>
