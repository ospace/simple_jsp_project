<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<title><tiles:getAsString name="title"/></title>
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<script src="/assets/jquery/jquery-2.2.4.min.js"></script>
    <script src="/js/common.js"></script>
	
	<link type="text/css" rel="stylesheet" href="/assets/bootstrap/dist/css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="/assets/font-awesome/css/font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="/css/global.css">
</head>
<body>

<tiles:insertAttribute name="body" />

</body>
</html>
