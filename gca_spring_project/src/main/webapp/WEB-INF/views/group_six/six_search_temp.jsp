<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
