<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	<nav class="navbar fixed-bottom">
		<!-- 메뉴바에 들어가는 아이콘 5개 -->
		<!-- 프로필로 가기 + 쪽지 갯수 -->
		<span class="nav_menubar nav_profile">
			<i class="fas fa-user" onclick='location.href="${pageContext.request.contextPath }/member/member_view.do"'></i>
			<br><font size="2" class="menubar_font">프로필</font>
			<span class="badge badge-pill badge-danger" id="alertcnt">0</span><!-- 알람이 오면 +1되는 부분 -->
		</span>

		<!-- 반짝으로 가기 -->
		<span class="nav_menubar nav_sgroup">
			<i class="fas fa-star" onclick='location.href="${pageContext.request.contextPath }/sgroup/getSgList"'></i>
			<br><font size="2" class="menubar_font">&nbsp;반짝</font>
		</span>
		
		<!-- 동호회 매치로 가기 -->
		<span class="nav_menubar nav_bgroup">
			<i class="fas fa-users" onclick='location.href="${pageContext.request.contextPath }/bgroup/getBgList"'></i>
			<br><font size="2" class="menubar_font">동호회</font>
		</span>
				
		<!-- 챌린지 목록으로 가기 -->
		<span class="nav_menubar nav_challenge">
			<i class="fas fa-trophy" onclick='location.href="${pageContext.request.contextPath }/challenge/list"'></i>
			<br><font size="2" class="menubar_font">챌린지</font>
		</span>
				
		<!-- 동호회 홍보 게시판으로 가기 -->
		<span class="nav_menubar nav_adboard">
			<i class="fas fa-edit" onclick='location.href="${pageContext.request.contextPath }/board/adlist"'></i>
			<br><font size="2" class="menubar_font">홍보</font>
		</span>
				
		<!-- 전체 메뉴 보기 -->
		<span class="nav_menubar nav_allmenu">
			<i class="fas fa-bars" onclick='location.href="${pageContext.request.contextPath }/menu"'></i>
			<br><font size="2" class="menubar_font">전체</font>
		</span>
	</nav>
