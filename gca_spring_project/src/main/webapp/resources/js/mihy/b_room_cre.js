$(document).ready(function(){
	
	document.getElementById('bg_end_day').min = new Date().toISOString().substring(0, 10); //마감 날짜
	siler();
	$('#bg_sport_div .dropdown-menu li').bind('click', sport_dropdown); //운동종목 드롭다운
	$('#bg_skill_div .dropdown-menu li').bind('click', skill_dropdown); //숙련도 드롭다운
	$('#bg_finish_div .dropdown-menu li').bind('click', end_cnt_dropdown); //마감인원 드롭다운
	$("#bg_team_cnt").keyup(function(){ //매치 인원 입력
		$("#bg_team_cnt_out").text($("#bg_team_cnt").val());
	});
	$('#map_location').on('click', addr); //주소 입력
	
	$('#btn_cre').on('click', valid); //유효성 검사
});

function onlyNumber(){
	$('#bg_teamcnt_valid').show();
	if( !( (event.keyCode >= 48 && event.keyCode<=57) 
			|| (event.keyCode >= 96 && event.keyCode <= 105)
			|| event.keyCode==8 )  ) {
		$('#bg_teamcnt_valid').text("숫자를 입력해 주세요.");
		event.returnValue=false;
	}
	$('#bg_teamcnt_valid').hide();
}

//운동종목 드롭다운
function sport_dropdown(){
	var html = $(this).html();
	$('#bg_sport').html(html +'<span class="caret pl-2"></span>');
	$('#bg_sport_val').val($(this).data("cdid"));
	var sport_name = $('#bg_sport').text();
}

//숙련도 드롭다운
function skill_dropdown(){
	var html = $(this).html();
	$('#bg_skill').html(html +'<span class="caret pl-2"></span>');
	$('#bg_skill_val').val($(this).data("cdid"));
}

//마감인원 드롭다운
function end_cnt_dropdown(){
	var html = $(this).html();
	$('#bg_finish').html(html +'<span class="caret pl-2"></span>');
	$('#bg_finish_val').val($('#bg_finish').text().substr(0,1));
}

//이중 슬라이더
function siler(){
	var skipSlider = document.getElementById('bg_age_bar');
	
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
		$('#bg_age').val(skipValues[0].innerHTML + skipValues[1].innerHTML)
	});
}

//유효성 검증------------------------------------------------------------------------------
function valid(){
	if(name_valid() == false) return; //동호회 매치 방 이름 검사
	if(sport_valid() == false) return; //운동 종목, 숙련도 유효성 검사
	if(day_valid() == false) return; //마감날짜, 마감시간 유효성 검사
    if(location_valid() == false) return; //장소 유효성 검사
    if(cnt_reval() == false) return; //인원 val값 변경
    age_reval(); //연령대 val값 변경
	
    var con=confirm("입력한 내용으로 동호회 매치 방을 생성하시겠습니까?");
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
    			location.href = 'alreadyIn?bg_num='+result.bg_num;
    		}
    	});
    	
    }
}

//동호회 매치 방 이름 유효성 검사
function name_valid(){
	$('#bg_name_valid').show();
	var str = document.getElementById('bg_name').value;
	var blank_pattern = /^\s+|\s+$/g;
	if( str.replace( blank_pattern, '' ) == "" ){
		$('#bg_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>공백만 입력되었습니다. 다시 입력해 주세요.');
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
			$('#bg_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>한글과 특수문자는 띄어쓰기 포함 33자, 영문과 숫자는 띄어쓰기 포함 100자를 초과하여 입력할 수 없습니다.');
			return false;
		} else if(rbyte <= 6){
			$('#bg_name_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>한글 3자, 영문 9자 이상 입력해 주세요.');
			return false;
		}
	}
	$('#bg_name_valid').hide();
}

//운동종목, 숙련도 유효성 검사
function sport_valid(){
	$('#bg_sport_valid').show();
		if( $('#bg_sport_val').val() == "" || $('#bg_sport_val').val().isNull ){
			if( $('#bg_skill_val').val() == "" || $('#bg_skill_val').val().isNull ){
				$('#bg_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>운동 종목과 숙련도를 선택해 주세요.');
				return false;
			}
			$('#bg_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>운동 종목을 선택해 주세요.');
			return false;
		} else if( $('#bg_skill_val').val() == "" || $('#bg_skill_val').val().isNull ){
			if( $('#bg_sport_val').val() == "" || $('#bg_sport_val').val().isNull ){
				$('#bg_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>운동 종목과 숙련도를 선택해 주세요.');
				return false;
			}
    	$('#bg_sport_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>숙련도를 선택해 주세요.');
    	return false;
    }
	$('#bg_sport_valid').hide();
}

//마감날짜, 마감시간 유효성 검사
function day_valid(){
	var now = new Date();
	if( $('#bg_end_day').val() == "" || $('#bg_end_day').val() == null ){
		if( $('#bg_end_time').val() == "" || $('#bg_end_time').val() == null ){
			$('#bg_end_valid').show();
			$('#bg_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 시간과 마감 날짜를 입력해 주세요.');
			return false;
		}
		$('#bg_end_valid').show();
		$('#bg_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 날짜를 입력해 주세요.');
		return false;
	} else if( $('#bg_end_time').val() == "" || $('#bg_end_time').val() == null ){
		if( $('#bg_end_day').val() == "" || $('#bg_end_day').val() == null ){
			$('#bg_end_valid').show();
			$('#bg_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 시간과 마감 날짜를 입력해 주세요.');
			return false;
		}
		$('#bg_end_valid').show();
		$('#bg_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>마감 시간을 입력해 주세요.');
		return false;
	} else {
		$('#bg_end_valid').hide();
		var date = new Date($('#bg_end_day').val());
		var day = date.getDate();
		var month = date.getMonth()+1;
		var year = date.getFullYear();
		
		var time = $('#bg_end_time').val() + ":00";
		var fulldate = year + "-" + month + "-" + day + " " + time;
		if( now >= new Date(fulldate)){
			$('#bg_end_valid').show();
			$('#bg_end_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>현재 날짜/시각 이후로 설정해 주세요.');
			return false;
		}
		$('#bg_end').val(fulldate);
	}
}

//장소 유효성 검사
function location_valid(){
	$('#bg_location_valid').show();
	if( $('#map_location').val() == "" || $('#map_location').val() == null){
		$('#bg_location_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>만날 장소를 입력해 주세요.');
		return false;
	}
	$('#bg_location_valid').hide();
}

//팀 구성인원 숫자 외 입력 시 불가 메시지 출력/미입력시 메시지 출력
function cnt_reval(){
	$('#bg_teamcnt_valid').show();
	if( $('#bg_team_cnt').val() == "" || $('#bg_team_cnt').val() == null ){
		$('#bg_teamcnt_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>팀 인원을 입력해 주세요.<br>');
		return false;
	}
	else if( isNaN($('#bg_team_cnt').val())  ) {
		$('#bg_teamcnt_valid').html('<i class="fas fa-exclamation-circle pr-1"></i>숫자만 입력할 수 있습니다.<br>');
		return false;
	}
	$('#bg_teamcnt_valid').hide();
}

//연령대 val값 변경(20대 이상 모든 연령대 -> 20대~ / 30대만 -> 30대 / 20대 이상 ~ 60대 미만 -> 20대~60대)
function age_reval(){
	var age_rename = $('#bg_age').val();
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
	$('#bg_age').val(age_rename);
	
}