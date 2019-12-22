$(document).ready(function(){
	
	document.getElementById('six_end_day').min = new Date().toISOString().substring(0, 10); //마감 날짜
	siler();
	$('#six_sport_div .dropdown-menu li').bind('click', sport_dropdown); //운동종목 드롭다운
	$('#six_skill_div .dropdown-menu li').bind('click', skill_dropdown); //숙련도 드롭다운
	$('#six_finish_div .dropdown-menu li').bind('click', end_cnt_dropdown); //마감인원 드롭다운
	$('#map_location').on('click', addr); //주소 입력
	
	$('#btn_cre').on('click', valid); //유효성 검사
	
});


//운동종목 드롭다운
function sport_dropdown(){
	var html = $(this).html();
	$('#six_sport').html(html +'<span class="caret pl-2"></span>');
	$('#six_sport_val').val($(this).data("cdid"));
	var sport_name = $('#six_sport').text();
}

//숙련도 드롭다운
function skill_dropdown(){
	var html = $(this).html();
	$('#six_skill').html(html +'<span class="caret pl-2"></span>');
	$('#six_skill_val').val($(this).data("cdid"));
}

//마감인원 드롭다운
function end_cnt_dropdown(){
	var html = $(this).html();
	$('#six_finish').html(html +'<span class="caret pl-2"></span>');
	$('#six_finish_val').val($('#six_finish').text().substr(0,1));
}

//이중 슬라이더
function siler(){
	var skipSlider = document.getElementById('six_age_bar');
	
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
		$('#six_age').val(skipValues[0].innerHTML + skipValues[1].innerHTML)
	});
}


//유효성 검증------------------------------------------------------------------------------
function valid(){
	if(name_valid() == false) return; //용병 모집 방 이름 검사
	if(sport_valid() == false) return; //운동 종목, 숙련도 유효성 검사
	if(day_valid() == false) return; //마감날짜, 마감시간 유효성 검사
    if(location_valid() == false) return; //장소 유효성 검사
    if(cnt_reval() == false) return; //인원 val값 변경
    age_reval(); //연령대 val값 변경
	
    var con=confirm("입력한 내용으로 용병 모집 방을 생성하시겠습니까?");
    if(con){
    	var param = $('#frm').serialize();
    	$.ajax({
    		url : "creRoom",
    		method : "post",
    		data : param,
    		success : function(result){
    			msg = {
    					cmd : "groupAlert",
    					alert_gnum : result.alert_gnum
    			}
    			webSocket.send( JSON.stringify( msg ) );
    			location.href = 'alreadyIn?six_num='+result.six_num;
    		}
    	});
    }
}

//용병 모집 방 이름 유효성 검사
function name_valid(){
	$('#six_name_valid').show();
	var str = document.getElementById('six_name').value;
	var blank_pattern = /^\s+|\s+$/g;
	if( str.replace( blank_pattern, '' ) == "" ){
		$('#six_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>공백만 입력되었습니다. 다시 입력해 주세요.');
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
			$('#six_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>한글과 특수문자는 33자, 영문과 숫자는 100자를 초과하여 입력할 수 없습니다.');
			return false;
		} else if(rbyte <= 6){
			$('#six_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>한글 3자, 영문 9자 이상 입력해 주세요.');
			return false;
		}
	}
	$('#six_name_valid').hide();
}

//운동종목, 숙련도 유효성 검사
function sport_valid(){
	$('#six_sport_valid').show();
		if( $('#six_sport_val').val() == "" || $('#six_sport_val').val().isNull ){
			if( $('#six_skill_val').val() == "" || $('#six_skill_val').val().isNull ){
				$('#six_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>운동 종목과 숙련도를 선택해 주세요.');
				return false;
			}
			$('#six_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>운동 종목을 선택해 주세요.');
			return false;
		} else if( $('#six_skill_val').val() == "" || $('#six_skill_val').val().isNull ){
			if( $('#six_sport_val').val() == "" || $('#six_sport_val').val().isNull ){
				$('#six_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>운동 종목과 숙련도를 선택해 주세요.');
				return false;
			}
    	$('#six_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>숙련도를 선택해 주세요.');
    	return false;
    }
	$('#six_sport_valid').hide();
}

//마감날짜, 마감시간 유효성 검사
function day_valid(){
	if( $('#six_end_day').val() == "" || $('#six_end_day').val() == null ){
		if( $('#six_end_time').val() == "" || $('#six_end_time').val() == null ){
			$('#six_end_valid').show();
			$('#six_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 시간과 마감 날짜를 입력해 주세요.');
			return false;
		}
		$('#six_end_valid').show();
		$('#six_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 날짜를 입력해 주세요.');
		return false;
	} else if( $('#six_end_time').val() == "" || $('#six_end_time').val() == null ){
		if( $('#six_end_day').val() == "" || $('#six_end_day').val() == null ){
			$('#six_end_valid').show();
			$('#six_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 시간과 마감 날짜를 입력해 주세요.');
			return false;
		}
		$('#six_end_valid').show();
		$('#six_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 시간을 입력해 주세요.');
		return false;
	} else {
		$('#six_end_valid').hide();
		var date = new Date($('#six_end_day').val());
		var day = date.getDate();
		var month = date.getMonth()+1;
		var year = date.getFullYear();
		
		var time = $('#six_end_time').val() + ":00";
		var fulldate = year + "-" + month + "-" + day + " " + time;
		$('#six_end').val(fulldate);
	}
}

//장소 유효성 검사
function location_valid(){
	$('#six_location_valid').show();
	if( $('#map_location').val() == "" || $('#map_location').val() == null){
		$('#six_location_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>만날 장소를 입력해 주세요.');
		return false;
	}
	$('#six_location_valid').hide();
}

//인원 유효성 검사
function cnt_reval(){
	$('#six_finish_valid').show();
	if( $('#six_finish_val').val() == "" || $('#six_finish_val').val() == null ){
		$('#six_finish_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>모집 인원을 선택해 주세요.');
		return false;
	}
	$('#six_finish_valid').hide();
}

//연령대 val값 변경(20대 이상 모든 연령대 -> 20대~ / 30대만 -> 30대 / 20대 이상 ~ 60대 미만 -> 20대~60대)
function age_reval(){
	var age_rename = $('#six_age').val();
	if(age_rename.indexOf('~') != -1){
		var ageAry = age_rename.split('~');
		var ageAry1 = ageAry[0].substring(0,3);
		var ageAry2 = ageAry[1].substring(1,4);
		age_rename = ageAry1 + "~" + ageAry2;
	} else if(age_rename.indexOf('모든 연령대') != -1) {
		age_rename = age_rename.substring(0,3) + "~";
	} else {
		age_rename = age_rename.substring(0,3);
	}
	$('#six_age').val(age_rename);
	
}