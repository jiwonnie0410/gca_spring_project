<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="paging" tagdir="/WEB-INF/tags" %> <!-- 페이징을 위한 라이브러리 -->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.table td {
	cursor: pointer;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/board/user_Qna.js"></script>
<sec:authentication property="principal.m_id" var="m_id" />
<title>boardList_json.jsp</title>
</head>
<body>
	<%-- ${boardSearchVO } --%>
	<div align="center">
		<div class="jumbotron" style="background-color: #FE9191;">
			<h2 style="color: white;">문의</h2>
			<!-- <p style="color: white;">* 홍보.</p> -->
		</div>
		<!-- -----------------------------------------검색폼 시작------------------------------------------------->
		<div>
			<form action="qnaboard" name="boardForm" id="boardForm">
				<input type="hidden" name="page" value="1" />
				<table>
					<tr>
						<td><select id="searchCondition" name="searchCondition"
							class="btn btn-outline-warning btn-sm dropdown-toggle" style="">
								<option value="">선택</option>
								<option value="qb_title"
									<c:if test="${boardSearchVO.searchCondition=='qb_title'}">selected</c:if>>질문유형</option>
								<option value="qb_content"
									<c:if test="${boardSearchVO.searchCondition=='qb_content'}">selected</c:if>>내용</option>
						</select></td>
						<td><input name="keyword" value="${boardSearchVO.keyword}"></td>
						<td><button type="button"
								class="btn btn-outline-warning btn-sm"
								style="border-color: #FAF0F0; color: #ffc0cb;"
								onclick="go_page(1)">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- -----------------------------------------------------검색폼 끝------------------------------------ -->



		<!------------------------------------------------------- 목록 시작 ----------------------------------->
		<!-- <h3>게시판 목록</h3> -->
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">작성자</th>
					<th class="text-center">제목</th>
				</tr>
			</thead>
			<tbody id="asktb"></tbody>
		</table>
		<button id="write" class="btn " type="button" data-toggle="modal"
			data-target="#myModal"
			style="background-color: #FE9191; color: white;">Write</button>
	</div>
	<!------------------------------------------------------- 목록  끝 ----------------------------------->




	<!-- ---------------------------------------페이징 시작------------------------------------------------- -->
	<!-- 페이징 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center" id="pageButton">
			<li class="page-item"><a class="page-link"
				href="javascript:getChallengeList()" aria-label="Previous"
				style="color: #FE9191;"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<!-- 페이지 번호 들어오는 곳 -->
			<li class="page-item"><a class="page-link"
				href="javascript:getChallengeList()" aria-label="Next"
				style="color: #FE9191;"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
	<!-- --------------------------------------------------페이징 끝 ------------------------------------>





	<!----------------------------------게시판 작성  ------------------------------------------------------------>
	<!-- Modal content-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					문의 사항 작성
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">

					<div class="panel-group">
						<div class="panel panel-success">
							<div class="panel-body">
								<%-- form --%>
								<form role="form" action="../ajax/insertBoard" id="ad_boardWriteForm" name="ad_boardWriteForm">
									<input type="hidden" name="qb_id" value=""> <input
										type="hidden" name="qb_title" value="">
									<div class="form-group">
										<div>
											제목 <select name="qb_title" id="qb_title"
												class="btn btn-outline btn-sm dropdown-toggle">
												<option selected>질문 유형 선택</option>
												<option value="반짝방 문의">반짝방 문의</option>
												<option value="회원관리 문의">회원관리 문의</option>
												<option value="동호희 문의">동호희 문의</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div>
											내용
											<textarea cols="40" rows="10" name="qb_content"
												id="qb_content" placeholder="내용을 입력해주세요"></textarea>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="button" id="btnIns"
												style="background-color: #FE9191; color: white;" class="btn">저장</button>
											<button type="reset" class="btn btn-danger">초기화</button>
											<button type="button" class="btn btn-info " data-dismiss="modal">Close</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- -------------------------------------게시물 상세보기 영역------------------------------  -->
	<!-- Modal 읽기-->
	<!-- 게시물 상세보기 영역 -->
	<div class="modal fade" id="Modalread" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					문의게시판 읽기
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
					<button type="button" class="btn " id="btnDel" style="background-color: #FE9191; color: white;">삭제</button>
					<button type="button" class="btn btn-primary" id="btnUpdete">수정</button>
					<button type="button" class="btn" data-dismiss="modal" style="background-color: #FE9191; color: white;">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>

</html>