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
    
    <style>
      nav {
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
