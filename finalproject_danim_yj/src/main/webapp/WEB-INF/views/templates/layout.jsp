<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>css를 이용한 layout</title>
<script type="text/javascript" src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/home.css">
<link rel="stylesheet" href="${initParam.root}resources/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div id="container">
	<div id="header"><tiles:insertAttribute name="header" /></div>
	<div id="left"><tiles:insertAttribute name="left" /></div>
	<div id="main"><tiles:insertAttribute name="main" /></div>
	<div id="footer"><tiles:insertAttribute name="footer" /></div>
</div>
<%-- <table width="100%" border="1" cellpadding="5" id="container">
<tr>
 <td colspan="2" id="header">
	<tiles:insertAttribute name="header"/></td> 
</tr>
<tr>
 <td valign="top" id="left"><tiles:insertAttribute name="left"/></td> 
 <td valign="top" id="main"><tiles:insertAttribute name="main"/></td>
</tr>
<tr>
 <td colspan="2" id="footer"><tiles:insertAttribute name="footer"/></td> 
</tr>
</table> --%>
</body>
</html>









