<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매치 대기방s</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />

<!-- 미현 : 인증 참여 스크립트 / 지도 스크립트 추가 -->
<script type="text/javascript" src="../resources/js/mihy/part_cert.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>
<script type="text/javascript" src="../resources/js/mihy/kakao_map2.js"></script>
<!-- 미현 끝  -->


<style>

	body {
		margin: 0;
	}
	
	div { text-align: center; padding-top:30px; }
	
	
	
	#over img {
		margin-left: auto;
		margin-right: auto;
		display: block;
	}
	
	
	.button-title {
	  background: #fff;
	  border: 3px solid #FE9191;
	  border-radius: 7px;
	  color: #FE9191;
	  font-size: 15px;
	  font-weight: bold;
	  margin: 0.3em auto;
	  padding: 2px 6px;
	  position: relative;
	  text-transform: uppercase;
	  width: 100%;
	}
		
	.button-general {
	  background: #FE9191;
	  border: 3px solid #fff;
	  border-radius: 7px;
	  color: #fff;
	  font-size: 15px;
	  font-weight: bold;
	  margin: 0.3em auto;
	  padding: 3px 9px;
	  position: relative;
	  text-transform: uppercase;
	  height: 40px;
	}
	
	.button-general {
	  background: #FE9191;
	  border: 3px solid #fff;
	  border-radius: 7px;
	  color: #fff;
	  font-size: 15px;
	  font-weight: bold;
	  margin: 0.3em auto;
	  padding: 3px 9px;
	  position: relative;
	  text-transform: uppercase;
	  height: 40px;
	}
	
	.wrap{
	     width: 1000px;
	     height: 300px;
	     overflow-x: scroll;
	     white-space:nowrap;
	   }
	   
	div#room-info-div.modal-body{
		text-align : left;
	}
	
	table#room-info-table th{
		width: 80px;
		height: 30px;
		border-right: 3px solid;
	}

	table#room-info-table td{
		padding-left: 15px;
	}
	
	table#profile-table{
		border: 2px solid #FE9191;
		border-radius: 7px;
		border-collapse: separate;
	}
	
</style>

<!-- 로그인한사람의 id저장 -->
<sec:authentication property="principal.username" var="id"/>


<!-- 카카오톡 -->		
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 진영 sns공유 스크립트 -->
<script type="text/javascript">

	//페이스북 공유하기
	function sharefacebook(url) {  
		window.open("http://www.facebook.com/sharer/sharer.php?u=" + url);  
	}  
	
	function sharetwitter(url, text) {  
		window.open("https://twitter.com/intent/tweet?text=" + text + "&url=" + url);  
	} 

	// 카카오톡 공유하기
	function shareKakaotalk() {
		Kakao.init("ce5d5303904f527a3231bf1760ccfc03");      // 사용할 앱의 JavaScript 키를 설정
		Kakao.Link.sendDefault({
				objectType:"feed"
				, content : {
							title:"gca"   // 콘텐츠의 타이틀
							, description:"동네 친구와 운동을....--설명 추가하기"   // 콘텐츠 상세설명
							, imageUrl:"${pageContext.request.contextPath }/images/bok/sns_logo.png"   // 썸네일 이미지
							, link : {
								mobileWebUrl:"http://39.116.34.40/gca/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
								, webUrl:"http://39.116.34.40/gca/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
							}
				}
				, social : {
							likeCount:0       // LIKE 개수
							, commentCount:0    // 댓글 개수
							, sharedCount:0     // 공유 회수
				}
				, buttons : [{
							title:"게시글 확인"    // 버튼 제목
							, link : {
								mobileWebUrl:"http://39.116.34.40/gca/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
								, webUrl:"http://39.116.34.40/gca/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
							}
				}]
		});
	}

	// send to SNS
	function toSNS(sns, strTitle, strURL) {
		var snsArray = new Array();
		var strMsg = strTitle + " " + strURL;
		var image = "${pageContext.request.contextPath }/images/bok/sns_logo.png";  // 썸네일 이미지
	
		snsArray['band'] = "http://band.us/plugin/share?body="
			+ encodeURIComponent(strTitle) + "  "
			+ encodeURIComponent(strURL) + "&route="
			+ encodeURIComponent(strURL);
		snsArray['line'] = "http://line.me/R/msg/text/?"
			+ encodeURIComponent(strTitle) + " "
			+ encodeURIComponent(strURL);
		snsArray['google'] = "https://plus.google.com/share?url="
			+ encodeURIComponent(strURL) + "&t="
			+ encodeURIComponent(strTitle);
			window.open(snsArray[sns]);
	}
	
	
	/*원하는 sns가 없을 경우 url 복사하여 공유  */
	function copy_clip(url) {
		var IE = (document.all) ? true : false;
		if (IE) {
			window.clipboardData.setData("Text", url);
			alert("이 글의 단축url이 클립보드에 복사되었습니다.");
		} else {
			temp = prompt("이 글의 단축url입니다. Ctrl+C를 눌러 클립보드로 복사하세요", url);/*기본으로 로그인 화면 연결  */
		}
	}
