<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마감된 동호회 매치</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<!-- private : icon 1 & slide 2 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
	<link rel="stylesheet" href="../resources/css/mihy/swiper.min.css">
	<script src="../resources/js/mihy/swiper.min.js"></script>

	<!-- private : Description Action -->
	<script type="text/javascript" src="../resources/js/mihy/b_search.js"></script>
	<link rel="stylesheet" href="../resources/css/mihy/b_search.css">

</head>


<body>

<nav class="fixed-top">
<div align="center" class="mt-2 mb-2"><h4>마감된 동호회 매치</h4></div>

<!-- <nav class="sticky-top"> -->
<form action="getBgListEnd" name="searchSport" id="searchSport" method="post">
<div class="swiper-container sticky-top">
	<div class="swiper-wrapper">
		<div class="swiper-slide p-2"><i class="fas fa-star-of-david pr-2"></i>전체</div>
		<c:forEach items="${sports_list }" var="list">
			<div class="swiper-slide p-2" id="${list.cd_id }" data-sports="${list.cd_id }">${list.cd_etc}${list.cd_name }</div>
		</c:forEach>
	</div>
</div>
<input type="hidden" name="key" id="key" value="${bgroup.key}">
<input type="hidden" name="keyval" id="keyval" value="${bgroup.keyval}">
</form>
</nav>

<table class="table table-striped endroom" id="tb1" style="margin-top:95px">
	<c:forEach items="${ list }" var="bg">
	<tr class="tr ${bg.bg_num}">
		<td class="td1">
			<p class="content p1">
				<c:forEach items="${sports_list }" var="list">
				<c:choose>
				<c:when test="${bg.sports2_cd == list.cd_id}">
					<c:if test="${list.cd_etc != null}">${list.cd_etc}</c:if>
					<c:if test="${list.cd_etc == null}">
						<img src="../resources/images/mihy/badminton-black.png" width="32px">
					</c:if>
				</c:when>
				</c:choose>
				</c:forEach>
			</p>
			<p class="content p2"><span class="badge badge-dark">${bg.skill_cd }▲</span></p>
		</td>
		
		<td class="td2">
			<p class="content p5 end">
<%-- 				<span class="badge badge-secondary mr-1 ml-2">
					<font color="#D8D8D8" class="bg_now_cnt">${bg.bg_now_cnt }</font>
					&nbsp;/&nbsp;<font color="#D8D8D8" class="bg_end_cnt">${bg.bg_end_cnt }명</font>
				</span> --%>
				<span class="badge badge-secondary mr-1 ml-2">
					<font color="#D8D8D8" class="bg_now_cnt">${bg.bg_team_cnt } vs ${bg.bg_team_cnt }</font>
				</span>
				<span class="badge badge-secondary mr-2" style="color:#D8D8D8;">${bg.gender_cd }</span>${bg.age_range }
			</p>
			<p class="content p4 end">${bg.bg_name }</p>
			<p class="content p3">${bg.bg_location }</p>
			<input type="hidden" class="dis" value="${bg.dis }">
		</td>
		
		<td class="td3" align="center">
			<input type="hidden" class="dttm" value="${bg.bg_end_dttm }">
			<p class="content p6 end"><fmt:formatDate value="${bg.bg_end_dttm }" pattern="yy.MM.dd(E)" /></p>
			<p class="content p7 end"><fmt:formatDate value="${bg.bg_end_dttm }" pattern="ahh:mm" /></p>
			<p class="content p8"></p>
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>