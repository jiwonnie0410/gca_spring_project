<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 반응형 웹 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<!-- 네이버 아이디로 로그인 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<!-- CSS & JS -->
	<link href="./resources/css/admin/logincss.css" rel="stylesheet">
	<script type="text/javascript" src="./resources/js/member/loginjs.js"></script>
	
	<title> 운동하자 로그인 </title>
	
	<script>
			// 확인 메시지 띄우기
			if('${idMessage}' != ''){
				alert('${idMessage}');
			}
			if('${pwMessage}' != ''){
				alert('${pwMessage}');
			}
	</script>

</head>
<body>
${param.error}

<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
  로그인 에러입니다.<br>
  예외 타입：${SPRING_SECURITY_LAST_EXCEPTION.getClass().name}<br>
  메시지：${SPRING_SECURITY_LAST_EXCEPTION.message}<br>
  <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
</c:if>


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
					<form role="form" id="loginfrm" name="loginfrm" action="securityLogin" method="POST">
						<table>
							<tr>
								<td><input type="text" placeholder="ID" class="form-control" id="id" name="paramLoginId" value="${param.id}" style="width:170px;" /></td>
								<td rowspan="2"><button type="button" onclick="checkForm()" class="button-general" style="width:70px; height:84px;" style="width:50px;"> LOGIN </button></td>
							</tr>
							<tr>
								<td><input type="password" placeholder="PASSWORD" class="form-control" id="pw" name="paramPassword" style="width:170px;" /></td>
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