<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<title> </title>
		<!-- CSS -->
		<link href="${pageContext.request.contextPath }/resources/css/menubar/jiwon-menubar.css" rel="stylesheet">
</head>
<body>
	<div class="navbar pr-2 pl-2">
		<div class="board" align="center">
			<div class="list">
			
			</div>
		</div>

		<!-- 메뉴바에 들어가는 아이콘 5개 -->
		<!-- 반짝으로 가기 -->
		<a class="nav_sgroup" href="${pageContext.request.contextPath }/sgroup/getSgList"><i class="fas fa-star" style="position:absolute; left:10px;"></i></a>
		
		<!-- 동호회 매치로 가기 -->
		<a class="nav_bgroup" href="${pageContext.request.contextPath }/bgroup/getBgList"><i class="fas fa-users" style="position:absolute; left:70px;"></i></a>
				
		<!-- 챌린지 목록으로 가기 -->
		<a class="nav_challenge" href="${pageContext.request.contextPath }/challenge/list"><i class="fas fa-trophy" style="position:absolute; left:130px;"></i></a>
				
		<!-- 동호회 홍보 게시판으로 가기 -->
		<a href="${pageContext.request.contextPath }/board/adlist"><i class="fas fa-edit" style="position:absolute; margin: 0 0 10px 0; left:190px;"></i>
				
		<!-- 전체 메뉴 보기 -->
		<a href="${pageContext.request.contextPath }/menu"><i class="fas fa-bars" style="position:absolute; left:250px;"></i></a>
		
		<!-- 프로필로 가기 + 쪽지 갯수 -->
		<!-- <i class="fas fa-user"></i> -->
		<a href="${pageContext.request.contextPath }/member/member_view.do"><i class="fas fa-user" style="position:absolute; margin: 0 0 10px 0; left:310px;"></i></a>
			<span class="badge badge-pill badge-danger" id="alertcnt" style="position:absolute; left:330px;">0</span><!-- 알람이 오면 +1되는 부분 -->
			
		<br><br><br>
	</div>
</body>
</html>