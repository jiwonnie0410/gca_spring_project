<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--json할때 필요  -->
<script
	src="${pageContext.request.contextPath }/resources/js/json.min.js"></script>
<!-- 챌린지 자바스크립트 -->
<script
	src="${pageContext.request.contextPath }/resources/js/board/challenge_list.js"></script>

<style>
.container>div {
	border: 3px double;
	border-color: #FE9191;
	border-radius: 10px;
	margin-left: 8px;
	margin-top: 8px;
	padding: 10px;
	width: 95%;
	height: 100px;
	background-color: #fff;
}

.container>div:nth-child(2n+1) {
	background-color: white;
}
</style>
</head>
<body>
	<div id="content-wrapper">
		<div class="container">
			<section class="boardList">
				<div class="card mb-3">
					<div class="card-header" style="background-color: #FEBABA;">챌린지
						참여 이력</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table text-center">
								<thead>
									<tr>
										<th width="5%">NO</th>
										<th width="10%">구분</th>
										<th width="45%">챌린지 이름</th>
										<th width="12%">시작 날짜</th>
										<th width="12%">마감 날짜</th>
										<th width="10%">리워드</th>
									</tr>
								</thead>
								<tbody id="chtb"></tbody>
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

</body>
</html>