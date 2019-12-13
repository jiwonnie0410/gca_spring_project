function sgAddr() {

	//카카오맵 API로 변수 만들기
	var geo = new kakao.maps.services.Geocoder();
	var mapContainer = document.getElementById('map');
	var mapOption = {
		center : new daum.maps.LatLng(37.537187, 127.005476),
		level : 5
	};
	var map = new daum.maps.Map(mapContainer, mapOption);
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.537187, 127.005476),
		map : map
	});
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		var latlng = mouseEvent.latLng;
		marker.setPosition(latlng);
		$('#sg_xy').val(latlng.getLat() + ", " + latlng.getLng());
		geo.coord2Address(latlng.getLng(), latlng.getLat(), callAddr);
	});
	var callAddr = function(result, status) {
		if (status === kakao.maps.services.Status.OK)
			$('#sg_location').val(result[0].address.address_name);
	}
	
	//다음 주소 API로 주소 받아 주소 입력
	new daum.Postcode({
		oncomplete : function(data) {
			var addr = data.address;
			document.getElementById("sg_location").value = addr;
			geo.addressSearch(data.address, function(results, status) {
				if (status === daum.maps.services.Status.OK) {
					var result = results[0];
					var coords = new daum.maps.LatLng(result.y, result.x); //좌표값 받음
					$('#sg_xy').val(coords.Ha + ", " + coords.Ga);
					console.log($('#sg_xy').val());
					mapContainer.style.display = "block";
					map.relayout();
					map.setCenter(coords);
					marker.setPosition(coords);
				}
			});
		}
	}).open();
}