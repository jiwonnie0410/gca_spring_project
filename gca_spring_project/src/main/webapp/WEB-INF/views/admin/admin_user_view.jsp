<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>회원정보 상세 페이지</title>
</head>
<body>

  <div class="row">
        <div class="col-40">
          <div class="card">
            <div class="card-header" style="background-color: #FEBABA;">
              my menu
            </div>
            <div class="card-body">
					<form name="form1" method="post">
						<table>
							<tr>
								<td>아이디</td>
								<!-- id는 수정이 불가능하도록 readonly속성 추가 -->
								<td><input name="m_id" value="${dto.m_id}"
									readonly="readonly" style="border: none"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="m_password"
									style="border: none"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input name=m_name value="${dto.m_name}"
									style="border: none"></td>
							</tr>
							<!-- 누락된 부분 -->
							<tr>
								<td>이메일주소</td>
								<td><input name="m_email" value="${dto.m_email}"
									style="border: none"></td>
							</tr>
						
							<tr>
								<td colspan="2" align="center"></td>
							</tr>
						</table>
						<br>
					</form>
				</div>
			</div>
		</div>
	</div>
