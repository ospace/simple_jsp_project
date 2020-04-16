<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<title><tiles:getAsString name="title"/></title>
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  	<link rel="shortcut icon" href="/static/favicon.ico" type="image/x-icon" />
  	
	<script src="/assets/jquery/jquery-2.2.4.min.js"></script>
	<script src="/assets/jBox/jBox.all.min.js"></script>
	<script src="/js/common.js"></script>
		
	<link type="text/css" rel="stylesheet" href="/assets/bootstrap/dist/css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="/assets/font-awesome/css/font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="/assets/jBox/jBox.all.min.css">
	<link type="text/css" rel="stylesheet" href="/css/global.css">
</head>

<body height="100%">
	<table style="width:100%;">
		<tr>
			<td colspan="2" style="padding:5px;background: #efefef"><tiles:insertAttribute name="header" /></td>
		</tr>
		<tr>
			<td valign="top" style="padding:20px"><tiles:insertAttribute name="body" /></td>
		</tr>
        <tr>
            <td colspan="2" style="padding:5px;background: #efefef"><tiles:insertAttribute name="footer" /></td>
        </tr>
	</table>
	
</body>
</html>
