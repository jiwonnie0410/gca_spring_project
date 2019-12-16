<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- json-serializeObject js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
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