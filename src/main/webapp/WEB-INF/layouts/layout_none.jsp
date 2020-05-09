<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><tiles:getAsString name="title"/></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <link type="text/css" rel="stylesheet" href="/assets/bootstrap/dist/css/bootstrap.min.css">
    
    <style>
        av {
	        background:#333333;
	        padding:10px;
	        color:white;
        }
        nav a {
	        text-decoration:none;
	        color:lightblue;
        }
        section {
            border:1px solid;
        }
        footer {
	        background:#333333;
	        padding:5px;
	        color:white;
	        text-align:center;
	        font-size:11px;
        }
    </style>
</head>
<body>
<section>
    <tiles:insertAttribute name="section"/>
</section>
</body>
</html>
