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
	
	//운동종목 드롭다운
	$('#sg_sport_div .dropdown-menu li').bind('click',function (e) {
		var html = $(this).html();
		$('#sg_sport').html(html +'<span class="caret pl-2"></span>');
		var sport_name = $('#sg_sport').text();
		if(sport_name == "농구" || sport_name == "배드민턴"){
			$('#sg_option1').attr({'class':'collapse show'});
			$('#sg_option2').attr({'class':'collapse'});
		} else if(sport_name == "달리기/산책"){
			$('#sg_option2').attr({'class':'collapse show'});
			$('#sg_option1').attr({'class':'collapse'});
		} else {
			$('#sg_option2').attr({'class':'collapse'});
			$('#sg_option1').attr({'class':'collapse'});
		}

		if(sport_name == "농구"){
			$('#sg_sport').val('basketball');
		} else if(sport_name == "달리기/산책"){
			$('#sg_sport').val('running');
		} else if(sport_name.substr(0,1) == "등"){
			$('#sg_sport').val('hiking');
		} else if(sport_name.substr(0,1) == "배"){
			$('#sg_sport').val('badminton');
		} else if(sport_name.substr(0,1) == "볼"){
			$('#sg_sport').val('bowling');
		} else if(sport_name.substr(0,1) == "수"){
			$('#sg_sport').val('swimming');
		} else if(sport_name.substr(0,1) == "자"){
			$('#sg_sport').val('bicycle');
		} else if(sport_name.substr(0,1) == "기"){
			$('#sg_sport').val('etc-sport');
		} else {
			$('#sg_sport').val();
		}
	});
	
	//숙련도 드롭다운
	$('#sg_skill_div .dropdown-menu li').bind('click',function (e) {
		var html = $(this).html();
		$('#sg_skill').html(html +'<span class="caret pl-2"></span>');
		$('#sg_skill').val($('#sg_skill').text().substring(0,2));
		//console.log($('#sg_skill').val());
	});
	
	//마감 날짜
	document.getElementById('sg_end_day').min = new Date().toISOString().substring(0, 10);
	
	//마감인원 드롭다운
	$('#sg_finish_div .dropdown-menu li').bind('click',function (e) {
		var html = $(this).html();
		$('#sg_finish').html(html +'<span class="caret pl-2"></span>');
		$('#sg_finish').val($('#sg_finish').text().substr(0,1));
	});
	
	
	//장소 클릭
	$('#sg_location').on('click', function(){
		sgAddr();
	});
	
	//다음 주소 API로 주소 입력
	function sgAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address;
				document.getElementById("sg_location").value = addr;
				geo.addressSearch(data.address, function(results, status) {
					if (status === daum.maps.services.Status.OK) {
						var result = results[0];
						var coords = new daum.maps.LatLng(result.y, result.x);
						$('#sg_xy').val(coords.Ha + ", " + coords.Ga);
						mapContainer.style.display = "block";
						map.relayout();
						map.setCenter(coords);
						marker.setPosition(coords);
					}
				});
			}
		}).open();
	}
	
	
	//kakao map api로 주소 입력
	var geo = new kakao.maps.services.Geocoder();
	var mapContainer = document.getElementById('map');
	var mapOption = {
		center : new daum.maps.LatLng(37.537187, 127.005476),
		level : 5
	};
	var map = new daum.maps.Map(mapContainer, mapOption);
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.537187, 127.005476),
		map : map
	});
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		var latlng = mouseEvent.latLng;
		marker.setPosition(latlng);
		$('#sg_xy').val(latlng.getLat() + ", " + latlng.getLng());
		geo.coord2Address(latlng.getLng(), latlng.getLat(), callAddr);
	});
	var callAddr = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			$('#sg_location').val(result[0].address.address_name);
		}
	};
	
	
	//이중 슬라이더 사용
	var skipSlider = document.getElementById('sg_age_bar');
	
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
		if(values[0].substr(0,2) == values[1].substr(0,2)){
			skipValues[0].innerHTML = values[0].substr(0,2) + "대만";
			skipValues[1].innerHTML = "";
		} else if(values[1].substr(0,2) != "70"){
			skipValues[0].innerHTML = values[0].substr(0,2) + "대 이상 ~ ";
			skipValues[1].innerHTML = values[1].substr(0,2) + "대 미만";
		} else {
			skipValues[0].innerHTML = values[0].substr(0,2) + "대 이상 ";
			skipValues[1].innerHTML = "모든 연령대";
		}
		$('#sg_age').val(skipValues[0].innerHTML + skipValues[1].innerHTML)
	})

	
	//유효성 검사
	$('#btn_cre').on('click', function(){
		
		//반짝 방 이름 검사
		var blank_pattern = /^\s+|\s+$/g;
		if( document.getElementById('sg_name').value.replace( blank_pattern, '' ) == "" ){
			$('#sg_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>공백만 입력되었습니다. 다시 입력해 주세요.');
		    return false;
		}
		$('#sg_name_valid').hide();
		
		var maxByte = 100; //최대 입력 바이트 수
	    var str = document.getElementById('sg_name').value;
	    var str_len = str.length;
	    var rbyte = 0;
	    var rlen = 0;
	    var one_char = "";
	    var str2 = "";
	 
	    for (var i = 0; i < str_len; i++) {
	        one_char = str.charAt(i);
	        if (escape(one_char).length > 4) {
	            rbyte += 3; //한글3Byte
	        } else {
	            rbyte++; //영문 등 나머지 1Byte
	        }
	        if (rbyte <= maxByte) {
	            rlen = i + 1; //return할 문자열 갯수
	        }
	    }
	    if (rbyte > maxByte) {
	    	$('#sg_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>한글 33자, 영문 100자를 초과하여 입력할 수 없습니다.');
	        /* alert("한글 " + (maxByte/3) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다."); */
	        return false;
	    }
	    
	    //선택 항목 검사1
 		if( $('#sg_sport').val() == "" || $('#sg_sport').val().isNull ){
 			if( $('#sg_skill').val() == "" || $('#sg_skill').val().isNull ){
 				$('#sg_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>운동 종목과 숙련도를 선택해 주세요.');
 				return false;
 			}
 			$('#sg_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>운동 종목을 선택해 주세요.');
 			return false;
 		} else if( $('#sg_skill').val() == "" || $('#sg_skill').val().isNull ){
 			if( $('#sg_sport').val() == "" || $('#sg_sport').val().isNull ){
 				$('#sg_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>운동 종목과 숙련도를 선택해 주세요.');
 				return false;
 			}
	    	$('#sg_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>숙련도를 선택해 주세요.');
	    	return false;
	    }
 		$('#sg_sport_valid').hide();
		
	    //선택 항목 검사2
		if( $('#sg_end_day').val() == "" || $('#sg_end_day').val() == null ){
			if( $('#sg_end_time').val() == "" || $('#sg_end_time').val() == null ){
				$('#sg_end_valid').show();
				$('#sg_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 시간과 마감 날짜를 입력해 주세요.');
				return false;
			}
			$('#sg_end_valid').show();
			$('#sg_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 날짜를 입력해 주세요.');
			return false;
		} else if( $('#sg_end_time').val() == "" || $('#sg_end_time').val() == null ){
			if( $('#sg_end_day').val() == "" || $('#sg_end_day').val() == null ){
				$('#sg_end_valid').show();
				$('#sg_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 시간과 마감 날짜를 입력해 주세요.');
				return false;
			}
			$('#sg_end_valid').show();
			$('#sg_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 시간을 입력해 주세요.');
			return false;
		} else {
			$('#sg_end_valid').hide();
			var date = new Date($('#sg_end_day').val());
			var day = date.getDate();
			var month = date.getMonth()+1;
			var year = date.getFullYear();
			
			var time = $('#sg_end_time').val() + ":00";
			var fulldate = year + "-" + month + "-" + day + " " + time;
			$('#sg_end').val(fulldate);
		}

		if( $('#sg_location').val() == "" || $('#sg_location').val() == null){
			$('#sg_location_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>만날 장소를 입력해 주세요.');
			return false;
		}
		$('#sg_location_valid').hide();
		
		if( $('#sg_finish').val() == "" || $('#sg_finish').val() == null ){
			$('#sg_finish_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>모집 인원을 선택해 주세요.');
			return false;
		}
		$('#sg_finish_valid').hide();
		
	})

	
});

