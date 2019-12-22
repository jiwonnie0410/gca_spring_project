/*
 * 지원
 * 1. 체크박스 하나만 선택 되게 하기 (복수 선택 방지)
 * 2. 챌린지 생성 모달에 챌린지 타입 선택하면 나오는 부분
 * 3. 챌린지 생성 버튼
 * 4. 챌린지 목록 띄우기
 * 5. 챌린지 진행 현황 (챌린지 번호 받아와서)
 */

$(function() {
	getChallengeList(1);
});

// 1. 체크박스 하나만 선택 되게 하기 (복수 선택 방지)
function oneCheckbox(a){
    var obj = document.getElementsByName("cl_status");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != a){
            obj[i].checked = false;
        }
    }
}

// 2. 챌린지 생성 모달에 챌린지 타입 선택하면 나오는 부분
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

// 3. 챌린지 생성 버튼
function createChallengeButton(){
	var frm = document.createChallengeForm;
	
	// 인풋값 다 들어왔는지 확인
	if (!document.getElementsByName("cl_status")[0].checked && !document.getElementsByName("cl_status")[1].checked) {
		alert("챌린지 구분을 선택해 주세요.");
		return false;
	}
	if ($('#startDate').val() == ''){
		alert("챌린지 시작 날짜를 선택해 주세요.");
		return false;
	}
	if ($('#endDate').val() == ''){
		alert("챌린지 마감 날짜를 선택해 주세요.");
		return false;
	}
	if ($('#selectScore').val() == '점수 선택'){
		alert("챌린지 리워드 점수를 선택해 주세요.");
		return false;
	}
	if ($('#challengeType').val() == 'nothing'){
		alert("챌린지 타입을 선택하고 성공 기준을 입력해 주세요.");
		return false;
	}
	if ($('#challengeType').val() != '타입 선택' && $('#howMany').val() == ''){
		alert("챌린지 성공 기준을 입력해 주세요.");
		return false;
	}
	if ($('#challengeType').val() == 'mKind_nTime' && $('#selectSports').val() == ''){
		alert("챌린지 종목을 선택해 주세요.");
		return false;
	}
	if ($('#challengeContent').val() == ''){
		alert("사용자에게 보여줄 챌린지 내용을 입력해 주세요.");
		return false;
	}
	
	// 챌린지 이름을 위해 컬럼 값 합침
	var clName;
	if($('#challengeType').val() == 'nTime') { clName = "1. 반짝 " + $('#howMany').val() + "번 참여"; }
	if($('#challengeType').val() == 'nKinds') { clName = "3. 반짝 " + $('#howMany').val() + "가지 종목 참여"; }
	if($('#challengeType').val() == 'mKind_nTime') {
		// 선택한 운동종목의 value값이 아닌 텍스트 가져오기
		var target = document.getElementById("selectSports");
		var sportsText = target.options[target.selectedIndex].text;
		clName = "2. " + sportsText + " 종목 반짝 " + $('#howMany').val() + "번 참여"; 
	}
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
					var status;
					if(result.CL_STATUS == 'basic')
						status = '기본';
					else
						status = '스페셜';
					
					var clName = result.cl_name.substr(3);
					
					var newTd = "<tr data-toggle='modal' data-target='#challenge-going' id='newTr'>"
								+ "<td align='center'>"+ result.cl_num +"</td>"
								+ "<td align='center'>"+ status +"</td>"
								+ "<td>"+ clName +"</td>"
								+ "<td align='center'>"+ result.cl_start_dttm +"</td>"
								+ "<td align='center'>"+ result.cl_end_dttm +"</td>"
								+ "<td align='center'>"+ result.cl_score +"점 </td>";
					$('#tr').after(newTd);
					
			}
	});
	
	$('#challenge-create').modal('hide');
}

