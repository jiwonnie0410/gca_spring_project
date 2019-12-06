<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>option.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/surim/addOption.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/addOption.css">
	
<style>
.optionDiv {
	padding: 15px;
}

.title {
	text-align: center;
	font-size: 50px;
	font-weight: bold;
}


thead {
	font-size: 50px;
	font-weight: bold;
}

td {
	font-size: 50px;
	height : 150px;
}

button {
	width: 200px;
	height: 100px;
	font-size: 50px;
	font-weight: bold;
	background: #FE9191;
	border-radius: 30px;
	color: white;
	border: none;
}

</style>	

	
</head>

<body>
<div class="optionDiv">
  <div class="title" style="height: 100px;">환경설정</div>
  <hr>
	<table class="alarmTable">
		<thead>
			<tr>
				<td>알람설정</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="1050">반짝 풀방시 알람</td>
				<td width="200">
					<div class="onoffswitch">
					    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch1" checked>
					    <label class="onoffswitch-label" for="myonoffswitch1"></label>
					</div>
				</td>
			</tr>
			<tr>
				<td>범위내 등록된 반짝 알람</td>
				<td>
					<div class="onoffswitch">
					    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch2" checked>
					    <label class="onoffswitch-label" for="myonoffswitch2"></label>
					</div>
				</td>
			</tr>
			<tr>
				<td>범위내 등록된 용병 알람</td>
				<td>
					<div class="onoffswitch">
					    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch3" checked>
					    <label class="onoffswitch-label" for="myonoffswitch3"></label>
					</div>
				</td>
			</tr>
			<tr>
				<td>범위내 등록된 동아리매치 알람</td>
				<td>
					<div class="onoffswitch">
					    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch4" checked>
					    <label class="onoffswitch-label" for="myonoffswitch4"></label>
					</div>
				</td>
			</tr>
			
			
		</tbody>
	</table>
	<br>
	<table class="rangeTable">
		<thead>
			<tr>
				<td>범위설정 </td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<div class="slidecontainer">
					  <input type="range" min="1" max="15" value="5" class="rangeSlider" id="myRange">
					</div>
				</td>
			</tr>
			<tr>
				<td width="800">　　　반경범위: <span id="checkRange"></span>km</td>
				<td width="400"><button>적용</button></td>
			</tr>
		</tbody>
	</table>
</div>


</body>
</html>