</script>
<!-- 진영 sns공유 스크립트 끝 -->

<script>
		$(function() { //페이지 로딩 완료 후 실행

			var usrId = "${id}";

			var chatList = ${chatlist} ;
			var textarea = document.getElementById('messageWindow');
			for(var i = 0; i< chatList.length; i++){
				textarea.value += chatList[i].m_id + " : " + chatList[i].chh_content + "\n";
			}
			
			//채팅 전송버튼 눌렀을때
			$("body").on("click", "[id^=chat]", function() {

				send();
				
				insertChat();

			});

			
			//프로필 눌렀을때
			$('#profile').on('show.bs.modal', function (event) {
				var profileId = $(event.relatedTarget).attr('id'); //해당 모달을 띄운 프로필의 id
				var bg_num = ${bgroup.bg_num};
				var param = JSON.stringify({"m_id" : profileId});
				var param2 = JSON.stringify({"m_id" : usrId, "bg_num" : bg_num });
				
				//ajax1. id로 그사람 프로필 가져오기
				$.ajax({
					url: "getOneProfile",
					method:'post',
					dataType: "json",	//결과타입
					data: param,		//요청파라미터
					contentType: "application/json",
					success: function(vo){
						var img = $(event.relatedTarget).children('img').attr('src');
						$('#profile_image').children('img').attr('src',img);
						$('#profile_id').text(vo.m_id);
						$('#profile_nick').text(vo.m_nick);
						$('#profile_age').text(vo.m_age);
						$('#profile_gender').text(vo.gender_cd); //남여로 표시되게2
						
						//본인 프로필 창이면 버튼 영역(신고,강퇴) 숨기기.
						if(vo.m_id == "${id}"){
							$('.modal-footer').hide();
						}
					}
				});
				
				//ajax2. id로 그사람이 방장인지 멤버인지 가져오기
				$.ajax({
					url: "getOnesAuthority",
					method:'post',
					dataType: "json",	//결과타입
					data: param2,		//요청파라미터
					contentType: "application/json",
					success: function(vo){
						//방장 아니면 강퇴버튼 삭제해버리기.
						if(vo.ach_grant == "일반"){
							$('#kickOut').remove();
						}
					}
				});
				
				//ajax3. 점수 합계 계산해서 레벨 불러오기
				$.ajax({
					url: "getOnesLevel",
					method:'post',
					dataType: "json",	//결과타입
					data: param,		//요청파라미터
					contentType: "application/json",
					success: function(vo){
						$('#profile_level').children('img').attr('src',
								"${pageContext.request.contextPath }/resources/images/level/"+vo.m_level_cd+".png"	
						); //레벨이 이미지로 표시되게
					}
				});
			});
			
			//프로필 모달 닫혔을때(프로필 모달 열릴때 HIDE했던 modal-footer를 다시 보이게.)
			$('#profile').on('hidden.bs.modal', function (event) {
				$('.modal-footer').show();
			});
			
			//신고모달 눌렀을때
			$('#report-user').on('show.bs.modal', function (event) {
				var troubleId = $(event.relatedTarget).parent().parent().children('.modal-body')
						.children('#profile-table').find('#profile_id').html(); //해당 모달을 띄운 프로필의 id
				$('input[name=tr_mid]').val(troubleId);
			});
			
			//신고모달에서 신고하기 버튼 눌렀을 때
			$("body").on("click", "[id^=doReport]", function() {

				var confirmStatus = confirm("정말로 신고 하시겠습니까?");

				if (confirmStatus) {
					
					var param = JSON.stringify($("#report-frm").serializeObject());
					
					$.ajax({
						url: "doReport",
						method:'post',
						dataType: "json",	//결과타입
						data: param,		//요청파라미터
						contentType: "application/json",
						//컨트롤러로 데이타 보낼때 제이슨이라는 것을 알려줘야함. 컨트롤러에는 담을 vo에@RequestBody붙여주고.
						success: function(){
							alert("신고 처리 되었습니다.");
						}						
					});
					
					$('#profile').modal('hide'); //프로필 모달창 까지 닫기
				}
			});
			
			
			//프로필모달에서 강퇴 버튼 눌렀을 때
			$("body").on("click", "[id^=kickOut]", function() {

				//웹소켓으로 방정보 업데이트(인원수,방상태), 프로필 칸에서 삭제, 활동히스토리 DELETE, 해당 사람은 목록으로 돌아가게.
				var confirmStatus = confirm("정말로 강퇴 하시겠습니까?");

				if (confirmStatus) {
					
					var kickId = $('#profile_id').html();
					var bgNum = ${bgroup.bg_num};
					
					var param = JSON.stringify({"m_id" : kickId, "bg_num" : bgNum});
					
					$.ajax({
						url: "kickOut",
						method:'post',
						dataType: "json",	//결과타입
						data: param,		//요청파라미터
						contentType: "application/json",
						//컨트롤러로 데이타 보낼때 제이슨이라는 것을 알려줘야함. 컨트롤러에는 담을 vo에@RequestBody붙여주고.
						success: function(){
							alert("강퇴 처리 되었습니다.");
							deleteProfileKO(kickId); //웹소켓 후 처리에서 해당 아이디만 페이지 이동시켜야함.
						}						
					});
					
					$('#profile').modal('hide'); //프로필 모달창 닫기
				}
			});
			
			
			//참가취소 버튼 눌렀을때
			$("body").on("click", "[id^=cancelJoin]", function() {

				//웹소켓으로 방정보 업데이트(인원수,방상태), 본인프로필 화면에서 삭제, 활동히스토리 DELETE, 본인은 목록으로 돌아가게.
				var confirmStatus = confirm("정말로 반짝 참여를 취소 하시겠습니까?");

				if (confirmStatus) {
					
					var bgNum = ${bgroup.bg_num};
					var param = JSON.stringify({"m_id" : usrId, "bg_num" : bgNum });
					
					//id로 그사람이 방장인지 멤버인지 가져오기
					$.ajax({
						url: "getOnesAuthority",
						method:'post',
						dataType: "json",
						data: param,
						contentType: "application/json",
						success: function(vo){
							if(vo.ach_grant == "방장"){
								if(vo.ach_confirm != null){
									alert("인증 후에는 참가 취소를 할 수 없습니다!");
								}else{
									alert("방장은 참가취소를 할 수 없습니다!");
								}
							}
							//웹소켓으로  본인프로필 화면에서 삭제, 방정보 업데이트(인원수,방상태), 활동히스토리 DELETE, 본인은 목록으로 돌아가게.
							if(vo.ach_grant == "일반"){
								if(vo.ach_confirm != null){
									alert("인증 후에는 참가 취소를 할 수 없습니다!");
								}else{
									deleteProfile();
									location.href='cancelJoin?m_id='+usrId+'&bg_num='+bgNum;
									alert("참가 취소 완료.");
								}
							}
						}
					});
				}
			});
			
			//목록으로 돌아가기
			$('#backToList').on('click', function(){
				if("${param.endroom}" == "마감"){
					location.href='getBgListEnd';
				}else{
					location.href='getBgList';
				}
			});
			
			//방정보 텍스트 복사
			$('#copy').on('click', function(){
				var tempText = document.createElement('textarea');
				var sportName = "${bgroup.sports2_cd}";
				var verses = ${bgroup.bg_team_cnt};
				var place = "${bgroup.bg_location}";
				var beforetime = "${bgroup.bg_end_dttm}";
				var aftertime = beforetime.substring(0, 16);
				var age = "${bgroup.age_range}";
				var gender = "${bgroup.gender_cd}";
				tempText.value = "<"+sportName + " " + verses + " vs " + verses + ">" + "\n"
								+ "장소 : " + place + "\n" + "시간 : " + aftertime +"\n"
								+ "조건 : " + age + " " + gender;
				document.body.appendChild(tempText);
				
				tempText.select();
				document.execCommand("copy");
				document.body.removeChild(tempText);
				
				alert("복사되었습니다.");
			});
			
			//미현
			view_map();
			
		});
