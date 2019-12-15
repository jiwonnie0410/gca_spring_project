<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Modal 읽기-->
<!-- 게시물 상세보기 영역 -->
<div class="panel-group">
	<div class="panel panel-success" style="margin-top: 10px;">
		<div class="panel-heading"
			style="background-color: pink; color: black">문의 사항</div>
		<div class="panel-body">
			<%-- form --%>
			<form action="view?pb_id=${dto.qb_id}" id="frm" method="GET">
				<input type="hidden" value="${dto.qb_id}">
				<div class="form-group">
					<div>
						<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
						작성일자 :
						<fmt:formatDate value="${dto.qb_date}"
							pattern="yyyy-MM-dd a HH:mm:ss" />
						<!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
					</div>
				</div>
				<div class="form-group">
					<div>
						제목 <input name="qb_title" id="qb_title" size="80"
							value="${dto.qb_title}" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<div>
						내용
						<textarea name="qb_content" id="qb_content" rows="4"
							readonly="readonly">${dto.qb_content}</textarea>
					</div>
				</div>
				<div style="width: 650px; text-align: center;">
					<!-- 게시물번호를 hidden으로 처리 -->
					<input type="hidden" name="qb_id" value="${dto.qb_id}">
					<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
					
					<!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
					<!-- 	<button type="button" class="btn btn-primary px-5 py-3  mt-3" id="btnList">목록</button> -->
				</div>
				
				
				
				
				
				<c:if test="${dto.qb_origin}!= null and ${dto.qb_origin} != '' ">
					<div align="center">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">답변제목</th>
								<td colspan="5" width="800" align="center">${dto.qb_title}</td>
							</tr>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">답변내용</th>
								<td colspan="5" width="800" align="center">${dto.qb_content }</td>
							</tr>
						</table>
					</div>
				</c:if>
			</form>
		</div>
	</div>
</div>
