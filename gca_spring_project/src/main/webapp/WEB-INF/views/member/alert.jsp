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
<title>alert.jsp</title>

<!-- 로그인한사람의 id,닉네임,캐릭터코드 저장 -->
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.m_nick" var="nick"/>
<sec:authentication property="principal.m_image_cd" var="image"/>
	
<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">

<style>

.container {
	max-width: 500px;	
}

.container .nav-link {
    font-weight: bold;
    color: black;
}

.container .nav-link.active  {
	color: #FE9191;
}

.alert.alert {
	margin: 2px;
}
.date {
	display: block;
	font-size: small;
}

.tab {
    overflow: hidden;
    background-color: #ffffff;
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 100;
  
}

</style>

<script>
$(function() {
	$(document).scrollTop($(document).height()); //화면 로딩했을때 스크롤바 제일 아래로 내려감
$(".nav-link").on("click", function() {
		$(document).scrollTop($(document).height()); //탭 클릭시 스크롤바 제일 아래로 내려감
	});
});

</script>


</head>

<body>

<div class="container">
      <div class="row">
        <div class="col">
        	<br>
			<!-- 상단 nav-tabs 시작 -->
        	<div class="tab" id="tab">
				<ul class="nav nav-tabs">
				  <!-- 안읽은 알람 탭-->
				  <li class="nav-item">
				    <a class="nav-link active" data-toggle="tab" href="#notReadTab">새로운 메세지</a>
				  </li>
				  <!-- 전체 알람 탭-->
				  <li class="nav-item">
				    <a class="nav-link" data-toggle="tab" href="#allReadTal">전체 메세지</a>
				  </li>
				</ul>
        	</div>
			<!-- 상단 nav-tabs 끝 -->
			<div class="tab-content">
			
				<!-- 안읽은 메세지 내용 시작 -->
				<div class="tab-pane fade show active" id="notReadTab">
					<br>
					<c:forEach items="${notReadList }" var="notReadList">
						<div class="alert alert-info" role="alert">
							<span class="date"> ${notReadList.alert_dttm }</span>
							<span class="content">${notReadList.alert_content }
							</span>
						</div>
					</c:forEach>
				</div>
				<!-- 안읽은 모든 메세지 내용 끝 -->
				<!-- 모든 알람 메세지 내용 시작 -->
				<div class="tab-pane fade" id="allReadTal">
					<br>
					<c:forEach items="${alertList }" var="AllList">
						<div class="alert alert-secondary" role="alert">
							<span class="date">${AllList.alert_dttm }</span>
							<span>${AllList.alert_content }</span>				
						</div>
					</c:forEach>
				</div>
				<!-- 모든 알람 메세지 내용 끝 -->
			</div>

        </div>
	</div>
</div>



</body>
</html>