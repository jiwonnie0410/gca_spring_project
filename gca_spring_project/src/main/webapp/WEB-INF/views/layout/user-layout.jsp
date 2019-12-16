<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- json-serializeObject js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
		
<title>유저 레이아웃</title>
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