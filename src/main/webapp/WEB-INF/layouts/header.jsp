<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="info" property="principal" />

<h1>Hello JSP!</h1>
<div class="text-right">
	<a href="/logout"><span><spring:message code="label.logout" arguments="" text="NA"/>
	(${info.username})
</div>