</script>

</head>
<body>
<!-- 버튼영역 위(프로필까지)의 div 시작 -->
    <div style="padding-top:0px;">
    
    <input type="hidden" id="bg_num_search" value="${bgroup.bg_num }">
    
	<!-- 방제 -->
    	<div style="background-color: #FE9191; text-align: left; padding-left:20px; color: #fff;"> 
      		<span id="title">${bgroup.bg_name }</span><br />
      		<span id="endDate"><fmt:formatDate value="${bgroup.bg_end_dttm }" pattern="MM/dd" /></span>
      		<span id="endTime"><fmt:formatDate value="${bgroup.bg_end_dttm }" pattern="a hh:mm" /></span>
      		<span style="padding-left:78%"><button data-toggle="modal" data-target="#room-info"
      					style="background-color:#FFC0C0;" class="button-general">방 정보</button></span>
      		
    	</div>
    	
	<!-- 채팅 -->	
    	<div style="padding-top:0px; padding-bottom:20px">
    		<div>
      			<textarea id="messageWindow" style="font-size:15px; background-color:#FE9191;border-radius:5px;border:3px double #FFF;
      							padding:10px; resize:none; width:80%; height:300px;" readonly="readonly"></textarea>
      			<div style="padding-top:10px;">
      				<span style="padding-left:5px; padding-right:3px; vertical-align: middle;">
      					<textarea id="inputMessage" style="font-size:15px; border-radius:5px; padding:10px; resize:none; width:65%; height:70px; " placeholder="입력하세요"></textarea>
      				</span>
      				<span style="vertical-align:middle;">
      					<button id="chat" class="button-general">전송</button>
      				</span>
      			</div>
    		</div>
    	</div>
    	
    	
	<!-- 참여자 프로필 -->
     	<div id="profileList" style="border-top: thick double #FE9191; border-bottom: thick double #FE9191; padding-top:15px; padding-bottom:15px;">
				
        		<!-- 참여 멤버 프로필사진 불러오기(캐릭터, 닉네임) -->
        		<c:forEach var="member" items="${memlist}">
				    <span id="${member.m_id}" data-toggle="modal" data-target="#profile" style="font-size:13px; padding:10px; display:inline-block;"> <!-- inline-block : span태그에 꼭맞게 만들어줌 -->
	          			<img style="padding-bottom:5px;" width="65px" height="65px"
	          							src="${pageContext.request.contextPath }/resources/images/Characters/${member.m_image_cd}.gif">
	        			<br />${member.m_nick}
        			</span>
				
				</c:forEach>

    	</div>
    			
    </div> 													
