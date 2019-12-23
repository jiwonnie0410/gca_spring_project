<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		
		<!-- CSS -->
		<link href="${pageContext.request.contextPath }/resources/css/menubar/jiwon-menubar.css" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
		
<title>운동하자!</title>
<script>

	var webSocket;
	var mstatus = "<sec:authentication property='principal.m_id'/>";

	$(function(){
		
		if(mstatus != null && mstatus != ''){
			webSocket = new WebSocket('ws://localhost/gca/broadcast.do'); 
			//webSocket = new WebSocket('wss://192.168.0.17:8443/gca/broadcast.do'); 
			//webSocket = new WebSocket('ws://39.116.34.40/gca/broadcast.do');
			//webSocket = new WebSocket('wss://39.116.34.40:8443/gca/broadcast.do'); 
			
			webSocket.onerror = function(event) { onError(event) };
			webSocket.onopen = function(event) { onOpen(event) };
			webSocket.onmessage = function(event) { onMessage(event) };
		}
		
		$('.nav_menubar').on('click', function(){
			$(this).removeClass();
			$(this).addClass('nav_menubar_click');
		});
		
	});
	
	
	function onError(event) { 
		//console.log(event); 
		 //alert(event.data); 
	}
	
	function onOpen(event) {
		var msg = {
				cmd : "alertCnt",
				id : mstatus
		}
		webSocket.send(  JSON.stringify( msg )   );
	}
	
	function onMessage(event){
		var result = JSON.parse(event.data);
		if(result.cmd == "alertCnt" || result.cmd == "groupAlert"){
			$('#alertcnt').text(result.msg);
			//console.log("알림 웹소켓<" + result.msg + ">");
		}
		else if(result.cmd != "groupAlert" && result.cmd != "alertCnt" && 
				(result.cmd == "join" || result.cmd == "msg" || result.cmd == "cancelJoin" || result.cmd == "kickOut") ) {
			onMessageChat(event);
			//console.log("채팅 웹소켓");
			
		}
	}

</script>
</head>
<body>

		<tiles:insertAttribute name="user-content" />
		<br><br><br>
	

		<tiles:insertAttribute name="footer-menubar" />

</body>
</html>