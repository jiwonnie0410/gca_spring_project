<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>option.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- range slider JS -->
<script>
	$(function() {
		var slider = document.getElementById("myRange"); 
		var output = document.getElementById("checkRange");
		output.innerHTML = slider.value;
		
		slider.oninput = function() {
		output.innerHTML = this.value;
		}
	});
</script>

	
<style>
.optionDiv {
	padding: 15px;
}

.title {
	text-align: center;
	font-size: 50px;
	font-weight: bold;
}


thead {
	font-size: 50px;
	font-weight: bold;
}

td {
	font-size: 50px;
	height : 150px;
}

button {
	width: 200px;
	height: 100px;
	font-size: 50px;
	font-weight: bold;
	background: #FE9191;
	border-radius: 30px;
	color: white;
	border: none;
}


/*************toggle switch**********************/
/** 출처: https://proto.io/freebies/onoff/  ios디자인 **/

.onoffswitch {
    position: relative; width: 150px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.onoffswitch-checkbox {
    display: none;
}
.onoffswitch-label {
    display: block; overflow: hidden; cursor: pointer;
    height: 67px; padding: 0; line-height: 67px;
    border: 2px solid #999999; border-radius: 67px;
    background-color: #c8c8c8;
    transition: background-color 0.2s ease-in;
}
.onoffswitch-label:before {
    content: "";
    display: block; width: 67px; margin: 0px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 81px;
    border: 2px solid #999999; border-radius: 67px;
    transition: all 0.2s ease-in 0s; 
}
.onoffswitch-checkbox:checked + .onoffswitch-label {
    background-color: #FE9191;
}
.onoffswitch-checkbox:checked + .onoffswitch-label, .onoffswitch-checkbox:checked + .onoffswitch-label:before {
   border-color: #FE9191;
}
.onoffswitch-checkbox:checked + .onoffswitch-label:before {
    right: 0px; 
}

/***********range slidar************************/

.slidecontainer {
  width: 100%;
}

.rangeSlider {
  -webkit-appearance: none;
  width: 100%;
  height: 30px;
  border-radius: 5px;
  background: #cccccca3; 
  outline: none;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.rangeSlider:hover {
  opacity: 1;
}

.rangeSlider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 80px;
  height: 80px;
  border-radius: 50%;
  background: #FE9191;
  box-shadow : 0px 0px 0px 8px #FE9191;
  cursor: pointer;
}

.rangeSlider::-moz-range-thumb {
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #4CAF50;
  cursor: pointer;
}


</style>	

	
</head>

<body>
<div class="optionDiv">
  <div class="title" style="height: 100px;">환경설정</div>
  <hr>
	<table class="alarmTable">
		<thead>
			<tr>
				<td>알람설정</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="1050">반짝 풀방시 알람</td>
				<td width="200">
					<div class="onoffswitch">
					    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch1" checked>
					    <label class="onoffswitch-label" for="myonoffswitch1"></label>
					</div>
				</td>
			</tr>
			<tr>
				<td>범위내 등록된 반짝 알람</td>
				<td>
					<div class="onoffswitch">
					    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch2" checked>
					    <label class="onoffswitch-label" for="myonoffswitch2"></label>
					</div>
				</td>
			</tr>
			<tr>
				<td>범위내 등록된 용병 알람</td>
				<td>
					<div class="onoffswitch">
					    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch3" checked>
					    <label class="onoffswitch-label" for="myonoffswitch3"></label>
					</div>
				</td>
			</tr>
			<tr>
				<td>범위내 등록된 동아리매치 알람</td>
				<td>
					<div class="onoffswitch">
					    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch4" checked>
					    <label class="onoffswitch-label" for="myonoffswitch4"></label>
					</div>
				</td>
			</tr>
			
			
		</tbody>
	</table>
	<br>
	<table class="rangeTable">
		<thead>
			<tr>
				<td>범위설정 </td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<div class="slidecontainer">
					  <input type="range" min="1" max="15" value="5" class="rangeSlider" id="myRange">
					</div>
				</td>
			</tr>
			<tr>
				<td width="800">　　　반경범위: <span id="checkRange"></span>km</td>
				<td width="400"><button>적용</button></td>
			</tr>
		</tbody>
	</table>
</div>


</body>
</html>