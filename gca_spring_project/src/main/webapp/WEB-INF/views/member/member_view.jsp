<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<sec:authentication property="principal.m_image_cd" var="image"/>

<!--json할때 필요  -->
<title>My Page</title>

</head>
<body>

	<div>
		<div class="col-50">
			<div class="card">
				<div class="card-header" style="background-color: #FEBABA;">
					my menu</div>
				<div class="card-body">
					<form name="form1" method="post">
						<table >
							<tr>
								<td rowspan="8"><img style="padding-bottom:5px;" width="65px" height="65px"src="${pageContext.request.contextPath }/resources/images/Characters/${dto.m_image_cd}.gif"></td>				
							</tr>
							<tr>
								<td >아이디</td>
								<td>${dto.m_id}</td>
							</tr>
							<tr>
								<td >이름</td>
								<td>${dto.m_name}</td>
							</tr>
							<tr>
								<td >닉네임</td>
								<td>${dto.m_nick}</td>
							</tr>
							<tr>
								<td >레벨</td>
								<td><img style="padding-bottom:5px;" width="65px" height="65px"src="${pageContext.request.contextPath }/resources/images/level/${dto.m_level_cd}.png"></td>
							</tr>

							<tr>
								<td>주소</td>
								<td>${dto.m_location}</td>
							</tr>

							<tr>
								<td>이메일주소</td>
								<td>${dto.m_email}</td>
							</tr>

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
							<a href="updateform"><i class="fas fa-user-edit" aria-hidden="true"style="color: black; font-size: 50px;"></i></a>
							<!-- <i class="fas fa-door-open" id="btnDelete"style="color: black; font-size: 50px;"></i>  -->
							<i class="fa fa-lock fa-2x" aria-hidden="true" style="color: black; font-size: 50px;"> </i> 
							<a href="changePassword"> 비밀번호 변경 </a> 
							<a href="option">알람 환경설정</a>

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
