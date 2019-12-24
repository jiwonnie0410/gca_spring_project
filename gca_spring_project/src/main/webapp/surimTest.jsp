<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>

</head>
<body>

<div id="map-div" style="width: 600px; height: 350px;">      		
</div>

fdgfdgfdgfd11


<script>
var staticMapContainer  = document.getElementById('map-div'), // 이미지 지도를 표시할 div  
staticMapOption = { 
    center: new kakao.maps.LatLng( 35.85114890212509, 128.55619766644355 ), // 이미지 지도의 중심좌표
    level: 3 // 이미지 지도의 확대 레벨
};
//이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
</body>

</html>