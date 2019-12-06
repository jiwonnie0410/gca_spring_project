<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반짝 방 생성하기</title>

	<!-- Bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
	<script type="text/javascript" src="./resources/js/mihy/s_search_cre.js"></script>
	<link rel="stylesheet" href="../resources/css/mihy/s_search_cre.css">
	
</head>

<body>

<form action="creRoom" id="frm">

	<div class="row mr-2 ml-2 mt-3 mb-3">
		<input type="text" class="form-control sg_name" id="sg_name" placeholder="반짝 방 이름" name="sg_name">
		<span id="sg_name_valid" class="sg_valid pl-2"></span>
	</div>
	
	<div class="row mr-2 ml-2 mt-3 mb-3">
	<div class="txc-textbox mr-2">
		<div id="sg_sport_div" class="btn-group">
			<input type="hidden" name="sg_sport">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="sg_sport">
				운동 종목 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu sg_sport_click">
				<c:forEach items="${sports_list }" var="list">
					<li data="${list.cd_id }">${list.cd_name }</li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div class="txc-textbox">
		<div id="sg_skill_div" class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle btn-block" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="sg_skill" id="sg_skill">
				숙련도 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li>입문 이상</li>
				<li>초급 이상</li>
				<li>중급 이상</li>
				<li>고급 이상</li>
			</ul>
		</div>
	</div>
	<span id="sg_sport_valid" class="sg_valid pl-3"></span>
	</div>
	
	<div class="row mr-2 ml-2 mt-3 d_day">
		<span class="ml-2 mr-5" style="margin-top: 2px">마감 날짜</span>
		<input type="date" id="sg_end_day"><br>
		<span class="ml-2 mr-5 mt-2" style="margin-top: 2px">마감 시간</span>
		<input class="mt-2" type="time" id="sg_end_time">
		<input type="hidden" name="sg_end" id="sg_end">
	</div>
	<span id="sg_end_valid" class="sg_valid pl-3" style="display:none;"></span>

	<div class="row mr-2 ml-2 mt-3 mb-3" style="padding: 0px">
		<input type="text" class="form-control" placeholder="만날 장소를 정해 주세요." id="sg_location" name="sg_location" readonly>
		<span id="sg_location_valid" class="sg_valid pl-3"></span>
	</div>
	<input type="hidden" name="sg_xy" id="sg_xy">
	<div id="map"></div>
	
	
	<div class="txc-textbox mr-2 ml-2 mt-3">
		<div id="sg_finish_div" class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="sg_finish" id="sg_finish">
				참여 인원 
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li>2명</li>
				<li>3명</li>
				<li>4명</li>
			</ul>
		</div>
		<span id="sg_finish_valid" class="sg_valid pl-1"></span>
	</div>
	
	<div class="row mr-2 ml-2 mt-2 mb-2 pt-2">
		<label class="radio_label ml-3">&nbsp;&nbsp;&nbsp;혼성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="sg_gender" id="sg_gender" value="혼성" checked="checked">
			<span class="checkmark"></span>
		</label>
		<label class="radio_label">&nbsp;&nbsp;&nbsp;여성만&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="sg_gender" id="sg_gender" value="여성">
			<span class="checkmark"></span>
		</label>
		<label class="radio_label">&nbsp;&nbsp;&nbsp;남성만&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="sg_gender" id="sg_gender" value="남성">
			<span class="checkmark"></span>
		</label>
	</div>
	<span id="sg_gender_valid" class="sg_valid pl-3" style="display:none;"></span>


	<span class="ml-2" id="age_title"><i class="fas fa-pencil-alt mr-2"></i>연령대를 선택해 주세요.</span><br>
	<p class="mr-2 ml-2 mt-1" id="age_text" style="text-align:center;">
		<span class="age-val mr-1" id="age_lower"></span>
		<span class="age-val" id="age_upper"></span>
	</p>
	<div id="sg_age_bar" class="mr-4 ml-4 mt-2 mb-3"></div>
	<input type="hidden" id="sg_age" name="sg_age">
	
	
	<div id="sg_option1" class="collapse" style="margin: 0 10px 15px 10px;">
		<table>
			<tr>
				<td><input class="check-box" type="checkbox" id="sg_option1_box" name="sg_option" value="도구지참" style="margin:5px 0 0 0;"></td>
				<td sytle="padding:0 0 0 8px;">개인 도구 지참 <span class="badge badge-warning mr-1">예</span><span style="font-size:14px;color:gray;"> 농구공, 라켓, 셔틀콕 등</span></td>
			</tr>
		</table>
	</div>
	
	<div id="sg_option2" class="collapse" style="margin: 0 10px 15px 10px;">
		<table>
			<tr>
				<td><input class="check-box" type="checkbox" id="sg_option2_box" name="sg_option" value="반려동물" style="margin:5px 0 0 0;"></td>
				<td style="padding:0 0 0 8px;">반려 동물 동반</td>
			</tr>
		</table>
	</div>
	
	<input type="button" class="btn btn-default btn2 mt-2" id="btn_cre" value="방 생성">


</form>

<script>


</script>

</body>
</html>