function view_map(){
	var xy = $('#map_xy').val().split(',');
	var x = xy[0];
	var y = xy[1].substr(1);
	$('#map').empty();
	
	var mapContainer = document.getElementById('map');
	var mapOption = {
			center : new kakao.maps.LatLng(x, y),
			level : 4
		};
	
	var map = new kakao.maps.Map(mapContainer, mapOption);

	var marker = new daum.maps.Marker({
		position: new daum.maps.LatLng(x, y),
		map: map
	});
	
	map.relayout();
////////////////////////	
//	var map, mapOption;
//	kakao.maps.load(function() {
//	    // v3가 모두 로드된 후, 이 콜백 함수가 실행됩니다.
//		mapOption = {
//				center : new kakao.maps.LatLng(x, y),
//				level : 4
//			};
//		map = new kakao.maps.Map(mapContainer, mapOption);
//		
//		mapContainer.style.width = '400px';
//		mapContainer.style.height = '200px';
//		map = new kakao.maps.Map(mapContainer, mapOption);
//
//		var marker = new daum.maps.Marker({
//			position: new daum.maps.LatLng(x, y),
//			map: map
//		});
//	});
//	map.relayout();
//	$(window).on('orientationchange', function(event) {
//		  map.relayout();
//		  map.setCenter(center);
//		});
/////////////////////////	
//	var staticMapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div  
//    staticMapOption = { 
//        center: new kakao.maps.LatLng(x, y), // 이미지 지도의 중심좌표
//        level: 4 // 이미지 지도의 확대 레벨
//    };
//	staticMap.setCenter(new kakao.maps.LatLng(x, y));
//	staticMapContainer.style.width = '400px';
//	staticMapContainer.style.height = '200px'; 
//
//	// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
//	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
/////////////////////////////
//    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 입니다 
//    mapCenter = new kakao.maps.LatLng(33.45042 , 126.57091), // 지도의 중심좌표
//    mapOption = {
//        center: mapCenter, // 지도의 중심좌표
//        level: 4 // 지도의 확대 레벨
//    };
//
//    // 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
//    var map = new kakao.maps.Map(mapContainer, mapOption);
//
//    var marker = new daum.maps.Marker({
//		position: new daum.maps.LatLng(x, y),
//		map: map
//	});
//
//	// 마커에 dragend 이벤트를 등록합니다
//	kakao.maps.event.addListener(marker, 'dragend', function(mouseEvent) {
//	    // 현재 마커가 놓인 자리의 좌표입니다 
//	    var position = marker.getPosition();
//	    // 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
//	    toggleMapWrapper(true, position);
//	});
//
//	//지도에 클릭 이벤트를 등록합니다
//	kakao.maps.event.addListener(map, 'click', function(mouseEvent){
//	    if(!overlayOn) {
//	        return;
//	    }
//	    // 클릭한 위치의 좌표입니다 
//	    var position = mouseEvent.latLng;
//	    // 마커를 클릭한 위치로 옮깁니다
//	    marker.setPosition(position);
//	    // 클락한 위치를 기준으로 로드뷰를 설정합니다
//	    toggleMapWrapper(true, position);
//	});
//	// 지도를 감싸고 있는 div의 크기를 조정하는 함수입니다
//	function toggleMapWrapper(active, position) {
//	    if (active) {
//	        // 지도를 감싸고 있는 div의 너비가 100%가 되도록 class를 변경합니다 
//	        container.className = '';
//	        // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
//	        map.relayout();
//	        // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
//	        map.setCenter(position);
//	    }
//	}
}

var map;

function view_map2(){
	    // v3가 모두 로드된 후, 이 콜백 함수가 실행됩니다.
	$('.sg_map').each(function(i, e){
//		kakao.maps.load(function() {
			var x = $('.sg_xy').eq(i).val().split(',')[0];
			var y = $('.sg_xy').eq(i).val().split(',')[1].substr(1);
			$(this).empty();
			var geo = new kakao.maps.services.Geocoder();
			var mapContainer = this;
			var mapOption = {
				center : new kakao.maps.LatLng(x, y),
				level : 4
			};
			map = new kakao.maps.Map(mapContainer, mapOption);
//			map.relayout();
			
			map.setDraggable(false);
			mapContainer.style.width = '100%';
			mapContainer.style.height = '300px';
			map.relayout();
			
//			var marker = new kakao.maps.Marker({ 
//				position : new kakao.maps.LatLng(x, y), // 마커의 좌표
//				map: map // 마커를 표시할 지도 객체
//			});
			var marker = new kakao.maps.Marker({ 
				position : map.getCenter()
			});
			marker.setMap(map);	
//		});
	});
		
		$('.bg_map').each(function(i, e){
			var x = $('.bg_xy').eq(i).val().split(',')[0];
			var y = $('.bg_xy').eq(i).val().split(',')[1].substr(1);
			
			$(this).empty();
			
			var mapContainer = this;
			mapContainer.style.width = '100%';
			mapContainer.style.height = '200px';
			var mapOption = {
					center : new kakao.maps.LatLng(x, y),
					level : 4
			};
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var marker = new kakao.maps.Marker({ 
				position : map.getCenter()
			});
			marker.setMap(map);	
			map.relayout();
			
	
			map.setDraggable(false);
		});
		
		$('.six_map').each(function(i, e){
			var x = $('.six_xy').eq(i).val().split(',')[0];
			var y = $('.six_xy').eq(i).val().split(',')[1].substr(1);
			
			$(this).empty();
			
			var mapContainer = this;
			mapContainer.style.width = '100%';
			mapContainer.style.height = '200px';
			var mapOption = {
					center : new kakao.maps.LatLng(x, y),
					level : 4
			};
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var marker = new kakao.maps.Marker({ 
				position : map.getCenter()
			});
			marker.setMap(map);	
			map.relayout();
			
			
			map.setDraggable(false);
		});
}

