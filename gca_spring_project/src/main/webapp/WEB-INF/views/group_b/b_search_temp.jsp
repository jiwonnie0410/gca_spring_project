<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
			<p class="content p5">
<%-- 				<span class="badge badge-warning mr-1 ml-2">
					<font color="red" class="bg_now_cnt">${bg.bg_now_cnt }</font>
					&nbsp;/&nbsp;<font color="gray" class="bg_end_cnt">${bg.bg_end_cnt }명</font>
				</span> --%>
				<span class="badge badge-danger mr-1 ml-2">
					<font color="white" class="bg_now_cnt">${bg.bg_team_cnt } vs ${bg.bg_team_cnt }</font>
				</span>
				<span class="badge badge-primary mr-2">${bg.gender_cd }</span>${bg.age_range }
			</p>
			<p class="content p4">${bg.bg_name }</p>
			<p class="content p3">${bg.bg_location }</p>
			<input type="hidden" class="dis" value="${bg.dis }">
		</td>
		
		<td class="td3" align="center">
			<input type="hidden" class="dttm" value="${bg.bg_end_dttm }">
			<p class="content p6"><fmt:formatDate value="${bg.bg_end_dttm }" pattern="yy.MM.dd(E)" /></p>
			<p class="content p7"><fmt:formatDate value="${bg.bg_end_dttm }" pattern="ahh:mm" /></p>
			<p class="content p8"></p>
		</td>
	</tr>
	</c:forEach>
