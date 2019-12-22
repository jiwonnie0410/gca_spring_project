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
    font-size: 20px;
}

.container .nav-link.active  {
	color: #FE9191;
	text-decoration: underline;
    text-underline-position: under;
    background: white;
    font-size: 20px;
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
/* 각 알람메세지 클릭시 카테고리별 분류에 따라 (반짝/용병/동호회)목록으로 이동시킴
*
* 1. 알람메세지 문자열 분석하여 input에 (반짝/용병/동호회) 중 1개 넣어줌
* 2. 각 메세지 div 클릭시 input값에 따라 (반짝/용병/동호회)로 이동
* 
*/

$(function() {
	$(document).scrollTop($(document).height()); 	//화면 로딩했을때 스크롤바 제일 아래로 내려감
	$(".nav-link").on("click", function() {				
		$(document).scrollTop($(document).height()); //탭 클릭시 스크롤바 제일 아래로 내려감
		
		// 1. 알람메세지 문자열 분석하여 input에 (반짝/용병/동호회) 중 1개 넣어줌
		var content = $("[name=content]");			// 알람메세지 span
		var category = $("[name=category]");		// 반짝/용병/동호회 글자찾아서 넣어줄 input
		for (i = 0; i < content.length; i++) {
			var check = $("[name=content]")[i].innerText; // 각 알람메세지 내용
			if (check.match('반짝') == '반짝') {
				category[i].value = '반짝';
			} else if (check.match('용병') == '용병') {
				category[i].value = '용병';
			} else if (check.match('동호회') == '동호회') {
				category[i].value = '동호회';
			}
		}
	});
	
		//2. 각 메세지 div 클릭시 input값에 따라 (반짝/용병/동호회)로 이동
	$('[name=message-div').on("click", function() {
		var index = ($(this).index() - 1);			// 알람메세지div의 index -1해야 input이랑 매치됨
		var category = $("[name=category]"); 		// 알람메세지의 카테고리 (반짝/용병/동호회)
			if( category[index].value == '반짝') {
				location.href='../sgroup/getSgList';
			} else if( category[index].value == '용병') {
				location.href='../sixman/getSixList';
			} else if( category[index].value == '동호회') {
				location.href='../bgroup/getBgList';
		}
	});
});
</script>

<style>

</style>


</head>

<body>

<div class="container">
      <div class="row">
        <div class="col">
        	<br>
			<!-- 상단 nav-tabs 시작 -->
        	<div class="tab" id="tab">
				<ul class="nav nav-pills">
				  <!-- 안읽은 알람 탭-->
				  <li class="nav-item">
				    <a class="nav-link active" data-toggle="tab" href="#notReadTab">새로운 메세지</a>
				  </li>
				  <!-- 전체 알람 탭-->
				  <li class="nav-item">
				    <a class="nav-link" data-toggle="tab" href="#allReadTab">전체 메세지</a>
				  </li>
				</ul>
        	</div>
			<!-- 상단 nav-tabs 끝 -->
			<div class="tab-content">
			
				<!-- 안읽은 메세지 내용 시작 -->
				<div class="tab-pane fade show active" id="notReadTab" style="padding-bottom: 10px;">
					<br>
					<c:forEach items="${notReadList }" var="notReadList">
						<div name="message-div" class="alert alert-info" role="alert" style="cursor:pointer;>
							<span class="date"> ${notReadList.alert_dttm }</span>
							<span class="content">${notReadList.alert_content }
							<input name="category" type="hidden">	
							</span>
						</div>
					</c:forEach>
				</div>
				<!-- 안읽은 모든 메세지 내용 끝 -->
				<!-- 모든 알람 메세지 내용 시작 -->
				<div class="tab-pane fade" id="allReadTab" style="padding-bottom: 10px;">
					<br>
					<c:forEach items="${alertList }" var="AllList">
						<div name="message-div" class="alert alert-secondary" role="alert" style="cursor:pointer;>
							<span class="date">${AllList.alert_dttm }</span>
							<span name="content">${AllList.alert_content }</span>	
							<input name="category" type="hidden">			
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