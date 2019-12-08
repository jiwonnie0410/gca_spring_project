<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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



<!-- 부트스트랩 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<script src='${pageContext.request.contextPath }/resources/js/surim/all_history.js'></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">

<style>

.historyDiv {
	line-height: 1;
}

.historyDiv .nav-link {
    font-weight: bold;
    font-size: 20px;
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
	font-weight: bold;
	font-size: 20px;
	padding-top: 5px;
	text-align: center;
}


.calendar-color span{
	border-radius: 5px;
	padding: 2px;
}



</style>

</head>

<body>
<c:forEach items="${ActiveHistList}" var="list">
	${list.m_id }!!<br>
</c:forEach>

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
	      			<span>정보:</span>
		      		<span style="background:#FE9191">반짝</span>
		      		<span style="background:yellow">용병</span>
		      		<span style="background:#3bc9e0">동아리매치</span>
	      		</div>
	    </div>
	    <!-- 캘린더 div 끝 -->
	    <!-- 전체히스토리 div 끝 -->
	    <div id="allMenu" class="container tab-pane fade"><br>
			<table class="historyTable">
				<thead>
					<tr>
						<td colspan="2" style="text-align:center;"><p></p></td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<th>순서</th>
						<th>내용</th>
					</tr>
					<tr>
						<td width="50">1</td>
						<td>
							일시: 11/05 18:00<br>
							장소: 대구 228공원<br>
							디테일: 배드민턴(초급이상)<br>
							성공여부: 성공
						</td>
					</tr>
					
					<tr>
						<td>2</td>
						<td>
							일시: 11/05 18:00<br>
							장소: 대구 228공원<br>
							디테일: 배드민턴(초급이상)<br>
							성공여부: 실패
						</td>
					</tr>
				</tbody>
			</table>    
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