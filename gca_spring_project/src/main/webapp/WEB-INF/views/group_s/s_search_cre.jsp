<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반짝 방 생성하기</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- private : icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mihy/nouislider.min.css">
<script src="${pageContext.request.contextPath }/js/mihy/nouislider.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mihy/nouislider.css">
<script src="${pageContext.request.contextPath }/js/mihy/nouislider.min.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>

<script>
$(document).ready(function(){
	
	$('#sg_sport .dropdown-menu li').bind('click',function (e) {
		var html = $(this).html();
		$('#sg_sport button.dropdown-toggle').html(html +' <span class="caret"></span>');
		var sport_name = $('#sg_sport button.dropdown-toggle').text();
		if(sport_name.substr(0,1) == "농" || sport_name.substr(0,1) == "배"){
			$('#sg_option1').attr({'class':'collapse show'});
			$('#sg_option2').attr({'class':'collapse'});
		} else if(sport_name.substr(0,1) == "달"){
			$('#sg_option2').attr({'class':'collapse show'});
			$('#sg_option1').attr({'class':'collapse'});
		} else {
			$('#sg_option2').attr({'class':'collapse'});
			$('#sg_option1').attr({'class':'collapse'});
		}		
	});
	
	$('#sg_skill .dropdown-menu li').bind('click',function (e) {
		var html = $(this).html();
		$('#sg_skill button.dropdown-toggle').html(html +' <span class="caret"></span>');
	});
	
	$('#sg_finish .dropdown-menu li').bind('click',function (e) {
		var html = $(this).html();
		$('#sg_finish button.dropdown-toggle').html(html +' <span class="caret"></span>');
	});
});

</script>
<style>

body{
	padding: 10px;
}

.btn {
	border-color: #FE9191;
	color: #FE9191;
}
    
.btn:hover {
	background-color: #FE9191;
	color: #FFF;
}
    
.btn:focus {
	color: #fff;
	background-color: #FE9191;
	border-color: #FE9191;
	outline: none;
	box-shadow: none;
}

.dropdown-menu > li {
	color: gray;
	font-weight: lighter;
	padding: 5px 0 5px 10px;
}

li:hover {
	background-color: #FAF0F0 !important;
}


.custom-checkbox {
	font-size: 12px;
}

.d_day {
	border: 1px solid #FE9191;
	color: #FE9191;
	padding: 5px;
	border-radius: 5px;
}

#map {
	width: 93%;
	height: 250px;
	margin: 10px;
	display: none;
	border: 2px solid #FE9191;
	border-radius: 5px;
}

#sg_age .noUi-handle {
	padding: 0 17px;
}


/* 라디오 버튼 */

