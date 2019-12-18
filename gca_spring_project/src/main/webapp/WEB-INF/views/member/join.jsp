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
		
		<!-- 제이쿼리 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- 버튼 css -->
		<link href="./resources/css/admin/logincss.css" rel="stylesheet">
		
		<!-- 자바스크립트 회원가입 및 다음주소API -->
		<script type="text/javascript" src="./resources/js/member/joinjs.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>
		<script type="text/javascript" src="./resources/js/mihy/kakao_map.js"></script>
		<!-- <script type="text/javascript" src="./resources/js/member/daumAddress.js"></script> -->
		<!-- <script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
		
		<script>
			// 확인 메시지 띄우기
			if('${joinMessage}' != ''){
				alert('${joinMessage}');
			}
		</script>
</head>

<body>
<div align="center">
		<!-- 페이지 제목 -->
		<br /><br /><br />
		<h4><b> JOIN US </b></h4>
		<br /><br />

		<!-- 회원가입 폼 -->
		<form role="form" id="joinfrm" name="joinfrm" action="insertJoin" method="post">
			<input type="hidden" id="email" name="m_email">
			<input type="hidden" id="xy" name="m_xy">
			<input type="hidden" id="character" name="m_image_cd" value="P05">
			<table>
				<tr>	<!-- 아이디 및 중복확인 버튼 -->
					<th width="50" align="right"> ID </th>
					<td colspan="2">
						<input type="text" id="joinId" name="m_id" class="form-control form-control-sm" onkeyup="idCondition()" value="${param.mId }" /></td>
					<td width="10" align="center">
						<input disabled id="idButton" type="button" class="btn button-title" style="height: 30px;" onclick="idCheck()" value="중복확인" /></td>
				</tr>

				<tr>
					<td height="30"></td>
					<td colspan="3" id="idConfirmMsg"><font size="2">*아이디는 영문자, 숫자를 혼합하여 6-12자리 </font></td>
				</tr>

				<tr>	<!-- 비밀번호 -->
					<th> Password </th>
					<td colspan="3"><input type="password" id="password1" name="m_password" class="form-control form-control-sm" onkeyup="pwCheck()" placeholder="비밀번호" /></td>
				</tr>
				
				<tr>
					<td></td>
					<td colspan="3" id="conditionPw"><font size="2">*비밀번호는 숫자, 특수문자를 혼합하여 6-10자리</font></td>
				</tr>

				<tr>
					<td></td>
					<td colspan="3"><input type="password" id="password2" class="form-control form-control-sm" onkeyup="pwCheck()" placeholder="비밀번호 확인" /></td>
				</tr>

				<tr>
					<td></td>
					<td colspan="3" id="confirmPw"><font size="2">*비밀번호 재확인을 해 주세요.</font></td>
				</tr>
						
				<tr>	<!-- 캐릭터 선택 -->
					<th height="100px"> Characters </th>
					<td colspan="3">
						<span class="character">
							<img id="P01" style="padding-bottom:5px;" width="65px" height="65px"
	          						src="${pageContext.request.contextPath }/resources/images/Characters/foreigner.gif">
						</span>
						<span class="character">
							<img id="P02" style="padding-bottom:5px;" width="65px" height="65px"
	          						src="${pageContext.request.contextPath }/resources/images/Characters/team-head.gif">
						</span>
						<span class="character">
							<img id="P03" style="padding-bottom:5px;" width="65px" height="65px"
	          						src="${pageContext.request.contextPath }/resources/images/Characters/bear.gif">
						</span>
						<span class="character">
							<img id="P04" style="padding-bottom:5px;" width="65px" height="65px"
	          						src="${pageContext.request.contextPath }/resources/images/Characters/director.gif">
						</span>
						<span class="character">
							<img id="P05" style="border-radius:5px; border: 2px solid #FE9191; padding-bottom:5px;" width="65px" height="65px"
	          						src="${pageContext.request.contextPath }/resources/images/Characters/bald.gif">
						</span>
					</td>
				</tr>
				
				<tr>	<!-- 이름 -->
					<th height="50"> Name </th>
					<td colspan="3"><input type="text" id="name" name="m_name" class="form-control form-control-sm" value="${param.mName }" /></td>
				</tr>
				
				<tr>	<!-- 닉넴 -->
					<th height="50"> Nickname </th>
					<td colspan="3"><input type="text" id="nick" name="m_nick" class="form-control form-control-sm" value="${param.mNick }" /></td>
				</tr>
				
				<tr>	<!-- 나이 및 성별-->
					<td height="50"></td>
					<td width="50"><input type="text" id="age" name="m_age" class="form-control form-control-sm" placeholder="나이"></td>
					<td colspan="2"><b>세</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" value="G01" name="checkbox1" onclick="oneCheckbox(this)" class="check-box" checked> 여성
							<input type="checkbox" value="G02" name="checkbox1" onclick="oneCheckbox(this)" class="check-box"> 남성 </td>
				</tr>
				
				<tr>	<!-- 이메일 -->
					<th height="50">Email</th>
					<td align="center" colspan="2">
						<input type="text" id="email1" name="email1" class="form-control form-control-sm" value="${param.email1 }" /></td>
					<td>@<select id="email2" name="email2" class="btn btn-secondary btn-sm dropdown-toggle">
							<option	value="gmail.com" selected>gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option></select></td>
				</tr>
				
				<tr>	<!-- 주소 및 주소찾기 버튼 -->
					<th> Address </th>
					<td align="left" colspan="3">
						<input type="button" id="mAddress1" class="button-title" style="height: 30px;" value="주소 찾기"></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="3"><input type="text" id="address" value="${param.mAddress1 }" name="m_location" class="form-control form-control-sm" /></td>
				</tr>

				<tr>
					<td colspan="2" height="100"><button type="button" onclick="checkForm()" class="button-general" style="width:230px;"> JOIN </button></td>
					<td colspan="2"><button type="button" onclick="location.href='./'" class="button-general" style="width:230px;"> GO BACK </button></td>
				</tr>
			</table>
		</form>
</div>
</body>
</html>