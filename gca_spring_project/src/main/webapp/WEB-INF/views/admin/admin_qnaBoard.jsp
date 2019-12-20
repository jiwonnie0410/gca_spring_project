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
<style type="text/css">
.table td {
	cursor: pointer;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/admin/admin_Qna.js"></script>
<title>질문 관리</title>
</head>
<body>
	<div id="content-wrapper">
		<div class="container-fluid">
			<h1 align="center">질문 관리</h1>
			<section class="boardList">
				<div class="card mb-3">
					<div class="card-header" style="background-color: #FEBABA;">질문관리</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table text-center" id="userlisttb" >
								<thead>
									<tr>
										<th class="text-center" width="20%">번호</th>
										<th class="text-center" width="20%">답변여부</th>
										<th class="text-center" width="20%">질문유형</th>
										<th class="text-center" width="20%">답변</th>
										<th class="text-center" width="20%">삭제</th>
									</tr>
								</thead>
								<tbody id="asktb"></tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
<!------------------------------------------------------- 목록  끝 ----------------------------------->


<!----------------------------------Modal 쓰기  ------------------------------------------------------------>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					문의 답변
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">

					<div class="panel-group">
						<div class="panel panel-success" style="margin-top: 10px;">
							<div class="panel-body">
								<%-- form --%>
								<form action="insertBoard" id="frm">
									<div class="form-group"></div>
									<input type="hidden" name="qb_id" value=""> 
									<input type="hidden" name="qb_title" value="답변">
									<div>
										<input type="hidden" name="qb_origin" id="qb_origin">
									</div>
									<div class="form-group">
										<div>
											내용
											<textarea cols="50" name="qb_content" id="qb_content"
												placeholder="내용을 입력해주세요"></textarea>
										</div>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="btnIns" style="background-color: #FE9191; color: white;" class="btn">저장</button>
					<button type="reset" class="btn btn-danger">초기화</button>
					<button type="button" class="btn btn-info " data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



<!-- -------------------------------------게시물 상세보기 영역------------------------------  -->	
	<!-- Modal 읽기-->
	<div class="modal fade" id="Modalread" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					문의게시판 관리
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>
</body>

</html>