// 4. 챌린지 목록 띄우기
function getChallengeList(p) {
	$.ajax({
		url : "../ajax/challengeList",
		dataType : "json",
		data: {page:p, searchCondition:$('#searchCondition').val(), keyword:$('#keyword').val()},
		success : function(dataes) {
			// 현재 날짜 가져오기
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1;
			var yyyy = today.getFullYear();
			if(dd<10) { dd='0'+dd } 
			if(mm<10) { mm='0'+mm } 
			today = yyyy+'-'+mm+'-'+dd;
			
			var datas = dataes.list;
			// 테이블 내용 한번 비우기 (이렇게 하지 않으면 내용이 누적돼서 나옴)
			$("#challenge-table").empty();
			$("<tr id='tr' align='center' style='background-color:#FEBABA;'>")
						  .append("<th width='5%'> NO </th>")
						  .append("<th width='10%'> 구분 </th>")
						  .append("<th width='40%'> 챌린지 이름 </th>")
						  .append("<th width='17%'> 시작 날짜 </th>")
						  .append("<th width='17%'> 마감 날짜 </th>")
						  .append("<th width='10%'> 리워드 </th></tr>")
						  .appendTo($("#challenge-table"));
			// 챌린지 목록 테이블에 붙이기
			for(i=0; i<datas.length; i++) {
				var status;
				if(datas[i].cl_status == 'basic')
					status = '기본';
				else
					status = '스페셜';
				
				if(datas[i].cl_end_dttm > today){ // 마감 안 된 챌린지
					$("<tr data-toggle='modal' data-target='#challenge-going' id='newTr' onclick='getKey("+datas[i].cl_num+")'>")
					  .append("<td align='center'>"+ datas[i].cl_num +"</td>")
					  .append("<td align='center'>"+ status +"</td>")
					  .append("<td>"+ datas[i].cl_name +"</td>")
					  .append("<td align='center'>"+ datas[i].cl_start_dttm +"</td>")
					  .append("<td align='center'>"+ datas[i].cl_end_dttm +"</td>")
					  .append("<td align='center'>"+ datas[i].cl_score +"점 </td>")
					  .appendTo($("#challenge-table"));
				}
				else { // 마감된 챌린지
					$("<tr data-toggle='modal' data-target='#challenge-going' id='endTr' onclick='getKey("+datas[i].cl_num+")'>")
					  .append("<td align='center'>"+ datas[i].cl_num +"</td>")
					  .append("<td align='center'>"+ status +"</td>")
					  .append("<td><strike>"+ datas[i].cl_name +"</strike></td>")
					  .append("<td align='center'>"+ datas[i].cl_start_dttm +"</td>")
					  .append("<td align='center'>"+ datas[i].cl_end_dttm +"</td>")
					  .append("<td align='center'>"+ datas[i].cl_score +"점 </td>")
					  .appendTo($("#challenge-table"));
				}
				
			}
			
			// 시작하는 페이지가 1보다 크면 이전페이지로 갈 때 -1, 아니면 그냥 1페이지로 남아있음
			var num = dataes.paging.startPage
			if(dataes.paging.startPage > 1){
				num = num - 1;
			} else{
				num = 1;
			}
			$('.page-link').first().attr('href', 'javascript:getChallengeList('+ num +')') // 이전 페이지
			$('.page-link').last().attr('href', 'javascript:getChallengeList('+ (dataes.paging.startPage + 1) +')') // 다음 페이지
			
			// 페이지 번호 비우기 (누적 방지)
			$('.page-link:not(:first(), :last())').remove();
			
			// 페이지 번호 매기기
			var page = dataes.paging;
			for(i=1; i<=page.endPage; i++){
				$("<li class='page-item'><a class='page-link' href='#' onclick='getChallengeList("+ i +")'>"+i+"</a></li>").insertBefore($('.page-item').last());
			}
		}
	});
}

// 5. 챌린지 진행 현황 (챌린지 번호 받아와서)
function getKey(cl_num) {
	var num_data = {"cl_num":cl_num};
	// 챌린지 진행 현황
	$.ajax({
			url: "../ajax/challenge/going",
			data: num_data,
			success: function(result) {
				console.log(result);
					$("#chGoing").empty();
					$("#chPeople").empty();
				
					var status;
					if(result.detail.CL_STATUS == 'basic')
						status = '기본 챌린지';
					else
						status = '스페셜 챌린지';
					// 챌린지 상세 정보 띄우기
					$("<tr>").append("<td align='center' width='60%'><div id='challenge-title'><b>"+ result.detail.CL_NUM + "번째  " + status + ": " + result.detail.CL_NAME + "하기</b></div></td>")
							 .appendTo($("#chGoing"));
					
					$("<tr>").append("<td><div id='challenge-detail'><b>리워드 | &nbsp;&nbsp;&nbsp;"+ result.detail.CL_SCORE +"점</b></div></td>")
							 .appendTo($("#chGoing"));
					
					$("<tr>").append("<td><div id='challenge-detail'><b>기 간 &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;"+ result.detail.CL_START_DTTM + " ~ " + result.detail.CL_END_DTTM +"</b></div></td>")
					.appendTo($("#chGoing"));
					
					$("<tr>").append("<td><div id='challenge-detail' style='height=45px;'><b>내 용 &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;"+ result.detail.CL_CONTENT +"</b></td>")
							 .appendTo($("#chGoing"));
					
					// 챌린지에 참여 중인 사람들 띄우기
					if(result.people.length == 0){
						$("<tr>").append("<td align='center'><div id='challenge-people'> 참여 중인 회원이 없습니다. </div></td>")
						.appendTo($("#chPeople"));
					}
					else {
						for(i=0; i<result.people.length; i++) {
							$("<tr>").append("<td><div id='challenge-people'> ("+ result.people[i].M_ID + ") &nbsp;&nbsp;&nbsp;" + result.people[i].M_NAME + " 님 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + result.people[i].M_AGE +"세 &nbsp;&nbsp;&nbsp;" + result.people[i].CD_NAME + " &nbsp;&nbsp;&nbsp;" + result.people[i].CLH_CNT +"회 참여</td></tr>")
							.appendTo($("#chPeople"));
						}
					}
			}
	});

}
