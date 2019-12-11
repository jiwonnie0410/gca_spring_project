<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all_history.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 달력(fullcalendar) css/js파일 -->
<link href='${pageContext.request.contextPath }/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.css' rel='stylesheet'/>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/core/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/interaction/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/core/locales/ko.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/moment/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/moment-timezone/main.js'></script>

<!-- 부트스트랩 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- 수림 개인 js/css -->
<script src='${pageContext.request.contextPath }/resources/fullcalendar/moment.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/moment_timezone.js'></script>
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<script src='${pageContext.request.contextPath }/resources/js/surim/all_history.js'></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">

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
			  <ul class="nav nav-tabs">
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
							<span class="pinkText">${list.name}</span>
							<span class="mediumText">${list.end }</span>
							<span class="mediumText">${list.sports_cd }</span>
							<span class="mediumText">${list.age_range }</span>
							<span class="mediumText">${list.gender_cd }</span>
							<span class="mediumText">${list.sg_option }</span>
							<span class="mediumText">${list.location }</span>
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
							<span class="pinkText">${list.name}</span>
							<span class="mediumText">${list.end }</span>
							<span class="mediumText">${list.sports_cd }</span>
							<span class="mediumText">${list.age_range }</span>
							<span class="mediumText">${list.gender_cd }</span>
							<span class="mediumText">${list.location }</span>
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
							<span class="pinkText">${list.name}</span>
							<span class="mediumText">${list.end }</span>
							<span class="mediumText">${list.sports_cd }</span>
							<span class="mediumText">${list.age_range }</span>
							<span class="mediumText">${list.gender_cd }</span>
							<span class="mediumText">${list.location }</span>
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
					<h4 class="modal-title">이벤트 모달</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div id="modal-body" class="modal-body">
					<p>날짜: <span id="modalDate"></span></p> 
					<p>종목: 자전거</p>
					<p>상태: 반짝</p>
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="pink-btn">Close</button>
				</div>
			</div>
		</div>
	</div>    
</body>
</html>