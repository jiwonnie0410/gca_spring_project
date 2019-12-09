<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="padding-bottom: 80px;">
		<tiles:insertAttribute name="user-content" />
	</div>
	
		<tiles:insertAttribute name="footer-menubar" />
</body>
</html>