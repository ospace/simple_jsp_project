<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="info" property="principal" />

<div class="text-right">
	<span class="glyphicon glyphicon-off"></span>
	<a href="/logout"><span><spring:message code="label.logout" arguments="" text="NA"/>
	(${info.username})
</div>
