<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>option.jsp</title>

<!-- 로그인한사람의 id,닉네임,캐릭터코드 저장 -->
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.m_nick" var="nick"/>
<sec:authentication property="principal.m_image_cd" var="image"/>


<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/addOption.css">



<script>
$(function() {
	getOption(); //1. 유저 알람관련 정보조회; m_id, m_radius, m_notice1, m_notice2, m_notice3
	updateOption(); //2. 스위치,버튼 클릭시 옵션 업데이트

});

//1. 유저 알람관련 정보조회
function getOption() {
	$.ajax({
		url: "../ajax/getOption.json",
		dataType: "json",
		success: getOptionHandler
	});
}

//1-1 정보조회후 결과처리
function getOptionHandler(data) {
	rangeSlider(data.m_radius); //레인지 슬라이더에 디비값 세팅
	toggleSwitch(data);  // 알람 on/off 설정에 따라 스위치에 디비값 세팅
}

//1-2 디비값이 1이면 스위치 on; 0이면 스위치 off
function toggleSwitch(data) {
	if(data.m_notice1 == 1) {
		$('#switch1').prop('checked', true);		//스위치1
		$('#m_notice1').val(1);
	} else if (data.m_notice1 == 0) {
		$('#switch1').prop('checked', false);
		$('#m_notice1').val(0);
	} if (data.m_notice2 == 1) {
		$('#switch2').prop('checked', true);		//스위치2
		$('#m_notice2').val(1);
	} else if (data.m_notice2 == 0) {
		$('#switch2').prop('checked', false);
		$('#m_notice2').val(0);
	} if (data.m_notice3 == 1) {
		$('#switch3').prop('checked', true);		//스위치3
		$('#m_notice3').val(1);
	} else if (data.m_notice3 == 0) {
		$('#switch3').prop('checked', false);
		$('#m_notice3').val(0);
	}
}    


//1-3 레인지 슬라이더 기본세팅
function rangeSlider(range) {
	$("#myRange").val(range); 			// 슬라이더 값 지정
	$("#checkRange").text(range); 		// 범위 출력부분 값 지정
	$("#m_radius").val(range);			// DB 전송 폼 값 지정
}

//1-4 레인지 슬라이더 옮기면 값 변경
function changeRange(range) {
	$("#checkRange").text(range);		// 범위 출력부분 값 변경
	$("#m_radius").val(range);			// DB 전송 폼 값 수정
}	


//2. 스위치,버튼 클릭시 옵션 업데이트
function updateOption() {
		updateSwitch();			//토글스위치 클릭시 업뎃
		updateRangeBtn();		// 범위버튼 클릭시 업뎃
}

//2-1 토글스위치 클릭시, 디비에 on/off 업데이트
function updateSwitch() {                  
	var switches = $('input:checkbox'); //스위치
	switches.on('click', function() {
		var index = (switches.index(this) +1 ); //스위치의 순서, 배열이라서 +1 
		if($(this).is(':checked')) {
			$("#m_notice" + index).val(1); //클릭한 버튼이 on일시 스위치폼에 1을 담는다
		} else {
			$("#m_notice" + index).val(0); // 클릭한 버튼이 off일시 스위치폼에 0을 담는다
		}
				
			var param = JSON.stringify($("#switchForm").serializeObject()); //스위치폼에 담긴 정보
			$.ajax({
				url: "../ajax/updateOption.json",
				method: "PUT",
				dataType: "json",
				data: param, //서버로 보낼 파라미터 
				contentType: 'application/json'

			});
	});
}
      
//2-2 범위버튼 클릭시 변경된 범위, 디비에 업데이트
function updateRangeBtn() {
	var rangeBtn = $("#rangeBtn");   
	rangeBtn.on("click", function() {
		rangeBtn.addClass('clicked'); 			// 범위버튼에 .clicked 클래스 동적추가, css 변경
		rangeBtn.text("적용완료");				// 범위버튼에 "적용완료" 값 주입
		
		var param = JSON.stringify($("#rangeForm").serializeObject()); //범위정보 폼에 담긴 정보
		$.ajax({
			url: "../ajax/updateRange.json",
			method: "PUT",
			dataType: "json",
			data: param, //서버로 보낼 파라미터 
			contentType: 'application/json'

		});
	});
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

#rangeBtn {
	font-weight: bold;
}

.pink-btn.clicked {
    background: #ffffff;
    border: none;
    border-radius: 3px;
    padding-left: 10px;
    padding-right: 10px;
    height: 30px;
    color: #FE9191;
    box-shadow: 0 0 0 2px #FE9191;
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
						<td style="text-align: center; padding-top: 20px;"><button id="rangeBtn" class="pink-btn">범위적용</button></td>
					</tr>   
				</tbody>
			</table>
		</div>
	</div>
	
		<form id="switchForm"> <!-- 스위치1; 스위치2;스위치3; 로그인아이디 -->
			<input type="hidden" id="m_notice1" name="m_notice1"><br> 
			<input type="hidden" id="m_notice2" name="m_notice2"><br>
			<input type="hidden" id="m_notice3" name="m_notice3"><br>
			<input type="hidden" name="m_id" value="${id }">
		</form>
		<br>
		<form id="rangeForm"> <!-- 범위버튼; 로그인아이디 -->
			 <input type="hidden" id="m_radius" name="m_radius"><br>
			 <input type="hidden" name="m_id" value="${id }">
		</form>
	</body>
</html>