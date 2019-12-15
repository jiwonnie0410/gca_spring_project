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
<title>유저 랭킹</title>
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
나의 랭킹은 로그인 정보에서 받아옴
 -->
<div class="container">
	<div class="content-div">
		<div class="rankDiv">
			<span class="title">회원 랭킹</span>
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
				<c:forEach items="${rankList}" var="list">
				    <tr>
				      <th style="text-align: center">${list.rank }</th>
				      <td style="width: 40px"><img src="${pageContext.request.contextPath }/resources/images/icon/${list.m_image_cd }.png"></td>
				      <td>${list.m_nick}</td>
				      <td><img src="${pageContext.request.contextPath }/resources/images/icon/heart.png">${list.sch_score }</td>
				    </tr>
				</c:forEach>
			  </tbody>
			</table>
		<hr>
		<div class="myRank">
			<span class="title">나의 랭킹</span>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${myRank.m_id eq id }"> --%>
<%-- 						<img src="${pageContext.request.contextPath }/resources/images/icon/profile2.png"> ${myRank.m_id }  --%>
<%-- 						/ <img src="${pageContext.request.contextPath }/resources/images/icon/heart.png">${myRank.sch_score }  --%>
<%-- 						/ ${myRank.rank} --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						목록에 없음!! -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
		</div>
		</div>
	</div>
</div>

</body>
</html>