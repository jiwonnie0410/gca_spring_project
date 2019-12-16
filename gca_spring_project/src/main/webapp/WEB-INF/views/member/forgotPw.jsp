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
		
		<!-- 자바스크립트 비밀번호 찾기 -->
		<script type="text/javascript" src="./resources/js/member/forgotPwJs.js"></script>
		
		<script>
			// 확인 메시지 띄우기
			if('${pwMessage}' != ''){
				alert('${pwMessage}');
			}
		</script>
</head>

<body>
	<div align="center">
	
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> 임시 비밀번호 받기 </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<h6> 해당 아이디 및 회원정보에 등록된 이름과 이메일을 입력하시면 이메일로 임시 비밀번호를 보내드리고 있습니다. <br>임시 비밀번호로 로그인 해 주세요.  </h6><br />
				<form role="form" id="forgotPwfrm" name="forgotPwfrm" action="getTempPassword">
					<input type="hidden" id="m_email" name="m_email">
					<table>
						<tr>
							<th width="120" align="right">ID</th>
							<td width="200" colspan="3">
								<input type="text" id="fid"	name="m_id" class="form-control form-control-sm"	value="${param.mId }" /></td>
						</tr>
						<tr>
							<th height="50">Name</th>
							<td colspan="5">
								<input type="text" id="fname" name="m_name" class="form-control form-control-sm" value="${param.mName }" /></td>
						</tr>

						<tr>
							<th height="50">Email</th>
							<td align="center">
								<input type="text" id="femail1" name="email1" class="form-control form-control-sm" value="${param.email1 }" /></td>
							<td>@</td>
							<td><select id="femail2" name="email2" class="btn btn-secondary btn-sm dropdown-toggle">
									<option value="gmail.com" selected>gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option></select></td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="2" height="60"><button type="button" onclick="resetPw()" class="button-general" style="width:210px;"> SEND AN EMAIL </button></td>
							<td colspan="2"><button type="button" onclick="location.href='./'" class="button-general" style="width:210px;"> GO BACK </button></td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>