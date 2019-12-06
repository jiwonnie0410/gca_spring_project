$(document).ready(function(){
	
	document.getElementById('sg_end_day').min = new Date().toISOString().substring(0, 10); //마감 날짜
	siler();
	$('#sg_sport_div .dropdown-menu li').bind('click', sport_dropdown); //운동종목 드롭다운
	$('#sg_skill_div .dropdown-menu li').bind('click', skill_dropdown); //숙련도 드롭다운
	$('#sg_finish_div .dropdown-menu li').bind('click', end_cnt_dropdown); //마감인원 드롭다운
	$('#sg_location').on('click', sgAddr); //주소 입력
	$('#btn_cre').on('click', valid); //유효성 검사
	
	$('#G03').attr('checked','checked');
	
});

//운동종목 드롭다운
function sport_dropdown(){
	var html = $(this).html();
	$('#sg_sport').html(html +'<span class="caret pl-2"></span>');
	$('#sg_sport_val').val($(this).data("cdid"));
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
}

//숙련도 드롭다운
function skill_dropdown(){
	var html = $(this).html();
	$('#sg_skill').html(html +'<span class="caret pl-2"></span>');
	$('#sg_sport_val').val($(this).data("cdid"));
}

//마감인원 드롭다운
function end_cnt_dropdown(){
	var html = $(this).html();
	$('#sg_finish').html(html +'<span class="caret pl-2"></span>');
	$('#sg_finish').val($('#sg_finish').text().substr(0,1));
}

//주소 입력
function sgAddr() {
	
	//카카오맵 API로 변수 만들기
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
		if (status === kakao.maps.services.Status.OK)
			$('#sg_location').val(result[0].address.address_name);
	}
	
	//다음 주소 API로 주소 받아 주소 입력
	new daum.Postcode({
		oncomplete : function(data) {
			var addr = data.address;
			document.getElementById("sg_location").value = addr;
			geo.addressSearch(data.address, function(results, status) {
				if (status === daum.maps.services.Status.OK) {
					var result = results[0];
					var coords = new daum.maps.LatLng(result.y, result.x); //좌표값 받음
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

//이중 슬라이더
function siler(){
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

	var age1, age2;
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
	});
}

//유효성 검증------------------------------------------------------------------------------
function valid(){
	name_valid(); //반짝 방 이름 검사
	sport_valid(); //운동 종목, 숙련도 유효성 검사
    day_valid(); //마감날짜, 마감시간 유효성 검사
    if(location_valid() == false) return; //장소 유효성 검사
	cnt_reval(); //인원 val값 변경
	age_reval(); //연력대 val값 변경
	
	$('#frm').submit();
}

//반짝 방 이름 유효성 검사
function name_valid(){
	$('#sg_name_valid').show();
	var str = document.getElementById('sg_name').value;
	var blank_pattern = /^\s+|\s+$/g;
	if( str.replace( blank_pattern, '' ) == "" ){
		$('#sg_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>공백만 입력되었습니다. 다시 입력해 주세요.');
		return false;
	} else {
		var maxByte = 100; //최대 입력 바이트 수
		var rbyte = 0; rlen = 0;
		var one_char = ""; str2 = "";	
		for (var i=0; i<str.length; i++) {
			one_char = str.charAt(i);
			if (escape(one_char).length > 4) rbyte += 3; //한글3Byte
			else rbyte++; //영문 등 나머지 1Byte
			if (rbyte <= maxByte) rlen = i + 1; //return할 문자열 갯수
		}
		if(rbyte > maxByte) {
			$('#sg_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>한글과 특수문자는 33자, 영문과 숫자는 100자를 초과하여 입력할 수 없습니다.');
			return false;
		} else if(rbyte <= 6){
			$('#sg_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>한글 3자, 영문 9자 이상 입력해 주세요.');
			return false;
		}
	}
	$('#sg_name_valid').hide();
}

//운동종목, 숙련도 유효성 검사
function sport_valid(){
	$('#sg_sport_valid').show();
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
    } else {
	    //숙련도 val값 변경(입문 이상 -> 입문)
    	var skill_rename = $('#sg_skill').val().substring(0,2);
    	$('#sg_skill').val(skill_rename);
    }
	$('#sg_sport_valid').hide();
}

//마감날짜, 마감시간 유효성 검사
function day_valid(){
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
}

//장소 유효성 검사
function location_valid(){
	if( $('#sg_location').val() == "" || $('#sg_location').val() == null){
		$('#sg_location_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>만날 장소를 입력해 주세요.');
		return false;
	}
	$('#sg_location_valid').hide();
}

//인원 유효성 검사
function cnt_reval(){
	if( $('#sg_finish').val() == "" || $('#sg_finish').val() == null ){
		$('#sg_finish_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>모집 인원을 선택해 주세요.');
		return false;
	} else {
		//참여 인원 val값 변경 (2명 -> 2)
		var finish_rename = $('#sg_finish').val().substring(0,1);
		$('#sg_finish').val(finish_rename);
	}
	$('#sg_finish_valid').hide();
}

//연력대 val값 변경(20대 이상 모든 연령대 -> 20대~ / 30대만 -> 30대 / 20대 이상 ~ 60대 미만 -> 20대~60대)
function age_reval(){
	var age_rename = $('#sg_age').val();
	if(age_rename.indexOf('~') != -1){
		var ageAry = age_rename.split('~');
		var ageAry1 = ageAry[0].substring(0,3);
		var ageAry2 = ageAry[1].substring(1,4);
		age_rename = ageAry1 + "~" + ageAry2;
	} else {
		age_rename = age_rename.substring(0,3);
	}
	$('#sg_age').val(age_rename);
}