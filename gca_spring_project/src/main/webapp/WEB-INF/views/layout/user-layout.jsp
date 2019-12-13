<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var webSocket = new WebSocket('ws://localhost/gca/broadcast.do'); 
	
	webSocket.onerror = function(event) { onError(event) };
	webSocket.onopen = function(event) { onOpen(event) };
	webSocket.onmessage = function(event) { onMessage(event) };
	
	function onError(event) { 
		console.log(event); 
		 alert(event.data); 
	}
	
	function onOpen(event) {
		
	}
	
	/* function onMessage(event){
		
	} */

</script>
</head>
<body>
	<div style="padding-bottom: 80px;">
		<tiles:insertAttribute name="user-content" />
	</div>
	
		<tiles:insertAttribute name="footer-menubar" />
</body>
</html>