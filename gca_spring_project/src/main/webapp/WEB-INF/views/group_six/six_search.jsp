<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용병을 찾아보세요!</title>

	<!-- private : icon 1 & slide 2 & toastr2 & bootbox1 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
	<link rel="stylesheet" href="../resources/css/mihy/swiper.min.css">
	<script src="../resources/js/mihy/swiper.min.js"></script>
    <link href="../resources/css/mihy/toastr.min.css" rel="stylesheet">
    <script src="../resources/js/mihy/toastr.min.js"></script>
    <script src="../resources/js/mihy/bootbox.all.min.js"></script>

<script>
	var mgrant = "<sec:authentication property='principal.m_status_cd'/>";
</script>

	<!-- private : Description Action -->
	<script type="text/javascript" src="../resources/js/mihy/six_search.js"></script>
	<link rel="stylesheet" href="../resources/css/mihy/search.css">

</head>


<body>

<nav class="fixed-top">
<div align="center" class="nav_title mt-2 mb-2"><h4>함께 할 용병 찾기</h4></div>

<!-- 계정 상태가 활동중인 사람들만 버튼 보임 -->
<sec:authentication property='principal.m_status_cd' var='mgrant'/> <!-- 변수에 이 회원의 계정상태 대입 -->
<c:if test="${mgrant == 'M01'}"> <!-- 계정상태가 활동중이라면 버튼 띄움 -->
	<button class="btn btn-info create_room mt-1 ml-3 mr-3" style="width:90%;">용병 모집 방 생성하기</button>
</c:if>

<form action="getSixList" name="searchSport" id="searchSport" method="post">
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide p-2"><i class="fas fa-star-of-david pr-2"></i>전체</div>
		<c:forEach items="${sports_list }" var="list">
			<div class="swiper-slide p-2" id="${list.cd_id }" data-sports="${list.cd_id }">${list.cd_etc}${list.cd_name }</div>
		</c:forEach>
	</div>
</div>
<input type="hidden" name="key" id="key" value="${sixman.key}">
<input type="hidden" name="keyval" id="keyval" value="${sixman.keyval}">
</form>
</nav>

<table class="table table-striped" id="tb1"  style="margin-top:160px">
	<c:forEach items="${ list }" var="six">
	<tr class="tr ${six.six_num}">
		<td class="td1">
			<p class="content p9"><span class="badge badge-pill badge-light shadow-sm">${six.dis }</span></p>
			<p class="content p1">
			<c:forEach items="${sports_list }" var="list">
				<c:choose>
				<c:when test="${six.sports2_cd == list.cd_id}">
					<c:if test="${list.cd_etc != null}">${list.cd_etc}</c:if>
					<c:if test="${list.cd_etc == null}">
						<img src="../resources/images/mihy/badminton-black.png" width="32px">
					</c:if>
				</c:when>
				</c:choose>
				</c:forEach>
			</p>
			<p class="content p2"><span class="badge badge-dark">${six.skill_cd }▲</span></p>
		</td>
		
		<td class="td2">
			<p class="content p5">
				<c:choose>
					<c:when test="${six.six_now_cnt == six.six_end_cnt }">
						<span class="badge badge-warning mr-1 ml-2"><font color="gray" class="six_now_cnt">대기</font></span></c:when>
					<c:otherwise>
						<span class="badge badge-warning mr-1 ml-2">
							<font color="red" class="six_now_cnt">${six.six_now_cnt -1 }</font>
							&nbsp;/&nbsp;
							<font color="gray" class="six_end_cnt">${six.six_end_cnt -1 }명 모집 중</font>
						</span>
					</c:otherwise>
				</c:choose>
				<span class="badge badge-primary mr-2">${six.gender_cd }</span>${six.age_range }
			</p>
			<p class="content p4">${six.six_name }</p>
			<p class="content p3">${six.six_location }</p>
			<input type="hidden" class="dis" value="${six.dis }">
		</td>
		
		<td class="td3" align="center">
			<input type="hidden" class="dttm" value="${six.six_end_dttm }">
			<p class="content p6"><fmt:formatDate value="${six.six_end_dttm }" pattern="yy.MM.dd(E)" /></p>
			<p class="content p7"><fmt:formatDate value="${six.six_end_dttm }" pattern="ahh:mm" /></p>
			<p class="content p8"></p>
			<c:if test="${six.m_id != null}">
				<img class="proimg" src="${pageContext.request.contextPath }/resources/images/jey/C01.png">
			</c:if>
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>
