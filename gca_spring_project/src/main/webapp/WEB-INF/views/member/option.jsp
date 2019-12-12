<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
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

<script>
$(function() {
	getOption(); //유저 알람관련 정보조회; m_id, m_radius, m_notice1, m_notice2, m_notice3
});

// 유저 알람관련 정보조회
function getOption() {
	$.ajax({
		url: "../ajax/option.json",
		dataType: "json",
		success: getOptionHandler
	});
}

// 정보조회후 결과처리
function getOptionHandler(data) {
	rangeSlider(data.m_radius); //레인지 슬라이더에 디비값 세팅
	toggleSwitch(data);
	//toggleSwitch2(data.m_notice2);
	//toggleSwitch3(data.m_notice3);
}

function toggleSwitch(data) {
	if(data.m_notice1 == 1) {
		$('#switch1').prop('checked', true);
		console.log(data + " on");
	} else {
		$('#switch1').prop('checked', false);
		console.log(data + ' off');
  }
}



//레인지 슬라이더 기본세팅
function rangeSlider(range) {
	$("#myRange").val(range); // 슬라이더 값 지정
	$("#checkRange").text(range); // 범위 출력부분 값 지정
}

//레인지 슬라이더 옮기면 값 변경
function changeRange(range) {
	document.getElementById("checkRange").innerHTML = range; // 범위 출력부분 값 지정
}	         
</script>

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
					<td><span class="mediumText">참가중 반짝, 인원모집 완료시 알람</span></td>
					<td>
						<div class="onoffswitch">
						    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="switch1" checked>
						    <label class="onoffswitch-label" for="switch1"></label>
						</div>
					</td>
				</tr>
				<tr>
					<td><span class="mediumText">범위내 등록된 반짝 알람</span></td>
					<td>
						<div class="onoffswitch">
						    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="switch2" checked>
						    <label class="onoffswitch-label" for="switch2"></label>
						</div>
					</td>
				</tr>
				<tr>
					<td><span class="mediumText">범위내 등록된 용병 알람</span></td>
					<td>
						<div class="onoffswitch">
						    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="switch3" checked>
						    <label class="onoffswitch-label" for="switch3"></label>
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
						  <input type="range" min="1" max="30" value="10" class="rangeSlider" id="myRange" oninput="changeRange(this.value)">
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