<!-- 버튼영역 위(프로필까지)의 div 끝 -->

<!-- 버튼영역 시작 -->														
    <div style="padding-bottom:30px">
      	<button id="cancelJoin" class="button-general">참가취소</button>
      	<button id="backToList" class="button-general">목록</button>
      	
      	<div class="sns_wrap">
	<!--sns 이모티콘 -->	
			<a class="ftco-animate" href="javascript:sharefacebook('http://39.116.34.40/gca')" title="페이스북으로 가져가기">
			<span style="color:pink"><i class="fab fa-facebook  fa-2x"></i></span></a></li>
				
			<a class="ftco-animate" href="javascript:sharetwitter('gca','http://39.116.34.40/gca','힘께 운동 하자')"title="트위터로 가져가기">
			<span style="color:pink"><i class="fab fa-twitter-square  fa-2x"></i></span></a></li>
				
			<a class="ftco-animate" href="javascript:toSNS('line','gca','http://39.116.34.40/gca')" title="라인으로 가져가기">
			<span style="color:pink"><i class="fab fa-line  fa-2x"></i></span></a></li>
				
			<a class="ftco-animate" href="javascript:shareKakaotalk();"title="카카오톡으로 가져가기">
			<span style="color:pink"><i class="fab fa-korvue  fa-2x"></i></span></a>
		</div>
    </div>
