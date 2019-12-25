<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
Latest compiled and minified CSS
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
jQuery library
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
Popper JS
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
Latest compiled JavaScript
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

꼭있어야함
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script> -->

<!--json할때 필요  -->
<script
	src="${pageContext.request.contextPath }/resources/js/json.min.js"></script>

<!-- 미현 : 다음 주소 입력 및 xy좌표 입력 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/mihy/kakao_map.js"></script>

<script>
	// 확인 메시지 띄우기
	if ('${pwMessage}' != '') {
		alert('${pwMessage}');
	}

	// 수정 확인
	$(document)
			.ready(
					function() {
						$("#btnUpdate")
								.click(
										function() {
											// 확인 대화상자    
											if (confirm("수정하시겠습니까?")) {
												document.form1.action = "${pageContext.request.contextPath}/member/update";
												document.form1.submit();
											}
										});

						// 미현 주소 클릭 시 다음주소 및 xy좌표 입력
						$("#mAddress1").on("click", mAddress_find);
					});
	console.log($('#m_xy'))
</script>
<sec:authentication property="principal.m_image_cd" var="image" />
<title>정보 수정</title>

<style>

.td-info {
	background: #E7E7E7;
	border: 2px solid #E7E7E7;
	border-radius: 7px;
	font-size: 15px;
	font-weight: bolder;
	margin: 0.3em auto;
	padding: 2px 4px;
	position: relative;
	height: 20px;
	width: 300px;
}

</style>
</head>
<body>
	<div>
		<div class="col-50">
			<div class="card">
				<div class="card-header" style="background-color: #FEBABA;">
					정보 수정</div>
				<div class="card-body">
					<form name="form1" method="post">
						<table class="table">
							<!-- 변경 못하는 정보 -->
							<tr>
								<td colspan="2" >&nbsp;&nbsp;<font
									color="gray">아이디 |</font>&nbsp;&nbsp;${dto.m_id}&nbsp;&nbsp;&nbsp;&nbsp;
									<font color="gray">이 름 |</font>&nbsp;&nbsp;${dto.m_name}
								</td>
							</tr>
							<!-- 변경 가능한 정보 -->
							<tr>
								<td ><label
									style="background-color: #FFE08C; width: 100px; color: gray; text-align: center; height: 35px; line-height: 35px; border-radius: 8px;">닉네임</label></td>
								<td><input name="m_nick" value="${dto.m_nick}"
									class="form-control form-control-sm"></td>
							</tr>
							<tr>
								<td ><label
									style="background-color: #FFE08C; width: 100px; color: gray; text-align: center; height: 35px; line-height: 35px; border-radius: 8px;">이메일</label>
								</td>
								<td><input name="m_email" value="${dto.m_email}"
									class="form-control form-control-sm"></td>
							</tr>
							<tr>
								<td >
									<input type="button" id="mAddress1" class="div-button" value="주소 찾기"
									style="background-color: #FFE08C; width: 100px; color: gray; text-align: center; height: 35px; line-height: 35px; border-radius: 8px; text-decoration: underline;"></td>
								<td><input name="m_location" value="${dto.m_location}"
									class="form-control form-control-sm"></td>
							</tr>
						</table>
							<!-- 수정 버튼 -->
							<div align="center">
								<button type="submit" id="btnUpdate" name="btnUpdate"
									class="div-button">
									수정하기 &nbsp;&nbsp;<font size="3"> <i
										class="fas fa-user-edit"></i></font>
								</button>
							</div>
						<!-- xy 좌표 받아오기 -->
						<input type="hidden" id="m_xy" name="m_xy" value="${dto.m_xy}" />
						<br />

					</form>

				</div>

			</div>
		</div>
	</div>


</body>
</html>
