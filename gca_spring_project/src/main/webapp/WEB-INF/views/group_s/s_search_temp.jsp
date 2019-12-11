<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<c:forEach items="${ list }" var="sg">
	<tr class="tr ${sg.sg_num}">
		<td class="td1">
			<p class="content p1">
			<c:choose>
				<c:when test="${sg.sports1_cd == 'S01'}"><i class="fas fa-basketball-ball pr-2"></i></c:when>
				<c:when test="${sg.sports1_cd == 'S02'}"><i class="fas fa-running pr-2"></i></c:when>
				<c:when test="${sg.sports1_cd == 'S03'}"><i class="fas fa-hiking pr-2"></i></c:when>
				<c:when test="${sg.sports1_cd == 'S04'}"><img src="../resources/images/mihy/badminton-black.png" width="32px"></c:when>
				<c:when test="${sg.sports1_cd == 'S05'}"><i class="fas fa-bowling-ball pr-2"></i></c:when>
				<c:when test="${sg.sports1_cd == 'S06'}"><i class="fas fa-swimmer pr-2"></i></c:when>
				<c:when test="${sg.sports1_cd == 'S07'}"><i class="fas fa-bicycle pr-2"></i></c:when>
				<c:otherwise><i class="fas fa-feather-alt pr-2"></i></c:otherwise>
			</c:choose>
			</p>
			<p class="content p2"><span class="badge badge-dark">${sg.skill_cd }▲</span></p>
		</td>
		
		<td class="td2">
			<p class="content p5">
				<span class="badge badge-warning mr-1 ml-2">
					<font color="red" class="sg_now_cnt">${sg.sg_now_cnt }</font>
					&nbsp;/&nbsp;<font color="gray" class="sg_end_cnt">${sg.sg_end_cnt }명</font>
				</span>
				<span class="badge badge-info mr-2">${sg.gender_cd }</span>${sg.age_range }
			</p>
			<p class="content p4">${sg.sg_name }</p>
			<p class="content p3">${sg.sg_location }</p>
			<input type="hidden" id="dis" value="${sg.dis }">
		</td>
		
		<td class="td3" align="center">
			<input type="hidden" class="dttm" value="${sg.sg_end_dttm }">
			<p class="content p6"><fmt:formatDate value="${sg.sg_end_dttm }" pattern="yy.MM.dd(E)" /></p>
			<p class="content p7"><fmt:formatDate value="${sg.sg_end_dttm }" pattern="ahh:mm" /></p>
			<p class="content p8"></p>
		</td>
	</tr>
	</c:forEach>
