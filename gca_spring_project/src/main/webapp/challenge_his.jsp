<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 챌린지 자바스크립트 -->
<script
	src="${pageContext.request.contextPath }/resources/js/board/challenge_list.js"></script>
</head>
<body>
<div id="content-wrapper">
		<div class="container-fluid">
			<section class="boardList">
				<div class="card mb-3">
					<div class="card-header" style="background-color: #FEBABA;">회원관리</div>
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