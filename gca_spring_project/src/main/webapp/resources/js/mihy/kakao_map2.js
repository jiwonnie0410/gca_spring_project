
function view_map(){
	
	var xy = $('#map_xy').val().split(',');
	var x = xy[0];
	var y = xy[1].substr(1);
//	console.log($('#map_xy').val());
//	console.log(x)
//	console.log(y)
	
	var geo = new kakao.maps.services.Geocoder();
	var mapContainer = document.getElementById('map');
	var mapOption = {
		center : new kakao.maps.LatLng(x, y),
		level : 4
	};
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var marker = new kakao.maps.Marker({ 
		position : map.getCenter()
	});
	marker.setMap(map);
//	
//	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
//	    var latlng = mouseEvent.latLng; 
//	    marker.setPosition(latlng);
//	    var xy = document.getElementById('storeXy');
//	    xy.value = latlng.getLat()+", "+latlng.getLng();
//	    geo.coord2Address(latlng.getLng(), latlng.getLat(), callAddr);
//	});
//
//	var callAddr = function(result, status) {
//		if (status === kakao.maps.services.Status.OK) {
//			var addr = document.getElementById('storeAddr');
//			addr.value = result[0].address.address_name;
//		}
//	};
//	
}