<!-- 버튼영역 끝 -->




<!-- 모달시작 -->
<!-- 프로필 모달 --><!-- 프로필 모달 --><!-- 프로필 모달 --><!-- 프로필 모달 --><!-- 프로필 모달 --><!-- 프로필 모달 --><!-- 프로필 모달 -->
<div class="container">
	<div class="modal fade" id="profile">
		<div class="modal-dialog">
			<div class="modal-content">
      
<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">프로필</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
        
<!-- Modal body -->
				<div class="modal-body">
					<table id="profile-table" style="padding:10px;">
						<tr>
							<td width="50%" id="profile_image" rowspan="4">
								<img style="padding-bottom:5px;" width="65px" height="65px" src="">
							</td>
	          				<th colspan="2">id</th>
						</tr>
						<tr>
							<td id="profile_id" colspan="2"></td>
						</tr>
						<tr>
							<th colspan="2">nickname</th>
						</tr>
						<tr>
							<td id="profile_nick" colspan="2"></td>
						</tr>
						<tr>
							<th>gender</th><th>age</th><th width="40%">level</th>
						</tr>
						<tr>
							<td id="profile_gender"></td>
							<td id="profile_age"></td>
							<td id="profile_level">
								<img style="padding-bottom:5px;" width="40px" height="40px" src="">
							</td>
						</tr>
					</table>
				</div>
        <!-- data-dismiss="modal" id="report" -->
<!-- Modal footer -->
				<div class="modal-footer">
					<button style="background: crimson;" type="button" class="button-general" data-toggle="modal" data-target="#report-user">신고</button>
					<button style="background: crimson;" id="kickOut" type="button" class="button-general">강퇴</button> <!-- 얘는 방장만 보이게 -->
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 방정보 모달 --><!-- 방정보 모달 --><!-- 방정보 모달 --><!-- 방정보 모달 --><!-- 방정보 모달 --><!-- 방정보 모달 --><!-- 방정보 모달 -->
<div class="container">
	<div class="modal fade" id="room-info">
		<div class="modal-dialog">
			<div class="modal-content">
      
<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">${bgroup.bg_name}</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
        
