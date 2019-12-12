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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/addOption.css">

<style>
.optionDiv {
	max-whdth: 500px;
}

.rangeTable {
	width: 100%;
} 
.alarmTable {
	width: 100%;
}   

</style>

<script>
$(function() {
	//레인지 슬라이드 옵션
	var slider = document.getElementById("myRange"); 
	var output = document.getElementById("checkRange"); //보증금선택쪽의 출력값
	output.innerHTML = slider.value;
	
	slider.oninput = function() {
		output.innerHTML = this.value;
	}
});

</script>
</head>


<body>
<div class="container">     
	<div class="optionDiv">
	  <div class="title">환경설정</div>
	  <hr>
		<table class="alarmTable">
			<thead>
				<tr>
					<td><span class="pinkText">알람설정</span></td>
				</tr>
			</thead>
			<tbody>
				<tr>   
					<td><span class="mediumText">참가한 반짝 인원모집 완료시 알람</span></td>
					<td>
						<div class="onoffswitch">
						    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch1" checked>
						    <label class="onoffswitch-label" for="myonoffswitch1"></label>
						</div>
					</td>
				</tr>
				<tr>
					<td><span class="mediumText">범위내 등록된 반짝 알람</span></td>
					<td>
						<div class="onoffswitch">
						    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch2" checked>
						    <label class="onoffswitch-label" for="myonoffswitch2"></label>
						</div>
					</td>
				</tr>
				<tr>
					<td><span class="mediumText">범위내 등록된 용병 알람</span></td>
					<td>
						<div class="onoffswitch">
						    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch3" checked>
						    <label class="onoffswitch-label" for="myonoffswitch3"></label>
						</div>
					</td>
				</tr>
<!-- 				<tr>    -->
<!-- 					<td><span class="mediumText">범위내 등록된 동아리매치 알람</span></td> -->
<!-- 					<td> -->
<!-- 						<div class="onoffswitch"> -->
<!-- 						    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch4" checked> -->
<!-- 						    <label class="onoffswitch-label" for="myonoffswitch4"></label> -->
<!-- 						</div> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				
				
			</tbody>
		</table>
		<br>
		<table class="rangeTable">
			<thead>
				<tr>
					<td><span class="pinkText">범위설정</span></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">
						<div class="slidecontainer">
						  <input type="range" min="1" max="30" value="10" class="rangeSlider" id="myRange">
						</div>
					</td>
				</tr>
				<tr>   
					<td class="pinkText" style="padding-top: 20px; width: 200px;">반경범위: <span id="checkRange"></span>km</td>
					<td style="text-align: center; padding-top: 20px;"><button class="pink-btn">적용</button></td>
				</tr>   
			</tbody>
		</table>
	</div>
</div>

</body>
</html>