<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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


<!-- 꼭있어야함 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!--json할때 필요  -->
<script
	src="${pageContext.request.contextPath }/resources/js/json.min.js"></script>
<title>회원정보 상세 페이지</title>
		<script>
			// 확인 메시지 띄우기
			if('${pwMessage}' != ''){
				alert('${pwMessage}');
			}
		</script>
<script>
	$(document)
			.ready(
					function() {
						$("#btnUpdate")
								.click(
										function() {
											// 확인 대화상자    
											if (confirm("수정하시겠습니까?")) {
												document.form1.action = "${pageContext.request.contextPath}/member/update.do";
												document.form1.submit();
											}
										});

						$("#btnDelete")
								.click(
										function() {
											// 확인 대화상자 
											if (confirm("삭제하시겠습니까?")) {
												document.form1.action = "${pageContext.request.contextPath}/member/delete.do";
												document.form1.submit();
											}
										});
					});
</script>
</head>
<body>

  <div >
        <div class="col-50">
          <div class="card">
            <div class="card-header" style="background-color: #FEBABA;">
              my menu
            </div>
            <div class="card-body">
					<form name="form1" method="post">
						<table>
							<tr>
								<td>아이디</td>
								<!-- id는 수정이 불가능하도록 readonly속성 추가 -->
								<td><input name="m_id" value="${dto.m_id}"
									readonly="readonly" style="border: none"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="m_password"
									style="border: none"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input name=m_name value="${dto.m_name}"
									style="border: none"></td>
							</tr>
							<!-- 누락된 부분 -->
							<tr>
								<td>이메일주소</td>
								<td><input name="m_email" value="${dto.m_email}"
									style="border: none"></td>
							</tr>
							<!-- 누락된 부분 -->
							<tr>
					
							<tr>
								<td colspan="2" align="center"></td>
							</tr>
						</table>
						<div align="center">
							<h2>Choose Your Option</h2>
						</div>
						<br>
						<div class="info-user2">
							<!-- <input type="button" value="수정" id="btnUpdate"> <input
								type="button" value="삭제" id="btnDelete"> -->
							<div style="color: red;">${message}</div>
							<!--이모티콘이로 대체  -->
							<i class="fas fa-user-edit" id="btnUpdate"  aria-hidden="true" style="color:black; font-size:50px;" ></i>
							<i class="fas fa-door-open" id="btnDelete" style="color:black; font-size:50px;"></i> 
							 <i class="fa fa-lock fa-2x"  aria-hidden="true" style="color:black; font-size:50px;"> </i> 
							 
							 <a href="changePassword"> 비밀번호 변경 </a>
							 
						</div>
					</form>
							 <form action="../logout" method="post">
							  <button>로그아웃</button>
							</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