<!-- Modal body -->
			<!-- 방정보 -->
				<div id="room-info-div" class="modal-body">
					
					<table id="room-info-table">
						<tr>
							<th>운동 </th><td> ${bgroup.sports2_cd}</td>
						</tr>
						<tr>
							<th>일시 </th><td> <fmt:formatDate value="${bgroup.bg_end_dttm }" pattern="yyyy/MM/dd a hh:mm" /></td>
						</tr>
						<tr>
							<th>장소 </th><td> ${bgroup.bg_location}</td>
						</tr>
						<tr>
							<th>참가정보 </th><td> ${bgroup.gender_cd} ${bgroup.age_range}</td>
						</tr>
						<tr>
							<th>인원 </th><td> ${bgroup.bg_team_cnt} vs ${bgroup.bg_team_cnt}</td>
						</tr>
						<tr>
							<th>숙련도 </th><td> ${bgroup.skill_cd}</td>
						</tr>
						<tr>
							<th>상태 </th>
							<td>
								<c:set var="now_cnt" value="${bgroup.bg_now_cnt}" />
								<c:set var="end_cnt" value="${bgroup.bg_end_cnt}" />
								<c:choose>
									<c:when test="${now_cnt eq end_cnt}">
										참가대기
									</c:when>
									<c:otherwise>
										참여가능
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						
				<!-- 미현언니 지도부분 -->
						<tr style="text-align: center">
							<td colspan="2">
								<div id="map" style="width:300px;height:200px;"></div>
								<%-- <input type="hidden" id="map_xy" value="${bgroup.bg_xy}"> --%>
							</td>
						</tr>
					</table>
					
				</div>
        
<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="button-general" data-dismiss="modal" id="copy">정보 복사</button>
					<button type="button" class="button-general" data-dismiss="modal">닫기</button>
				</div>
        
			</div>
		</div>
	</div>
</div>


<!-- 프로필 모달 내 신고모달 --><!-- 프로필 모달 내 신고모달 --><!-- 프로필 모달 내 신고모달 --><!-- 프로필 모달 내 신고모달 --><!-- 프로필 모달 내 신고모달 -->
<div class="container">
	<div class="modal" id="report-user">
		<div class="modal-dialog">
			<div class="modal-content">
      
<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">신고</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
        
<!-- Modal body -->
				<form id="report-frm">
				<div id="report-div" class="modal-body">
					<input type="hidden" name="m_id" value='${id}'>
					<table id="report-table">
						<tr align="left">
							<th width="30px" style="padding-left:20px;">id</th><th>신고사유</th>
						</tr>
						<tr>
							<td width="48%" align="left" style="padding:0 20px;"><input name="tr_mid" style="font-size:15px; border-radius:5px; width:100%;" type="text" value="1111" readonly="readonly"></td>
							<td width="52%">
								<select name="tr_reason_cd" style="width:92%" class="form-control">
								  <option value="T01">욕설 및 비방</option>
								  <option value="T02">성희롱</option>
								  <option value="T03">권리 침해</option>
								  <option value="T04">폭력적</option>
								  <option value="T05">테러 조장</option>
								</select>
							</td>
						</tr>
						<tr style="padding-top:20px"><td style="padding-top:20px; align-content: center;" colspan="2"><textarea style="font-size:15px; border-radius:5px; padding:10px;
      							resize:none; width:90%; height:200px;">신고내용</textarea></td></tr>
					</table>
				</div>
        
<!-- Modal footer -->
				<div style="display:inline;" class="modal-footer">
					<button id="doReport" type="button" class="button-general" data-dismiss="modal">신고하기</button>
					<button type="button" class="button-general" data-dismiss="modal">취소</button>
				</div>
				</form>
        
			</div>
		</div>
	</div>
</div>

