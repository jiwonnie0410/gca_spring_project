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
<title>all_history.jsp</title>
<!-- 로그인한사람의 id,닉네임,캐릭터코드 저장 -->
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.m_nick" var="nick"/>
<sec:authentication property="principal.m_image_cd" var="image"/>

<!-- jquery js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- json-serializeObject js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>

<!-- 달력(fullcalendar) css/js파일 -->
<link href='${pageContext.request.contextPath }/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.css' rel='stylesheet'/>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/core/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/interaction/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/core/locales/ko.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/moment/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/moment-timezone/main.js'></script>

<!-- 수림 개인 js/css -->
<script src='${pageContext.request.contextPath }/resources/fullcalendar/moment.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/moment_timezone.js'></script>
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<script src='${pageContext.request.contextPath }/resources/js/surim/all_history.js'></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">

<!-- 미현 : 인증 참여 스크립트 / 지도 스크립트 추가 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>
<script type="text/javascript" src="../resources/js/mihy/kakao_map2.js"></script>

<style>

.historyDiv {
	line-height: 1;
}

.historyDiv .nav-link {
    font-weight: bold;
    color: black;
}

.historyDiv .nav-link.active  {
	color: #FE9191;
}

.historyDiv .fc-toolbar.fc-header-toolbar {
	margin-bottom: 10px;
}

.historyDiv .fc-button {
    padding: 5px 7px;
}

.historyDiv .fc-day-header {
	line-height: 1.5;
}

.historyDiv .fc-day-header.fc-widget-header.fc-sun {
    border-top-left-radius: 5px;
}

.historyDiv .fc-day-header.fc-widget-header.fc-sat {
    border-top-right-radius: 5px;
}

.calendar-color {
	position: absolute;
	top: 23px;
	right: 10px;
	font-weight: bold;
	text-align: center;
}


.calendar-color span{
	border-radius: 5px;
	padding: 2px;
}

#allMenu .nav-link.active {
	background: white;
	border: none;
}

#allMenu .nav-tabs {
	border: none;
}

.status {
    display: inline-block;
    font-size: 30px;
    width: 100%;
    text-align: center;
    color: #FE9191;
    font-weight: bold;
    padding: 20px;
}
 

</style>

</head>

