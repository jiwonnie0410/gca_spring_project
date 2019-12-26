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
<title>challenge.jsp</title>

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
    font-size: 18px;
}

.container .nav-link.active  {
	color: #FE9191;
	text-decoration: underline;
    text-underline-position: under;
    background: white;
    font-size: 18px;
}


.image-div {
	position : relative;
}

.sports-div img {
	border-radius: 10px;
	height: auto;
}


.join-mark {
	position: absolute;
    top: 5%;
    right: 5%;
}

.tab {
    overflow: hidden;
    background-color: #ffffff;
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 100;
  
}


.tab-content>.active {
    display: block;
    padding-top: 50px;
}

#title {
	color: #3f3f3f;
    text-shadow: 1px 1px 1px #A3C4D1;
}


</style>
</head>
  
  <body>

    <div class="container">
    <br>
      <div class="row">
        <div class="col">
        	<!-- 상단 nav-tabs 시작 -->
	        <div class="tab" id="tab">
		        <span id="title"><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;챌린지 목록</h4></span>	
	            <ul class="nav nav-pills">
	              &nbsp;&nbsp;
	              <!-- 기본 챌린지 탭-->
	              <li class="nav-item">
	                <a class="nav-link active" data-toggle="tab" href="#basicChallenges">기본 챌린지</a>
	              </li>
	              <!-- 스페셜 챌린지 탭-->
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#specialChallenges">스페셜 챌린지</a>
	              </li>
	            </ul>
            </div>
            <!-- 상단 nav-tabs 끝 -->
            
            <div class="tab-content">
              <!-- 기본 챌린지 내용 div 시작 -->
              <div class="tab-pane fade show active" id="basicChallenges">
              	<c:forEach items="${challengeList}" var="list">
	              	<c:if test="${list.cl_status == 'basic' }"> 
	              	<div class="content-div" onclick="location.href='contents?num=${list.cl_num}'">
	              		<div class="image-div">
	              			<div class="sports-div">
			              		<img src="${pageContext.request.contextPath }/resources/images/sports/${list.sports1_cd }.jpg" width="100%" height="200px">
	              			</div>
	              			<!-- 유저가 참가중인 챌린지는 참여중 마크 띄움 -->
	              			<c:forEach items="${myHistory}" var ="myList">
	              			<c:if test="${list.cl_num == myList.cl_num }">
		              			<div class="join-mark">
									<img src="${pageContext.request.contextPath }/resources/images/icon/join.png">
		              			</div>
	              			</c:if>         
							</c:forEach>
							<!-- 유저 참가중 마크 끝 -->
	              		</div>
	              		<span class="pinkText">
		              		<fmt:formatDate value="${list.cl_start_dttm }" type="date" /> ~
							<fmt:formatDate value="${list.cl_end_dttm }" type="date" />
						</span>
						<span class="mediumText">${list.cl_name }</span>
						<span class="mediumText">기간내 | ${list.cl_cnt }회 성공</span>
						<a style="color: #FE9191; font-weight: bold; font-size: large">
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px">
							${list.cl_score }점 
						</a>
						<!-- 태그 시작 -->
						<a class="tags">
							<!-- D-day 태그 -->
							<input class="dDay-tag" value="D-${list.gap_day }">
							<!-- 참가중 태그 -->
	              			<c:forEach items="${myHistory}" var ="myList">
	              			<c:if test="${list.cl_num == myList.cl_num }">
									<input class="join-tag" value="참가중">
	              			</c:if>         
							</c:forEach>
						</a>
						<!-- 태그 끝 -->
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
	                	<div class="image-div">
	              			<div class="sports-div">
			              		<img src="${pageContext.request.contextPath }/resources/images/sports/${list.sports1_cd }.jpg" width="100%" height="200px">
	              			</div>
	              			<!-- 유저가 참가중인 챌린지는 참여중 마크 띄움 -->
	              			<c:forEach items="${myHistory}" var ="myList">
	              			<c:if test="${list.cl_num == myList.cl_num }">
		              			<div class="join-mark">
									<img src="${pageContext.request.contextPath }/resources/images/icon/join.png">
		              			</div>
	              			</c:if>         
							</c:forEach>
							<!-- 유저 참가중 마크 끝 -->
	              		</div>

	              		<span class="pinkText">
		              		<fmt:formatDate value="${list.cl_start_dttm }" type="date" /> ~
							<fmt:formatDate value="${list.cl_end_dttm }" type="date" />
						</span>
						<span class="mediumText">${list.cl_name }</span>
						<span class="mediumText">기간내 | ${list.cl_cnt }회 성공</span>
						<span class ="pinkText"> 
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px">
							${list.cl_score }점 
						</span>
						<a style="color: #FE9191; font-weight: bold; font-size: large">
							<img src="${pageContext.request.contextPath }/resources/images/icon/money.png" width="25px">
							보증금 필요
						</a>
						<!-- 태그 시작 -->
						<a class="tags">
							<!-- D-day 태그 -->
							<input class="dDay-tag" value="D-${list.gap_day }">
							<!-- 참가중 태그 -->
	              			<c:forEach items="${myHistory}" var ="myList">
	              			<c:if test="${list.cl_num == myList.cl_num }">
									<input class="join-tag" value="참가중">
	              			</c:if>         
							</c:forEach>
						</a>
						<!-- 태그 끝 -->
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