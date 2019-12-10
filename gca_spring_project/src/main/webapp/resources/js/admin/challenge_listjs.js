$(function() {
	getChallengeList();
});

// 체크박스 하나만 선택 되게 하기 (복수 선택 방지)
function oneCheckbox(a){
    var obj = document.getElementsByName("cl_status");
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
			$('#addType').append('반짝 &nbsp;<input id="howMany" name="cl_cnt" type="text" size="2">번 참여 <br><font size="2">예) 반짝 3번 참여</font>');
		} 
		// 반짝 n가지 종목 참여
		else if(type == 'nKinds'){
			$('#addType').text('');
			$('#addType').append('반짝 &nbsp;<input id="howMany" name="cl_cnt" type="text" size="2">가지 종목 참여 <br><font size="2">예) 반짝 2가지 종목 참여</font>');
		} 
		// ㅁㅁ 종목 반짝 n번 참여
		else if(type == 'mKind_nTime'){
			$('#addType').text('');
			$('#addType').append('<select id="selectSports" name="sports1_cd" class="btn btn-outline-secondary btn-sm dropdown-toggle"> '  
									+'<option selected> 운동 선택 </option> '
									+'<option value="S01"> 농구 </option> '
									+'<option value="S02"> 달리기/산책 </option> '
									+'<option value="S03"> 등산 </option> '
									+'<option value="S04"> 배드민턴 </option> '
									+'<option value="S05"> 볼링 </option> '
									+'<option value="S06"> 수영 </option> '
									+'<option value="S07"> 자전거 </option> '
									+'</select>종목 반짝 <input type="text" id="howMany" name="cl_cnt" size="2">번 참여 '
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
	
	// 인풋값 다 들어왔는지 확인
	if (!document.getElementsByName("cl_status")[0].checked || !document.getElementsByName("cl_status")[1].checked) {
		alert("챌린지 구분을 선택해 주세요.");
		return false;
	}
	
	// 기본인지 스페셜인지 구분
	var checkBox = document.getElementsByName("cl_status");
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
	
	// 챌린지 이름을 위해 컬럼 값 합침
	var clName;
	if($('#challengeType').val() == 'nTime') { clName = "반짝 " + $('#howMany').val() + "번 참여"; }
	if($('#challengeType').val() == 'nKinds') { clName = "반짝 " + $('#howMany').val() + "가지 종목 참여"; }
	if($('#challengeType').val() == 'mKind_nTime') { clName = $('#selectSports') + " 종목 반짝 " + $('#howMany').val() + "번 참여"; }
	frm.cl_name.value = clName;
	
	// 챌린지 등록
	var param = JSON.stringify($("#createChallengeForm").serializeObject()); // ajax로 넘겨줄 데이터 한번에 담기
	$.ajax({
			url: "../ajax/createChallenge",
			method:'post',
			dataType: "json",
			data: param,
			contentType: "application/json",
			success: function(result) {
					console.log(result)
			}
	});
	
}

// 챌린지 목록 띄우기
function getChallengeList() {
	$.ajax({
		url : "../ajax/challengeList",
		dataType : "json",
		success : function(datas) {
			console.log("첫번째 챌린지 이름: " + datas[0].CL_NAME);
			
			for(i=0; i<datas.length; i++) {
				var status;
				if(datas[i].CL_STATUS == 'basic')
					status = '기본';
				else
					status = '스페셜';
				$("<tr data-toggle='modal' data-target='#challenge-going' style='cursor:pointer;'>")
						  .append("<td align='center'>"+ datas[i].CL_NUM +"</td>")
						  .append("<td align='center'>"+ status +"</td>")
						  .append("<td>"+ datas[i].CL_NAME +"</td>")
						  .append("<td align='center'>"+ datas[i].CL_START_DTTM +"</td>")
						  .append("<td align='center'>"+ datas[i].CL_END_DTTM +"</td>")
						  .append("<td align='center'>"+ datas[i].CL_SCORE +"점 </td>")
						  .appendTo($("#challenge-table"));
			}
		}
	});
}