<!-- 웹소켓 채팅 -->
<script type="text/javascript">

	var textarea = document.getElementById("messageWindow"); 
 
	var inputMessage = document.getElementById('inputMessage');
 
 
	function onMessageChat(event) { //명령어에따라 다른 동작이 되도록 else문으로 명령어 더 추가해서 할 수 있음.(핸들러에도 같이 추가해야함.)
		var result = JSON.parse(event.data);
 		var bg_num = ${bgroup.bg_num};
		if(result.cmd == "join" && ( bg_num == result.bg_num )) { //해당 방에 들어온경우
		
			var img = result.character;
			var nick = result.nick;
			var id = result.id;
		
			//프로필 붙여주기~~
			$span = $("<span data-toggle='modal' data-target='#profile' style='font-size:13px; padding:10px; display:inline-block;'>");
			$span.attr("id",id);
			$img = $("<img style='padding-bottom:5px;' width='65px' height='65px'>");
			$img.attr({"src": "${pageContext.request.contextPath }/resources/images/Characters/"+img+".gif"});
			$text = nick;
		
			$span.append($img);
			$span.append('<br />');
			$span.append($text);
		
			textarea.value += result.msg + "\n"; //<00님이 참가하셨습니다>
			$('#profileList').append($span);
	 	
		}
		else if( result.cmd == "msg" && ( bg_num == result.bg_num )) { //메세지 전송하는 경우
			textarea.value += result.id + " : " + result.msg + "\n";
		}
		else if( result.cmd == "cancelJoin" && ( bg_num == result.bg_num )) { //참가취소 누르고 웹소켓 거쳐왔을때.
			var person = result.id;
			console.log("person:"+result.id);
			//프로필 삭제
			$('#'+person).remove();
			textarea.value += result.msg + "\n"; //채팅방에 나갔다고 표시.
		}
		else if( result.cmd == "kickOut" && ( bg_num == result.bg_num ) ){
			var id = "${id}";
			if(result.id == id){ //강퇴당한놈만 나가게.
				location.href="getBgList";
			}
			textarea.value += result.msg + "\n";
			$('#'+result.id).remove();
		
		}
		chatAreaScroll(); 
 	}

 
	//메세지 전송
	function send() { 
		var bg_num = ${bgroup.bg_num};
		msg = {
				cmd : "msg",
				id : "${id}",
				msg : inputMessage.value,
				bg_num : bg_num
		}
		if((inputMessage.value !="")){
			webSocket.send(  JSON.stringify( msg )   );
		}
	
 	} 
 
	//나갔을때 참여자 칸에서 프로필 삭제
	function deleteProfile() { 
		var bg_num = ${bgroup.bg_num};
		msg = {
				cmd : "cancelJoin",
				id : "${id}",
				msg : "<"+"${id}"+"님이 나가셨습니다.>",
				bg_num : bg_num
	 	}
		webSocket.send(  JSON.stringify( msg )   );
	}
 
//강퇴 시 참여자 칸에서 프로필 삭제
	function deleteProfileKO(id) { 
		var bg_num = ${bgroup.bg_num};
		msg = {
				cmd : "kickOut",
				id : id,
				msg : "<"+id+"님이 강퇴되었습니다.>",
				bg_num : bg_num
	 	}
		webSocket.send(  JSON.stringify( msg )   );
 	}

 
	//채팅치면 스크롤바 내려가게 하기.
	function chatAreaScroll() {
		var textarea = document.getElementById('messageWindow');
		textarea.scrollTop = textarea.scrollHeight;
	}
	
	//채팅내역 insert --웹소켓 아님 아작스임--
	function insertChat(){
		var usrId = "${id}";
		//채팅메세지
		var message = document.getElementById('inputMessage').value;
		console.log("message : "+message);
		var bg_num = ${bgroup.bg_num};
		
		//아작스 전송용 파라미터
		var param = JSON.stringify(
				{"m_id" : usrId, "bg_num" : bg_num, "chh_content" : message}
		);
		
		//채팅 히스토리 테이블에 저장
		$.ajax({
			url: "insertChatHist",
			method:'post',
			dataType: "json",	//결과타입
			data: param,		//요청파라미터
			contentType: "application/json",
			success: function(){
				document.getElementById('inputMessage').value = ""; 
				console.log("insert성공");
			},
			error: function(){
				console.log("insert실패");
			}
			
		});

	}
</script>
    
</body>
</html>