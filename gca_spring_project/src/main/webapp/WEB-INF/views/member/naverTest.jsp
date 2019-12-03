<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title> 네이버 로그인 테스트 </title>
		<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
		<!-- 네이버아이디로로그인 버튼 노출 영역 -->
		<div id="naverIdLogin"></div>
		<!-- //네이버아이디로로그인 버튼 노출 영역 -->
		
		<!-- 네이버아디디로로그인 초기화 Script -->
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
		<!-- // 네이버아이디로로그인 초기화 Script -->
</body>
</html>