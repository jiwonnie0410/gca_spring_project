<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<c:forEach items="${ list }" var="six">
	<tr class="tr ${six.six_num}">
		<td class="td1">
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
				<span class="badge badge-warning mr-1 ml-2">
					<font color="red" class="six_now_cnt">
					<c:choose>
						<c:when test="${six.six_now_cnt } = ${six.six_end_cnt }">인원 초과</c:when>
						<c:otherwise>모집 중</c:otherwise>
					</c:choose></font>
				</span>
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
		</td>
	</tr>
	</c:forEach>
