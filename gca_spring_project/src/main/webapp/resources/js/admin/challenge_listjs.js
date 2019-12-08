// 체크박스 하나만 선택 되게 하기 (복수 선택 방지)
function oneCheckbox(a){
    var obj = document.getElementsByName("checkbox1");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != a){
            obj[i].checked = false;
        }
    }
}

// 챌린지 생성 모달에 챌린지 타입 선택하면 나오는 부분
$(function(){
	$('#challengeType').change(function(){
		var type = $('#challengeType option:selected').val();
		// 반짝 n번 참여
		if(type == 'nTime'){
			$('#addType').text('');
			$('#addType').append('반짝 &nbsp;<input id="howMany" type="text" size="2">번 참여 <br><font size="2">예) 반짝 3번 참여</font>');
		} 
		// 반짝 n가지 종목 참여
		else if(type == 'nKinds'){
			$('#addType').text('');
			$('#addType').append('반짝 &nbsp;<input id="howMany" type="text" size="2">가지 종목 참여 <br><font size="2">예) 반짝 2가지 종목 참여</font>');
		} 
		// ㅁㅁ 종목 반짝 n번 참여
		else if(type == 'mKind_nTime'){
			$('#addType').text('');
			$('#addType').append('<select id="selectSports" name="selectSports" class="btn btn-outline-secondary btn-sm dropdown-toggle"> '  
									+'<option selected> 운동 선택 </option> '
									+'<option value="S01"> 농구 </option> '
									+'<option value="S02"> 달리기/산책 </option> '
									+'<option value="S03"> 등산 </option> '
									+'<option value="S04"> 배드민턴 </option> '
									+'<option value="S05"> 볼링 </option> '
									+'<option value="S06"> 수영 </option> '
									+'<option value="S07"> 자전거 </option> '
									+'</select>종목 반짝 <input type="text" id="howMany" size="2">번 참여 '
									+'<br><font size="2">예) 자전거 종목 반짝 2번 참여</font>');
		}
		// 선택 기본 암것도 없을 때
		else if(type == 'nothing'){
			$('#addType').text();
		}
	});
});
				
// 챌린지 생성 버튼
function createChallengeButton(){
	var frm = document.createChallengeForm;
	
	// 기본인지 스페셜인지 구분
	var checkBox = document.getElementsByName("checkbox1");
	if(checkBox[0].checked)
		console.log('basic')
	else if(checkBox[1].checked)
		console.log('special')
	
	// 시작-마감 날짜 받아오기
	console.log($('#startDate').val())
	console.log($('#endDate').val())
	
	// 점수 받아오기
	console.log($('#selectScore').val())
	
	// 타입 받아오기
	console.log($('#challengeType').val())
	console.log($('#selectSports').val())
	console.log('몇번 ' + $('#howMany').val())
	
	
	$.ajax({
		url: "/ajax/createChallenge",
		dataType: "json",
		success: function(result) {
//				frm.submit();
				
		}
	});
	
	
	//frm.submit();
}