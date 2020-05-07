<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sec:authentication var="info" property="principal" />

Hello JSP!
<div class="text-right">
    <%-- <span><fmt:message key="label.logout"/></span> --%>
	<a href="/logout"><span><spring:message code="label.logout" arguments="" text="NA"/>
	(${info.username})
</div>

