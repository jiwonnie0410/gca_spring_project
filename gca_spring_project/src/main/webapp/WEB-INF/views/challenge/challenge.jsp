<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>challenge.jsp</title>

<!-- 부트스트랩 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">

<script>
$(function(){
	//checkChallengeHistory(); //챌린지 참가여부확인 (챌린지히스토리체크)
});

//챌린지 참가여부확인
function checkChallengeHistory() {
	$.ajax({
		url: "/ajax/checkChallengeHistory.json",
		dataType: "json",
	});
}

</script>

  </head>
  
  <body>
    <div class="container">
    <span class="title">챌린지 목록</span>
      <div class="row">
        <div class="col">
        	<!-- 상단 nav-tabs 시작 -->
            <ul class="nav nav-fills">
              <!-- 기본 챌린지 탭-->
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#basicChallenges">기본 챌린지<br><span>Basic Challenges</span></a>
              </li>
              <!-- 스페셜 챌린지 탭-->
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#specialChallenges">스페셜 챌린지<br><span>Special Challenges</span></a>
              </li>
            </ul>
            <!-- 상단 nav-tabs 끝 -->
            
            <div class="tab-content">
              <!-- 기본 챌린지 내용 div 시작 -->
              <div class="tab-pane fade show active" id="basicChallenges">
              	
              	<c:forEach items="${challengeList}" var="list">
	              	<c:if test="${list.cl_status == 'basic' }"> 
	              	<div class="content-div" onclick="location.href='contents?num=${list.cl_num}'">
	              		<img src="${pageContext.request.contextPath }/resources/images/sports/${list.sports1_cd }.jpg" width="100%" height="200px">
	              		<span><fmt:formatDate value="${list.cl_start_dttm }" type="date" /> ~
						<fmt:formatDate value="${list.cl_end_dttm }" type="date" />　　　(D-${list.gap_day })</span>
						<span>${list.cl_name }</span>
						<span>기간내 | ${list.cl_cnt }회 성공</span>
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px">
							${list.cl_score }점
						</span>
	              	</div>
	              	</c:if>
              	</c:forEach>
              </div>
              <!-- 기본 챌린지 내용 div 끝 -->    
              
              <!-- 스페셜 챌린지 내용 div 시작 -->
               <div class="tab-pane fade" id="specialChallenges">
              	<c:forEach items="${challengeList}" var="list">
              		<c:if test="${list.cl_status != 'basic' }"> 
	              	<div class="content-div" onclick="location.href='contents?num=${list.cl_num}'">
	              		<img src="${pageContext.request.contextPath }/resources/images/sports/${list.sports1_cd }.jpg" width="100%" height="200px">
	              		<span><fmt:formatDate value="${list.cl_start_dttm }" type="date" /> ~
						<fmt:formatDate value="${list.cl_end_dttm }" type="date" />　　(D-${list.gap_day })</span>
						<span>${list.cl_name }</span>
						<span>기간내 | ${list.cl_cnt }회 성공</span>
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/icon/money.png" width="25px">
							1천원~5천원
						</span>
						<span> 
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px">
							${list.cl_score }점   
						</span>
	              	</div>
	              	</c:if>
              	</c:forEach>
              </div>
              <!-- 스페셜 챌린지 내용 div 끝 -->
            </div>
        </div>
      </div>
    </div>
  	
  </body>
</html>