<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>스코어 히스토리</title>

<!-- 부트스트랩 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">

<style>

.rankTable {
	width: 100%;
}

.container img {
	width: 40px;
}

.rankTable thead {
	text-align: center;
}

.myRank {
	text-align: center;
}


</style>

</head>
<body>


<!-- 
회원아이디: ${list.m_id }
회원포인트: ${list.sch_score } 
회원랭킹:  ${list.rank}

랭킹 10등 넘어가면 순위권외로 출력됨,
나의 랭킹은 현재 세션의 'id' 받아옴
 -->
<div class="container">
	<div class="content-div">
		<div class="rankDiv">
			<span class="title"><img src="${pageContext.request.contextPath }/resources/images/icon/crown.png">회원 랭킹<img src="${pageContext.request.contextPath }/resources/images/icon/crown.png"></span>
			<br>
			<table class="rankTable">
			  <thead>
			    <tr style="background-color: #FE9191">
			      <th scope="col" style="width: 20%">순위</th>
			      <th scope="col" colspan="2">닉네임</th>
			      <th scope="col">포인트</th>
			    </tr>
			  </thead>
			  <tbody>
				<c:forEach items="${scoreList}" var="list">
				    <tr>
				      <th style="text-align: center">${list.rank }</th>
				      <td style="width: 40px"><img src="${pageContext.request.contextPath }/resources/images/icon/profile1.png"></td>
				      <td>${list.m_id}</td>
				      <td><img src="${pageContext.request.contextPath }/resources/images/icon/heart.png">${list.sch_score }</td>
				    </tr>
				</c:forEach>
			  </tbody>
			</table>
		<hr>
		<div class="myRank">
			<span class="title">나의 랭킹</span>
			<c:forEach items="${scoreList}" var="list">
				<c:if test="${list.m_id eq id }">
					<img src="${pageContext.request.contextPath }/resources/images/icon/profile2.png"> ${list.m_id } 
					/ <img src="${pageContext.request.contextPath }/resources/images/icon/heart.png">${list.sch_score } 
					/ ${list.rank}
				</c:if>
			</c:forEach>
		</div>
		</div>
	</div>
</div>

</body>
</html>