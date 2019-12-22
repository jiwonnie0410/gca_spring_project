<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용병 모집 방 생성하기</title>

	<!-- Bootstrap -->
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->

	<!-- private : icon -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
	
	<!-- private : slider -->
	<link rel="stylesheet" href="../resources/css/mihy/nouislider.min.css">
	<script src="../resources/js/mihy/nouislider.min.js"></script>
	<link rel="stylesheet" href="../resources/css/mihy/nouislider.css">
	<script src="../resources/js/mihy/nouislider.min.js"></script>
	
	<!-- private : kakaoMap Api & Daum Address API -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>
	
	<!-- private : Description Action -->
	<script type="text/javascript" src="../resources/js/mihy/kakao_map.js"></script>
	<script type="text/javascript" src="../resources/js/mihy/six_room_cre.js"></script>
	<link rel="stylesheet" href="../resources/css/mihy/room_cre.css">
	

	
</head>

<body>

<nav class="fixed-top">
	<div align="center" class="nav_title mt-2 mb-2"><h4>용병 모집 방 만들기</h4></div>
</nav>

<form action="creRoom" method="post" id="frm" style="margin-top:40px">

	<div class="row mr-2 ml-2 mt-3 mb-3">
		<input type="text" class="form-control six_name" id="six_name" placeholder="용병 모집 방 이름" name="six_name">
		<span id="six_name_valid" class="six_valid pl-2"></span>
	</div>
	
	<div class="row mr-2 ml-2 mt-3 mb-3">
	<div class="txc-textbox mr-2">
		<div id="six_sport_div" class="btn-group">
			<input type="hidden" name="sports2_cd" id="six_sport_val">
			<button type="button" id="six_sport" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				운동 종목 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu six_sport_click">
				<c:forEach items="${sports_list }" var="list">
					<li data-cdid="${list.cd_id }">${list.cd_name }</li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div class="txc-textbox">
		<div id="six_skill_div" class="btn-group">
			<input type="hidden"  name="skill_cd" id="six_skill_val">
			<button type="button" id="six_skill" class="btn btn-default dropdown-toggle btn-block" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				숙련도 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<c:forEach items="${skill_list }" var="list">
					<li data-cdid="${list.cd_id }">${list.cd_name }</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<span id="six_sport_valid" class="six_valid pl-3"></span>
	</div>
	
	<div class="row mr-2 ml-2 mt-3 d_day">
		<span class="ml-2 mr-5">마감 날짜</span>
		<input type="date" id="six_end_day"><br>
		<span class="ml-2 mr-5 mt-2">마감 시간</span>
		<input class="mt-2" type="time" id="six_end_time">
		<input type="hidden" name="six_end_dttm" id="six_end">
	</div>
	<span id="six_end_valid" class="six_valid pl-3"></span>

	<div class="row mr-2 ml-2 mt-3 mb-3 location" style="padding: 0px">
		<input type="text" class="form-control" id="map_location" name="six_location" placeholder="만날 장소를 정해 주세요." readonly>
		<span id="six_location_valid" class="six_valid pl-3"></span>
	</div>
	<input type="hidden" name="six_xy" id="map_xy">
	<div id="map"></div>
	
	
	<div class="txc-textbox mr-2 ml-2 mt-3">
		<div id="six_finish_div" class="btn-group">
			<input type="hidden"  name="six_end_cnt" id="six_finish_val">
			<button type="button" class="btn btn-default dropdown-toggle" id="six_finish" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				모집 인원 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li data-cdid="2">1명 모집</li>
				<li data-cdid="3">2명 모집</li>
				<li data-cdid="4">3명 모집</li>
			</ul>
		</div>
		<span id="six_finish_valid" class="six_valid pl-1"></span>
	</div>
	
	<div class="row mr-2 ml-2 mt-2 mb-2 pt-2 six_gender">
		<c:forEach items="${gender_list }" var="list">
			<label class="radio_label ml-3">&nbsp;&nbsp;&nbsp;${list.cd_name }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:choose>
					<c:when test="${list.cd_id == 'G03' }">
						<input class="bg_gender_val" type="radio" name="gender_cd" id="${list.cd_id }" value="${list.cd_id }" checked="checked">
					</c:when>
					<c:otherwise>
						<input class="bg_gender_val" type="radio" name="gender_cd" id="${list.cd_id }" value="${list.cd_id }">
					</c:otherwise>
				</c:choose>
				<span class="checkmark"></span>
			</label>
		</c:forEach>
	</div>
	<span id="six_gender_valid" class="six_valid pl-3"></span>


	<span class="ml-2" id="pencil_title"><i class="fas fa-pencil-alt mr-2"></i>연령대를 선택해 주세요.</span><br>
	<p class="mr-2 ml-2 mt-1" id="age_text">
		<span class="age-val mr-1" id="age_lower"></span>
		<span class="age-val" id="age_upper"></span>
	</p>
	<div id="six_age_bar" class="mr-4 ml-4 mt-2 mb-3"></div>
	<input type="hidden" id="six_age" name="age_range">
	
	<input type="button" class="btn btn-default btn2 mt-2" id="btn_cre" value="방 생성">
	
</form>

</body>
</html>