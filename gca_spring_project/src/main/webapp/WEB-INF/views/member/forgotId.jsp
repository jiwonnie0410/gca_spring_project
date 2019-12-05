<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<!-- 반응형 웹 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- 버튼 css -->
		<link href="./resources/css/admin/logincss.css" rel="stylesheet">
		
		<!-- 제이쿼리 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<!-- 자바스크립트 아이디 찾기 -->
		<script type="text/javascript" src="./resources/js/admin/forgotIdJs.js"></script>
</head>

<body>
	<div align="center">
	
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> 아이디 찾기 </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<h6> 회원정보에 등록된 이름과 이메일을 입력하시면 이메일로 아이디를 보내드립니다. </h6><br />
				<form role="form" id="forgotIdfrm" name="forgotIdfrm" action="basic_forgotId.do">
					<input type="hidden" id="email" name="mEmail">
					<table>
						<tr>
							<th width="100" height="50"> Name </th>
							<td width="240" colspan="3"><input type="text" class="form-control" id="name" name="mName" value="${param.name}" /></td>
						</tr>
						<tr>
							<th height="50"> Email </th>
							<td align="center"><input type="text"
								id="email1" name="email1" class="form-control" /></td>
							<td>@</td>
							<td><select id="email2" name="email2"
								class="btn btn-secondary dropdown-toggle"><option
										value="gmail.com" selected>gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option></select></td>
						</tr>
						<tr>
							<td colspan="4" height="60"><button type="button" onclick="sendEmail()" class="btn btn-md btn-primary btn-block"> SEND AN EMAIL </button></td>
						</tr>
						<tr>
							<td width="220" colspan="4"><button type="button"
									onclick="location.href='basic_loginForm.do'"
									class="btn btn-primary btn-block"> GO BACK </button></td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>