/* The container */
.radio_label {
  display: block;
  position: relative;
  padding-left: 18px;
  margin-bottom: 12px;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.radio_label input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 2px;
  left: 0;
  height: 23px;
  width: 23px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.radio_label:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.radio_label input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.radio_label input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.radio_label .checkmark:after {
 	top: 6px;
	left: 6px;
	width: 11px;
	height: 11px;
	border-radius: 50%;
	background: white;
}

</style>
</head>

<body>

<form action="/action_page.php" class="was-validated">

	<div class="row m-1">
		<input type="text" class="form-control sg_name" id="sg_name" placeholder="반짝 방 이름" name="sg_name" required>
	</div>
	
	<div class="txc-textbox m-1">
		<div id="sg_sport" class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				운동 종목 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu sg_option_click">
				<li class="sg_option_click1">농구</li>
				<li class="sg_option_click2">달리기/산책</li>
				<li class="sg_option_click3">등산</li>
				<li class="sg_option_click1">배드민턴</li>
				<li class="sg_option_click3">볼링</li>
				<li class="sg_option_click3">수영</li>
				<li class="sg_option_click3">자전거</li>
				<li class="sg_option_click3">기타</li>
			</ul>
		</div>
	</div>

	<div class="txc-textbox m-1">
		<div id="sg_skill" class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				숙련도 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li>입문</li>
				<li>초급</li>
				<li>중급</li>
				<li>고급</li>
			</ul>
		</div>
	</div>
	
	<div class="row m-1 d_day">
		<span class="mr-5 middle">마감 날짜</span>
		<input type="date" id="sg_end" name="sg_end">
	</div>
	

	<div class="row m-1" style="padding: 0px">
		<input type="text" class="form-control" placeholder="장소 찾기" id="sg_location" name="sg_location" readonly>
	</div>
	<div class="row m-1">
		<input type="button" class="btn btn-default form-control" onclick="sgAddr()" value="주소찾기">
	</div>
	<input type="hidden" name="sg_xy" id="sg_xy">
	<div id="map" style="width: 93%; height: 250px; margin: 10px; display: none; border"></div>
	
	
	<div class="txc-textbox m-1">
		<div id="sg_finish" class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				참여 인원 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li>2명</li>
				<li>3명</li>
				<li>4명</li>
			</ul>
		</div>
	</div>
	
	<div class="row m-1 pt-2">
		<label class="radio_label">&nbsp;&nbsp;&nbsp;남자만&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" checked="checked" name="sg_gender" id="sg_gender" value="1">
			<span class="checkmark"></span>
		</label>
		<label class="radio_label">&nbsp;&nbsp;&nbsp;여자만&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="sg_gender" id="sg_gender" value="2">
			<span class="checkmark"></span>
		</label>
		<label class="radio_label">&nbsp;&nbsp;&nbsp;혼성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="sg_gender" id="sg_gender" value="3">
			<span class="checkmark"></span>
		</label>
	</div>

	<span class="age-val" id="age_lower"></span>
	<span class="age-val" id="age_upper"></span>
	<div id="sg_age" class="m-3"></div>
	
	<div id="sg_option1" class="collapse">
		<input type="checkbox" id="sg_option1_box" name="sg_option1_box" value="1">
		<label>개인 도구 필요(예. 농구공, 배드민턴 라켓, 셔틀콕 등)</label>
	</div>
	
	<div id="sg_option2" class="collapse">
		<input type="checkbox" id="sg_option2_box" name="sg_option2_box" value="2">
		<label>반려 동물 동반</label>
	</div>
	
	<input type="submit" class="btn btn-default  form-control" value="방 생성">

</form>

<script>
//이중 슬라이더 사용
var skipSlider = document.getElementById('sg_age');

noUiSlider.create(skipSlider, {
    range: {
        'min': 20,
        '20%': 30,
        '40%': 40,
        '60%': 50,
        '80%': 60,
        'max': 70
    },
    snap: true,
    start: [20, 70]
});

var skipValues = [
    document.getElementById('age_lower'),
    document.getElementById('age_upper')
];

var age1;
var age2;
skipSlider.noUiSlider.on('update', function (values, handle) {
	if(values[1].substr(0,2) != "70"){
		skipValues[0].innerHTML = values[0].substr(0,2) + "대 이상 ~ ";
		skipValues[1].innerHTML = values[1].substr(0,2) + "대 미만";
	} else {
		skipValues[0].innerHTML = values[0].substr(0,2) + "대 이상 ";
		skipValues[1].innerHTML = "모든 연령대";
	}
	
})

//kakao map api로 주소 입력
var geo = new kakao.maps.services.Geocoder();

//맵 생성 : window.onload로 변수 값 지정
var mapContainer = document.getElementById('map'); //지도를 표시할 div
var mapOption = {
	center : new daum.maps.LatLng(37.537187, 127.005476), //지도의 중심 좌표
	level : 5	// 지도의 확대 레벨
};
var map = new daum.maps.Map(mapContainer, mapOption); //지도를 미리 생성
var marker = new daum.maps.Marker({
	position : new daum.maps.LatLng(37.537187, 127.005476),
	map : map
}); //마커를 미리 생성

//맵 클릭시 좌표 값 가져와서 마커 위치/주소 변경
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	var latlng = mouseEvent.latLng; //클릭한 지점의 좌표 값
	marker.setPosition(latlng); //클릭한 지점으로 마커 위치 옮김
	$('#sg_xy').val(latlng.getLat() + ", " + latlng.getLng()); //value값 변경
	geo.coord2Address(latlng.getLng(), latlng.getLat(), callAddr); //좌표값에 따른 주소 불러옴(아래 메소드)
});

var callAddr = function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		$('#sg_location').val(result[0].address.address_name);
	}
};

function sgAddr() {
	new daum.Postcode({
		oncomplete : function(data) {
			var addr = data.address; //최종 주소 변수
			document.getElementById("sg_location").value = addr; //주소 정보를 해당 필드에 넣는다.
			geo.addressSearch(data.address, function(results, status) { //주소로 상세 정보를 검색
				if (status === daum.maps.services.Status.OK) { //정상적으로 검색이 완료됐으면
					var result = results[0]; //첫번째 결과의 값을 활용
					var coords = new daum.maps.LatLng(result.y, result.x); // 해당 주소에 대한 좌표를 받아서
					$('#sg_xy').val(coords.Ha + ", " + coords.Ga); //xy value값에 넣음
					mapContainer.style.display = "block"; //감춰졌던 지도 보여줌.
					map.relayout();
					map.setCenter(coords); //지도 중심점 변경
					marker.setPosition(coords); //이동된 중심점으로 마커 옮김
				}
			});
		}
	}).open();
}

</script>

</body>
</html>