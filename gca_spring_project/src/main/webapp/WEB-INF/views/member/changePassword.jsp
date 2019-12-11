<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!-- Latest compiled JavaScript -->
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- JS -->
		<script	src="${pageContext.request.contextPath }/resources/js/member/changePasswordJs.js"></script>
		<title> 비밀번호 변경 </title>
</head>
<body>
  <div class="row">
        <div class="col-4">
          <div class="card">
            <div class="card-header" style="background-color: #FEBABA;"> 비밀번호 변경 </div>
            <div class="card-body">
					<form name="form1" method="post">
						
						<div align="center">
							<h2>Choose Your Option</h2>
						</div>
						<br>
							<input type="button" value="정" id="btnUpdate"> <input type="button" value="삭제" id="btnDelete">
							<div style="color: red;"></div>
							<!--이모티콘이로 대체  -->
							 
							 <!-- 비밀번호 변경 -->
							 <a href="/member/changePassword">비밀번호 변경</a>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
