<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		
		<!-- JS & CSS -->
		<script	src="${pageContext.request.contextPath }/resources/js/member/changePasswordJs.js"></script>
		<link href="${pageContext.request.contextPath }/resources/css/admin/logincss.css" rel="stylesheet">
		<title> 비밀번호 변경 </title>
</head>
<body>
  <div class="row">
        <div class="col-4">
          <div class="card">
            <div class="card-header" style="background-color: #FEBABA;"><b> 비밀번호 변경 </b></div>
            <div class="card-body" align="center">
            <br /><br />
					<form name="pwfrm" method="post" action="updatePassword">
							<input type="hidden" name="m_id" value='<sec:authentication property="principal.username" />'>
							
							<table>
								<tr>
									<td><input type="password" id="password1" name="m_password" class="form-control form-control-sm" onkeyup="pwCheck()" placeholder="비밀번호" /></td>
								</tr>
								<tr>
									<td id="conditionPw"><font size="2">*비밀번호는 숫자, 특수문자를 혼합하여 6-8자리</font></td>
								</tr>
								<tr>
									<td><input type="password" id="password2" class="form-control form-control-sm" onkeyup="pwCheck()" placeholder="비밀번호 확인" /></td>
								</tr>
								<tr>
									<td id="confirmPw"><font size="2">*비밀번호 재확인을 해 주세요.</font></td>
								</tr>
								<tr height="80">
									<td align="center"><button type="submit" class="button-title" style="width:200px; height:30px;"> 변경 </button></td>
								</tr>
							</table>
						<br>
							 
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
