function view_map(){
	var xy = $('#map_xy').val().split(',');
	var x = xy[0];
	var y = xy[1].substr(1);
	
	var geo = new kakao.maps.services.Geocoder();
	
	$('#map').empty();
	
	var mapContainer = document.getElementById('map');
	mapContainer.style.width = '650px';
	mapContainer.style.height = '650px'; 
	var mapOption = {
		center : new kakao.maps.LatLng(x, y),
		level : 4
	};

	var map = new kakao.maps.Map(mapContainer, mapOption);
	map.relayout();

	var marker = new kakao.maps.Marker({ 
		position : new kakao.maps.LatLng(x, y), // 마커의 좌표
	    map: map // 마커를 표시할 지도 객체
	});
//	marker.setMap(map);	
	map.setDraggable(false);
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

