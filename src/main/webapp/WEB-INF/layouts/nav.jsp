<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="info" property="principal" />

<a href="/">Home</a>
<a href="/normal">기본화면</a>
<a href=“https://docs.oracle.com/javaee/5/tutorial/doc/bnajo.html” target="_blank">JSP</a>

<div style="font:.8em Helvetica; float:right;">
    [ <a href="/?lang=ko_KR">한국어</a>
    | <a href="/?lang=en_US">English</a> ]
</div>