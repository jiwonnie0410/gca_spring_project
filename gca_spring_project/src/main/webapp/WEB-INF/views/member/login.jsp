<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<link href="./resources/css/admin/logincss.css" rel="stylesheet">
	
	<title> 로그인 페이지</title>

</head>
<body>
	<div align="center">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center" style="padding-top:100px;">
						
					</div>
				</div><br /><br /><br /><br />
			</div>
		</div>
		
		<div class="row" align="center">
			<div class="col-md-3"></div>

			<div class="col-md-6" align="center">
			
				<div class="div-login">
				<!-- 네이버 아이디로 가입하기 버튼 -->
					<br /><br /><br />
					<div id="naverIdLogin"></div>
				<br /><br />
				
			
				<!-- 운동하자로 로그인 및 회원가입 폼 -->
					<br /><br /><br /><br />
					<form role="form" id="loginfrm" name="loginfrm" action="basic_login.do" method="POST">
						<table>
							<tr>
								<td><input type="text" placeholder="ID" class="form-control" id="id" name="id" value="${param.id}" style="width:170px;" /></td>
								<td rowspan="2"><button type="button" onclick="checkForm()" class="button-general" style="width:70px; height:84px;" style="width:50px;"> LOGIN </button></td>
							</tr>
							<tr>
								<td><input type="password" placeholder="PASSWORD" class="form-control" id="pw" name="pw" style="width:170px;" /></td>
							</tr>
						</table>
						<table>
							<tr>
								<td colspan="2"><button type="button" onclick="location.href='./join'" class="button-general"> JOIN </button></td>
							</tr>
							<tr>
								<td><button type="button" onclick="location.href='./forgotId'" class="button-title"> 아이디 찾기 </button></td>
								<td><button type="button" onclick="location.href='./forgotPassword'" class="button-title"> 비밀번호 찾기 </button></td>
							</tr>
						</table>
					</form>
					</div>
			</div>
			
			<div class="col-md-3"></div>
		</div>
	</div>
	
	
<!-- 네이버 아이디로 로그인 초기화 Script -->
		<script type="text/javascript">
			var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "BJ76vTS9xilyC5p9YXrY",
					callbackUrl: "http://localhost/gca/login/naverCallback",
					isPopup: true, /* 팝업을 통한 연동처리 여부 */
					loginButton: {color: "green", type: 3, height: 50} /* 로그인 버튼의 타입을 지정 */
				}
			);
			
			/* 설정정보를 초기화하고 연동을 준비 */
			naverLogin.init();
			
		</script>
<!-- // 네이버 아이디로 로그인 초기화 Script -->
</body>
</html>