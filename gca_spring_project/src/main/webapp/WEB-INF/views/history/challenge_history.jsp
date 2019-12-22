<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린지 히스토리</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<sec:authentication property="principal.username" var="id"/>

<script>
	

</script>

<style>

.container > div{ /* 컨테이너 내 div(card 하나하나.) */
	border: 3px double;
	border-color: #FE9191;
	border-radius: 10px;
	margin-left:8px;
	margin-top:8px;
	padding-top:10px;
	padding-bottom:10px;
	padding-left:10px;
	width: 95%;
	height: 130px;

	background-color: #FAF0F0;
}
.container > div:nth-child(2n+1) { /* 홀수번째 카드 배경색 분홍색(으로 했는데 스페셜챌린지만 분홍색으로 하는게 더 나을까?) */
	background-color: white;
}




</style>

</head>
<body>
<div align="left" style="background: #FE9191; color: #fff; height: 70px; padding:20px; font-size:20px; font-weight:bold;">
		나의 챌린지 내역
</div>
<div style="align-content:center; margin-top: 40px" class="container">
	<!-- 참여하는순간 [id=card_#] 인 div가 append되고(id 각각 다르게 줘야함-class주는게 낫나?-) 기간 끝나면 성공이냐 실패냐 체크하여 도장이미지 바뀌게 할것임 -->
	<!-- 컨테이너 안에는 각각 챌린지 카드 div들. -->
	
	<!-- 챌린지 리스트 불러오기 -->
	<c:set var="chall_id" value="${1}"/>
    <c:forEach var="mychall" items="${mychallist}">
		<div id="card_${chall_id}" style="position:relative;">
			<span style="float:left;">
				&nbsp;<span style="padding:0 5px; border-radius:8px; background-color: #FE9191; color:#fff;
					font-weight:500; font-size:15px; font-style: oblique;">~${mychall.cl_status}~</span>
				&nbsp;<span style="text-align:center; border:2px dotted #FE9191; border-radius:5px;	padding:2px 15px;
					font-weight: bold; font-size:17px;">${mychall.cl_name}<br /></span>
				<span style="padding-top:10px; color:blue; font-size:12px; font-weight:bold;">
					${mychall.cl_start_dttm}
				</span>
				 ~ 
				<span style="padding-top:10px; color:blue; font-size:12px; font-weight:bold;">
					${mychall.cl_end_dttm}<br />
				</span>
				
				<img style="padding-bottom:5px;" width="25px" height="28px"
		          				src="${pageContext.request.contextPath }/resources/images/icon/heart.png">
				
				${mychall.cl_score}점<br />
				
				<img style="padding-bottom:5px;" width="25px" height="28px"
		          				src="${pageContext.request.contextPath }/resources/images/jey/money11.png">
				보증금 1000~5000
			</span>
			<span style="position:absolute; left:65%; top:18.5%; float: right;">
				<img width="140px" height="112px" src="${pageContext.request.contextPath }/resources/images/jey/${mychall.clh_status_cd}.png">
			</span>
		</div>
		<c:set var="chall_id" value="${chall_id + 1}"/>
				
	</c:forEach>
	
	
	
	<%-- <div id="card_2" style="clear: both; position:relative;">
		<span style="float:left;"><기본>반짝 2회<br />2019.10.27 ~ 2019.11.2<br />점수 100점</span> <!-- 참여한 챌린지 정보 -->
		<span style="float: right; position:absolute; left:63%; top:0.5%;">
			<img width="140px" height="112px" src="${pageContext.request.contextPath }/resources/images/jey/challenge_fail.png"> <!-- 진행/성공/실패여부 도장 -->
		</span>
	</div>
	
	<div id="card_3" style="clear: both; position:relative;">
		<span style="float:left;"><기본>반짝 3회<br />2019.10.13 ~ 2019.10.19<br />점수 150점</span>
		<span style="float: right; position:absolute; left:63%; top:0.5%;">
			<img width="140px" height="112px" src="${pageContext.request.contextPath }/resources/images/jey/challenge_success.png">
		</span>
	</div>
	
	<div id="card_4" style="clear: both; position:relative;">
		<span style="float:left;"><기본>러닝 반짝 2회<br />2019.11.3 ~ 2019.11.9<br />점수 120점</span>
		<span style="float: right; position:absolute; left:63%; top:0.5%;">
			<img width="140px" height="112px" src="${pageContext.request.contextPath }/resources/images/jey/challenge_ing.png">
		</span>
	</div>
	
	<div id="card_5" style="clear: both; position:relative;">
		<span style="float:left;"><스페셜>배드민턴 반짝 2회<br />2019.9.29 ~ 2019.10.5<br />점수 800점<br />보증금 1000원~10000원</span>
		<span style="float: right; position:absolute; left:63%; top:0.5%;">
			<img width="140px" height="112px" src="${pageContext.request.contextPath }/resoures/images/jey/challenge_success.png">
		</span>
	</div> --%>
</div>
	
</body>
</html>