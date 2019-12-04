<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>challengeContents.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 모달 링크용 modal -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


    
    <style>
 

      
    </style>

</head>
<body>
	<div class="container">
	<div class="row">
	<div class="col">
      <div style="text-align:center;"><h2><b>챌린지</b></h2></div>
		<div class="content-div">
			<img
				src="${pageContext.request.contextPath }/resources/images/sports/${challenge.sports1_cd }.jpg"
				width="100%" height="200px"> <span><fmt:formatDate
					value="${challenge.cl_start_dttm }" type="date" /> ~ <fmt:formatDate
					value="${challenge.cl_end_dttm }" type="date" /> (D-${challenge.gap_day })</span> <span>${challenge.cl_name }</span>
			<span>기간안에 ${challenge.cl_cnt }회 참여</span> <span> <img
				src="${pageContext.request.contextPath }/resources/images/icon/heart.png"
				width="25px"> ${challenge.cl_score }점
			</span>
		</div>
	</div>
	</div>
	</div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  		<!-- 참가버튼 클릭시 모달뜨게함 -->
	<script src="${pageContext.request.contextPath }/resources/js/surim/challenge.js"></script>
  	
</body>
</html>