</script>
<style>

body{ padding: 10px; }

.btn { border-color: #FE9191; color: #FE9191; }
.btn:hover { background-color: #FE9191; color: #FFF; }
.btn:focus {
	color: #fff;
	background-color: #FE9191;
	border-color: #FE9191;
	outline: none;
	box-shadow: none;
}

.btn2 { background-color: #FE9191;	border-color: #FE9191;	color: #FFF; }
.btn2:hover {	background-color: #FFFFFF;	border-color: #FE9191;	color: #FE9191; }
.btn2:focus {
	color: #FE9191;
	background-color: #FFF;
	border-color: #FE9191;
	outline: none;
	box-shadow: none;
}

.dropdown-menu > li {	color: gray;	font-weight: lighter;	padding: 5px 0 5px 10px;}
li:hover {	background-color: #FAF0F0 !important;}

.sg_valid { color: #FE9191; font-size: 14px; }
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

#sg_age_bar .noUi-handle {	padding: 0 17px;}
#age_text {
	color: gray;
	border-style: dashed;
	border-color: #FE9191;
	border-radius: 5px;
}
#age_title {
	color: #FE9191;
	font-size: 15px;
}

#btn_cre {	width:100%;}

#sg_name {
	border: 1px solid #FE9191;
}
.check-box {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #FE9191;
	background-color: white;
	cursor: pointer;
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
  background-color: #FE9191;
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

<form action="/action_page.php" class="">

	<div class="row mr-2 ml-2 mt-3 mb-3">
		<input type="text" class="form-control sg_name" id="sg_name" placeholder="반짝 방 이름" name="sg_name">
		<span id="sg_name_valid" class="sg_valid pl-2"></span>
	</div>
	
	<div class="row mr-2 ml-2 mt-3 mb-3">
	<div class="txc-textbox mr-2">
		<div id="sg_sport_div" class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="sg_sport" id="sg_sport">
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

	<div class="txc-textbox">
		<div id="sg_skill_div" class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle btn-block" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="sg_skill" id="sg_skill">
				숙련도 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li>입문 이상</li>
				<li>초급 이상</li>
				<li>중급 이상</li>
				<li>고급 이상</li>
			</ul>
		</div>
	</div>
	<span id="sg_sport_valid" class="sg_valid pl-3"></span>
	</div>
	
	<div class="row mr-2 ml-2 mt-3 d_day">
		<span class="ml-2 mr-5" style="margin-top: 2px">마감 날짜</span>
		<input type="date" id="sg_end_day"><br>
		<span class="ml-2 mr-5 mt-2" style="margin-top: 2px">마감 시간</span>
		<input class="mt-2" type="time" id="sg_end_time">
		<input type="hidden" name="sg_end" id="sg_end">
	</div>
	<span id="sg_end_valid" class="sg_valid pl-3" style="display:none;"></span>

	<div class="row mr-2 ml-2 mt-3 mb-3" style="padding: 0px">
		<input type="text" class="form-control" placeholder="만날 장소를 정해 주세요." id="sg_location" name="sg_location" readonly>
		<span id="sg_location_valid" class="sg_valid pl-3"></span>
	</div>
	<input type="hidden" name="sg_xy" id="sg_xy">
	<div id="map"></div>
	
	
	<div class="txc-textbox mr-2 ml-2 mt-3">
		<div id="sg_finish_div" class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="sg_finish" id="sg_finish">
				참여 인원 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li>2명</li>
				<li>3명</li>
				<li>4명</li>
			</ul>
		</div>
		<span id="sg_finish_valid" class="sg_valid pl-1"></span>
	</div>
	
	<div class="row mr-2 ml-2 mt-2 mb-2 pt-2">
		<label class="radio_label ml-3">&nbsp;&nbsp;&nbsp;혼성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" checked="checked" name="sg_gender" id="sg_gender" value="혼성">
			<span class="checkmark"></span>
		</label>
		<label class="radio_label">&nbsp;&nbsp;&nbsp;여성만&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="sg_gender" id="sg_gender" value="여성">
			<span class="checkmark"></span>
		</label>
		<label class="radio_label">&nbsp;&nbsp;&nbsp;남성만&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="sg_gender" id="sg_gender" value="남성">
			<span class="checkmark"></span>
		</label>
	</div>
	<span id="sg_gender_valid" class="sg_valid pl-3" style="display:none;"></span>


	<span class="ml-2" id="age_title"><i class="fas fa-pencil-alt mr-2"></i>연령대를 선택해 주세요.</span><br>
	<p class="mr-2 ml-2 mt-1" id="age_text" style="text-align:center;">
		<span class="age-val mr-1" id="age_lower"></span>
		<span class="age-val" id="age_upper"></span>
	</p>
	<div id="sg_age_bar" class="mr-4 ml-4 mt-2 mb-3"></div>
	<input type="hidden" id="sg_age" name="sg_age">
	
	
	<div id="sg_option1" class="collapse" style="margin: 0 10px 15px 10px;">
		<table>
			<tr>
				<td><input class="check-box" type="checkbox" id="sg_option1_box" name="sg_option" value="도구지참" style="margin:5px 0 0 0;"></td>
				<td sytle="padding:0 0 0 8px;">개인 도구 지참 <span class="badge badge-warning mr-1">예</span><span style="font-size:14px;color:gray;"> 농구공, 라켓, 셔틀콕 등</span></td>
			</tr>
		</table>
	</div>
	
	<div id="sg_option2" class="collapse" style="margin: 0 10px 15px 10px;">
		<table>
			<tr>
				<td><input class="check-box" type="checkbox" id="sg_option2_box" name="sg_option" value="반려동물" style="margin:5px 0 0 0;"></td>
				<td style="padding:0 0 0 8px;">반려 동물 동반</td>
			</tr>
		</table>
	</div>
	
	<input type="submit" class="btn btn-default btn2 mt-2" id="btn_cre" value="방 생성">


</form>

<script>


</script>

</body>
</html>