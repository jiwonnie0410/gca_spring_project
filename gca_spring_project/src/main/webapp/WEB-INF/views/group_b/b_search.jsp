<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매치할 동호회를 찾아보세요!</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<script>

</script>

<style>

.sportsbar_p {
	border: 1px solid #FEE9E9;
	color: #FE9191;
}

.sportsbar_p:hover {
	border: 1px solid #FE9191;
}

.card {
    border: 5px solid #FEE9E9;
    border-radius: 8px;
	line-height: 0.5;
}

.card:hover {
	border: 5px solid #FE9191;
}

.card-img-top {
    width: 100%;
    height: 250px;
    object-fit: cover;
}

.card-img-overlay {
	border-radius: 8px;
	background-color: rgba( 255, 255, 255, 0.8 );
}

.section_1 {
	border-left: 5px solid #FEBABA;
}

.section_2 {
	border-radius: 8px;
	border: 1px solid #CBC1C1;
}

.btn {
	border: 2px solid #FEBABA;
	background-color: #FE9191;
}

</style>
</head>

<body>

<div class="container pt-3">

<div class="d-md-flex justify-content-center flex-md-row mb-3 p-2 sportsbar">
	<div class="m-2 p-2 rounded sportsbar_p"><i class="fas fa-cloud pr-3"></i>전체</div>
	<div class="m-2 p-2 rounded sportsbar_p"><i class="fas fa-basketball-ball pr-3"></i>농구</div>
	<div class="m-2 p-2 rounded sportsbar_p"><i class="fas fa-running pr-3"></i>달리기 &amp; 산책</div>
	<div class="m-2 p-2 rounded sportsbar_p"><i class="fas fa-hiking pr-3"></i>등산</div>
	<div class="m-2 p-2 rounded sportsbar_p"><img class="pr-3" src="${pageContext.request.contextPath }/images/badminton-pink.png" width="35px">배드민턴</div>
	<div class="m-2 p-2 rounded sportsbar_p"><i class="fas fa-bowling-ball pr-3"></i>볼링</div>
	<div class="m-2 p-2 rounded sportsbar_p"><i class="fas fa-swimmer pr-3"></i>수영</div>
	<div class="m-2 p-2 rounded sportsbar_p"><i class="fas fa-bicycle pr-3"></i>자전거</div>
</div>


<div class="card shadow" style="width:500px;">
  <img class="card-img-top" src="${pageContext.request.contextPath }/images/bg_1.jpg" alt="Card image">
  <div class="row card-img-overlay m-4">
  	<p><span class="badge badge-pill badge-primary">4명</span></p>
    <h4 class="card-title font-weight-bold pl-2">같이 달리기 하실 분!</h4>
  	<div class="section_1 col-md-8 pt-2">
	    <p class="card-text">달리기(중급 이상)</p>
	    <p class="card-text font-weight-bold">진성 초등학교 운동장</p>
	    <p class="card-text">여성 20대</p>
  	
  	</div>
  	<div class="section_2 col-md-4 text-center pt-3 shadow-sm">
	    <p class="card-text font-weight-bold">12.25 (수)</p>
	    <p class="card-text font-weight-bold">10:30</p>
	    <a href="#" class="btn btn-info">참여하기</a>
    </div>
  </div>
</div>

</div>
</body>
</html>