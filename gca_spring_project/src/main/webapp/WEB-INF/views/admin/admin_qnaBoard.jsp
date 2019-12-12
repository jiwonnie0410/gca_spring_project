<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/admin/admin_Qna.js"></script>
<title>boardList_json.jsp</title>
</head>
<body>
	<div id="content-wrapper">
		<div class="container-fluid">
			<h1 align="center">질문 관리</h1>
			<section class="boardList">
				<div class="card mb-3">
					<div class="card-header" style="background-color: #FEBABA;">회원관리</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table text-center">
								<thead>
									<tr>
										<th class="text-center">번호</th>
										<th class="text-center">제목</th>
										<th class="text-center">내용</th>
										<th class="text-center">답변</th>
										<th class="text-center">삭제</th>
									</tr>
								</thead>
								<tbody id="asktb"></tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- 페이징 시작 -->
		<my:paging paging="${paging}"></my:paging>
		<!-- 페이징 끝 -->
	</div>
	<!-- <button id="write" class="btn btn-primary px-5 py-3" type="button" data-toggle="modal" data-target="#myModal">Write</button> -->


	<!-- Modal content-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
				문의 답변
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">

					<div class="panel-group">
						<div class="panel panel-success" style="margin-top: 10px;">
							<div class="panel-heading"
								style="background-color: pink; color: black">문의 사항</div>
							<div class="panel-body">
								<%-- form --%>
								<form action="insertBoard" id="frm">
									<div class="form-group"></div>
									<div class="form-group">
										<div>
											제목 <select name="qb_title">
												<option value="qna1" selected>답변1</option>
												<option value="qna2">답변2</option>
												<option value="qna3">답변3</option>
												<option value="qna4">답변4</option>
											</select>
										</div>
									</div>
									<div>
										<input type="hidden" value="dto.">
									</div>
									<div class="form-group">
										<div>
											내용
											<textarea name="qb_content" id="qb_content"
												placeholder="내용을 입력해주세요"></textarea>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="button" id="btnIns">확인</button>
											<button type="reset" class="btn btn-danger">초기화</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
						
					<button type="button" class="btn btn-primary px-4 py-2"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<!-- Modal 읽기-->
	<!-- 게시물 상세보기 영역 -->
	<div class="modal fade" id="Modalread" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					문의게시판 관리
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
				</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-primary px-5 py-3 mt-3"
							id="btnUpdete" data-toggle='modal' data-target='#myModal'>답글</button>
						<button type="button" class="btn btn-primary px-5 py-3 mt-3"
							id="btnDelete">삭제</button>
					<button type="button" class="btn btn-primary px-4 py-2"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>

</html>