<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all_history.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<!-- 달력(fullcalendar) css/js파일 -->
<link href='${pageContext.request.contextPath }/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/fullcalendar/daygrid/main.css' rel='stylesheet'/>

<script src='${pageContext.request.contextPath }/fullcalendar/core/main.js'></script>
<script src='${pageContext.request.contextPath }/fullcalendar/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath }/fullcalendar/interaction/main.js'></script>
<script src='${pageContext.request.contextPath }/fullcalendar/core/locales/ko.js'></script>


<script src='${pageContext.request.contextPath }/js/surim/all_history.js'></script>


<!-- 모달 링크용 modal -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
<style>
.historyDiv {
} 

.title {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	height: 40px;
}

th {
	text-align: center;
}

button {
 background : #FE9191;
 border : none;
 border-radius: 6px;
 height : 30px;
 color : white;
 font-size : large;
 
}


</style>

</head>


<body>

11
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
				<button type="button" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


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

  <!-- Tab panes 캘린더/전체보기 안의 내용 넣는곳 -->
  <div class="tab-content">
  	<!-- 캘린더 -->
    <div id="calendarDiv" class="container tab-pane active"><br>
      		<div id="calendar" class="calendar"></div>
    </div>
    <!-- 전체히스토리 테이블 -->
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
  </div>
</div>


</body>
</html>