<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alert.jsp</title>

<!-- 로그인한사람의 id,닉네임,캐릭터코드 저장 -->
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.m_nick" var="nick"/>
<sec:authentication property="principal.m_image_cd" var="image"/>
	
<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">

</head>

<body>
<!-- 상단 nav-tabs 시작 -->
<ul class="nav nav-tabs">
  <!-- 안읽은 알람 탭-->
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#notReadTab">새로운 메세지</a>
  </li>
  <!-- 전체 알람 탭-->
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#allReadTal">전체 메세지</a>
  </li>
</ul>
<!-- 상단 nav-tabs 끝 -->
<div class="tab-content">
	<div class="tab-pane fade show active" id="notReadTab">
		<c:forEach items="${notReadList }" var="notReadList">
		안읽음: ${notReadList.alert_content }<br>
		</c:forEach>
	</div>
	<div class="tab-pane fade" id="allReadTal">

		<c:forEach items="${alertList }" var="AllList">
		전체: ${AllList.alert_content }<br>
		</c:forEach>
	</div>
</div>

</body>
</html>