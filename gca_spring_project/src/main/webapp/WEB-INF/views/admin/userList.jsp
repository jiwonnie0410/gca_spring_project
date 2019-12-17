<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

	
<script src="${pageContext.request.contextPath }/resources/js/admin/user.js"></script>

</head>

<body id="page-top">
		<!------------------------------------------------------------------------------------------------------------  -->
		<div id="content-wrapper">
			<div class="container-fluid">
				<h1 align="center">회원관리</h1>
				<section class="userlist">
					<div class="card mb-3">
						<div class="card-header" style="background-color: #FEBABA;">회원관리</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table text-center">
									<thead>
										<tr>
											<th class="text-center">아이디</th>
											<th class="text-center">이름</th>
											<th class="text-center">성별</th>
											<!-- <th class="text-center">거주지</th> -->
											<th class="text-center">계정상태</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
				</section>
				<br>
<!-- -------------------------------------------------------------------------------------------------------------------- -->
				<!-- 처리 상태 선택 -->
				<div>
					<div align="right">
						<button type="button" class="btn button"
							style="border: 1.5px solid #FEBABA;">전체</button>
						<button type="button" class="btn button"
							style="border: 1.5px solid #FEBABA;">처리 중</button>
						<button type="button" class="btn button"
							style="border: 1.5px solid #FEBABA;">처리 완료</button>
						&nbsp;&nbsp;
					</div>

				</div>
				<section class="list">
					<!-- DataTables Example -->
					<div class="card mb-3">
						<div class="card-header" style="background-color: #FEBABA;">신고관리</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>신고자 회원 아이디</th>
											<th>피신고자 회원이름</th>
											<th>사유</th>
											<th>신고당한 횟수</th>
											<th>상세보기</th>
											<!-- <th>ㅅ</th>
										<th>Salary</th> -->
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>신고자 회원 아이디</th>
											<th>피신고자 회원아이디</th>
											<th>사유</th>
											<th>신고당한 횟수</th>
											<th>상세보기</th>
											<!-- <th>Start date</th>
										<th>Salary</th> -->
										</tr>
									</tfoot>
									
								</table>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title">신고사유</h4>
					<button type="button" class="close" data-dismiss="modal"
						style="background-color: red; border: 1.5px solid red;">&times;</button>
				</div>

				<div class="modal-body">
					<div class="modal-content">
						<label>신고자 회원 아이디:</label> <label>피신고자 회원 아이디:</label> <label>신고
							사유</label>
						<textarea rows="10" class="form-control" readonly="readonly"
							id="content"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">Close</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">처리</button>
				</div>
			</div>

		</div>
	</div>

<!-- ------------------------------------------Modal 읽기------------------------------------------------------------------>
	<!-- 게시물 상세보기 영역 -->
	<div class="modal fade" id="Modalread" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					회원정보 조회
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
				</div>
				<div class="modal-footer">
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
