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
        <div class="col-4">
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
							<!-- 누락된 부분 -->
							<tr>
								<%--      <td>회원가입일자</td>
                <td>
                    <fmt:formatDate value="${dto.userRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
            </tr>
            <tr>
                <td>회원정보 수정일자</td>
                <td>
                    <fmt:formatDate value="${dto.userUpdatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
            </tr> --%>
							<tr>
								<td colspan="2" align="center"></td>
							</tr>
						</table>
						<div align="center">
							<h2>Choose Your Option</h2>
						</div>
						<br>
						<div class="info-user2">
							<input type="button" value="수정" id="btnUpdate"> <input
								type="button" value="삭제" id="btnDelete">
							<div style="color: red;">${message}</div>
							<!--이모티콘이로 대체  -->
							<span aria-hidden="true" class="li_settings fs1"></span> <span
								aria-hidden="true" class="li_lock fs1"></span>
							<i class="fas fa-user-edit"  aria-hidden="true" style="color:black; font-size:100px;" ></i> 
							 <i class="fa fa-lock fa-2x" aria-hidden="true" style="color:black; font-size:100px;"> </i> 
							 
							 <a href="changePassword"> 비밀번호 변경 </a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
