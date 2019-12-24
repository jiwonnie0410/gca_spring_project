<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마감된 반짝방</title>

	<!-- private : icon 1 & slide 2 & alert+confirm -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
	<link rel="stylesheet" href="../resources/css/mihy/swiper.min.css">
	<script src="../resources/js/mihy/swiper.min.js"></script>
	<link href="../resources/css/mihy/notiflix-1.9.1.min.css" rel="stylesheet">
	<script src="../resources/js/mihy/notiflix-1.9.1.min.js"></script>
    
<script>
	var mgrant = "<sec:authentication property='principal.m_status_cd'/>";
</script>

	<!-- private : Description Action -->
	<script type="text/javascript" src="../resources/js/mihy/s_search.js"></script>
	<link rel="stylesheet" href="../resources/css/mihy/search.css">

</head>


<body>

<sec:authentication property='principal.m_status_cd' var='mStatus'/>
<nav class="fixed-top">
<div align="center" class="nav_title mt-2 mb-2"><h4>마감된 반짝방</h4></div>
<input type="hidden" id="endroom" value="endroom">

<!-- <nav class="sticky-top"> -->
<form action="getSgListEnd" name="searchSport" id="searchSport" method="post">
<div class="swiper-container sticky-top">
	<div class="swiper-wrapper">
		<div class="swiper-slide p-2"><i class="fas fa-star-of-david pr-2"></i>전체</div>
		<c:forEach items="${sports_list }" var="list">
			<div class="swiper-slide p-2" id="${list.cd_id }" data-sports="${list.cd_id }">${list.cd_etc}${list.cd_name }</div>
		</c:forEach>
	</div>
</div>
<input type="hidden" name="key" id="key" value="${sgroup.key}">
<input type="hidden" name="keyval" id="keyval" value="${sgroup.keyval}">
</form>
</nav>

<table class="table table-striped endroom" id="tb1" style="margin-top:95px">
	<c:forEach items="${ list }" var="sg">
	<tr class="tr ${sg.sg_num}">
		<td class="td1">
			<p class="content p9"><span class="badge badge-pill badge-light shadow-sm">${sg.dis }</span></p>
			<p class="content p1">
				<c:forEach items="${sports_list }" var="list">
				<c:choose>
				<c:when test="${sg.sports1_cd == list.cd_id}">
					<c:if test="${list.cd_etc != null}">${list.cd_etc}</c:if>
					<c:if test="${list.cd_etc == null}">
						<img src="../resources/images/mihy/badminton-black.png" width="32px">
					</c:if>
				</c:when>
				</c:choose>
				</c:forEach>
			</p>
			<p class="content p2"><span class="badge badge-dark">${sg.skill_cd }▲</span></p>
		</td>
		
		<td class="td2">
			<p class="content p5 end">
				<span class="badge badge-secondary mr-1 ml-2">
					<font color="#D8D8D8" class="sg_now_cnt">${sg.sg_now_cnt }</font>
					&nbsp;/&nbsp;<font color="#D8D8D8" class="sg_end_cnt">${sg.sg_end_cnt }명</font>
				</span>
				<span class="badge badge-secondary mr-2" style="color:#D8D8D8;">${sg.gender_cd }</span>${sg.age_range }
			</p>
			<p class="content p4 end">${sg.sg_name }</p>
			<p class="content p3">${sg.sg_location }</p>
			<input type="hidden" class="dis" value="${sg.dis }">
		</td>
		
		<td class="td3" align="center">
			<input type="hidden" class="dttm" value="${sg.sg_end_dttm }">
			<p class="content p6 end"><fmt:formatDate value="${sg.sg_end_dttm }" pattern="yy.MM.dd(E)" /></p>
			<p class="content p7 end"><fmt:formatDate value="${sg.sg_end_dttm }" pattern="ahh:mm" /></p>
			<p class="content p8"></p>
			<c:if test="${sg.m_id != null}">
				<img class="proimg" src="${pageContext.request.contextPath }/resources/images/jey/C01.png">
			</c:if>
		</td>
		
	</tr>
	</c:forEach>
</table>
</body>
</html>