<body>
	<div class="historyDiv">
	  <br>
	  <!-- Nav tabs 캘린더/전체보기 버튼 -->
	  <ul class="nav nav-tabs">
		    <li class="nav-item">
		      <a class="nav-link active" data-toggle="tab" href="#calendarDiv">캘린더</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#allMenu">전체보기</a>
		    </li>
	  </ul>
	  <!-- Nav tabs 캘린더/전체보기 버튼 끝 -->
	  <!-- Tab panes 캘린더/전체보기 안의 내용 넣는곳 -->
	  <div class="tab-content">
	  	<!-- 캘린더 div 시작 -->
	    <div id="calendarDiv" class="container tab-pane active"><br>
	      		<div id="calendar" class="calendar"></div>
	      		<div class="calendar-color">
		      		<span style="background:#FE9191">반짝</span>
		      		<span style="background:yellow">용병</span>
		      		<span style="background:#3bc9e0">동아리매치</span>
	      		</div>
	    </div>
	    <!-- 캘린더 div 끝 -->
	    <!-- 전체히스토리 div 시작 -->
	    <div id="allMenu" class="container tab-pane fade"><br>
	    	  <!-- Nav tabs 시작 반짝/용병/동아리매치 -->
			  <ul class="nav nav-tabs" id="aaa">
				    <li class="nav-item">
				      <a class="nav-link active" data-toggle="tab" href="#sgroup">반짝</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" data-toggle="tab" href="#sixmin">용병</a>
				    </li>
		            <li class="nav-item">
				      <a class="nav-link" data-toggle="tab" href="#bgroup">동아리매치</a>
				    </li>
			  </ul>
			  <!-- Nav tabs 반짝/용병/동아리매치 끝 -->
			  <!-- Tab panes 내용 넣는곳 -->  
			  <div class="tab-content">
			  	<!-- 반짝 테이블 시작 -->
			    <div id="sgroup" class="container tab-pane active"><br>
					<c:forEach items="${activeHistList}" var="list">
						<c:if test="${list.sg_num != null }">
							<div class="content-div">
							<span class="pinkText">${list.title}</span>
							<br>
							<span class="pinkText">마감일자: <fmt:formatDate value="${list.start }" pattern="YYYY-MM-dd HH:mm"/></span>
							<span class="mediumText">주소: ${list.location }</span>
							
						<!-- 미현 : 지도 출력 부분 시작-->
							<div class="sg_map" style="width:100%; height:300px">지도</div>
							<input type="hidden" class="sg_xy" value="${ list.xy }">
						<!-- 미현 : 지도 출력 부분 끝 -->
						
							<span class="mediumText">종목: ${list.sports_cd }</span>
							<span class="mediumText">숙련도: ${list.skill_cd }</span>
							<span class="mediumText">나이: ${list.age_range }</span>
							<span class="mediumText">성별: ${list.gender_cd }</span>
							<span class="mediumText">옵션: ${list.sg_option }</span>
							<c:if test="${list.status == '실패'}">
								<span class="status" style="color: grey">${list.status }</span>
							</c:if>
							<c:if test="${list.status == '진행중'}">
								<span class="status">${list.status }</span>
							</c:if>
							<c:if test="${list.status == '성공'}">   
								<span class="status" style="color: red" >${list.status }</span>
							</c:if>
							
						</div>
						</c:if>
					</c:forEach>
			    </div>
			    <!-- 반짝 테이블 끝 -->
			    <!-- 용병 테이블 시작 -->
			    <div id="sixmin" class="container tab-pane fade"><br>
			    	<c:forEach items="${activeHistList}" var="list">
						<c:if test="${list.six_num != null }">
						<div class="content-div">
							<span class="pinkText">${list.title}</span>
							<br>
							<span class="pinkText">마감일자: <fmt:formatDate value="${list.start }" pattern="YYYY-MM-dd HH:mm"/></span>
							<span class="mediumText">장소: ${list.location }</span>
							
						<!-- 미현 : 지도 출력 부분 시작-->
							<span class="six_map" style="width:100%; height:300px">지도</span>
							<input type="hidden" class="six_xy" value="${ list.xy }">
						<!-- 미현 : 지도 출력 부분 끝 -->
						
							<span class="mediumText">종목: ${list.sports_cd }</span>
							<span class="mediumText">숙련도: ${list.skill_cd }</span>
							<span class="mediumText">나이: ${list.age_range }</span>
							<span class="mediumText">성별: ${list.gender_cd }</span>
							<span class="status">${list.status }</span>
						</div>
						</c:if>
					</c:forEach>
			    
			    </div>
			    <!-- 용병 테이블 끝 -->
		        <!-- 동아리매치 테이블 시작 -->
		        <div id="bgroup" class="container tab-pane fade">
		        	<c:forEach items="${activeHistList}" var="list">
						<c:if test="${list.bg_num != null }">
						<div class="content-div">
							<span class="pinkText">${list.title}</span>
							<br>
							<span class="pinkText">마감일자: <fmt:formatDate value="${list.start }" pattern="YYYY-MM-dd HH:mm"/></span>
							<span class="mediumText">장소: ${list.location }</span>
							<span class="mediumText">종목: ${list.sports_cd }</span>
							<span class="mediumText">숙련도: ${list.skill_cd }</span>
							<span class="mediumText">나이: ${list.age_range }</span>
							<span class="mediumText">성별: ${list.gender_cd }</span>
							<span class="mediumText">팀인원: ${list.bg_team_cnt }</span>
							
						<!-- 미현 : 지도 출력 부분 시작-->
							<div class="bg_map" style="width:100%; height:300px">지도</div>
							<input type="hidden" class="bg_xy" value="${ list.xy }">
						<!-- 미현 : 지도 출력 부분 끝 -->
						
							<span class="status">${list.status }</span>
						</div>
						</c:if>
					</c:forEach>
		        </div>
			    <!-- 동아리매치 테이블 끝 -->
			  </div>
	    </div>
	    <!-- 전체 히스토리 div 끝 -->
	  </div>
	  <!-- Tab panes 캘린더/전체보기 안의 내용 넣는곳 끝 -->
	</div>
	
	<!-- The Modal 모달 div -->
	<div id="eventModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<span id="title" class="pinkText"></span>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>    
				<div id="modal-body" class="modal-body">     
					<span id="date" class="pinkText"></span> 
					<span id="location" class="mediumText" style="position: relative;"></span>
					<span id="end_cnt" class="mediumText"></span>
					<span id="sports_cd" class="mediumText"></span>
					<span id="skill_cd" class="mediumText"></span>
					<span id="age_range" class="mediumText"></span>
					<span id="gender_cd" class="mediumText"></span>
					<span id="sg_option" class="mediumText"></span>
					
<!-- 				미현 : 지도 출력 부분 시작 -->
<!-- 					<input type="hidden" id="map_xy"> -->
<!-- 					<span id="map" style="position: relative; left:230px; top:-90px;"></span> -->
<!-- 				미현 : 지도 출력 부분 끝 -->
				
					<span id="status" class="status"></span>
					
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="pink-btn">Close</button>
				</div>
			</div>
		</div>
	</div>  
</body>
</html>