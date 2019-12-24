function getLocation(){ //참가 인증 스크립트 
	//chorm 50부터 https와 같은 보안 컨텍스트에서만 작동
    //exlorer9.0, firefox3.5, safiri5.0, opera16.0 이상 작동

	toastr.options = {
			"closeButton": true,
			"debug": false,
			"newestOnTop": false,
			"progressBar": true,
			"positionClass": "toast-bottom-center",
			"preventDuplicates": true,
			"onclick": null,
			"showDuration": "300",
			"hideDuration": "1000",
			"timeOut": "2000",
			"extendedTimeOut": "1000",
			"showEasing": "swing",
			"hideEasing": "linear",
			"showMethod": "fadeIn",
			"hideMethod": "fadeOut"
	}
	
	bootbox.confirm({
	    message: "참가 인증을 하시겠습니까?",
	    buttons: {
	        confirm: {
	            label: '예',
	            className: 'btn-success'
	        },
	        cancel: {
	            label: '아니오',
	            className: 'btn-danger'
	        }
	    },
	    callback: function(con) {
	    	
	    	if(con){
	    		if (navigator.geolocation) {
	    			//getCurrentPosition(): 사용자의 위치를 반환
	    			navigator.geolocation.getCurrentPosition(showPosition, showError);
	    			//성공하면 매개 변수(showPosition)에 지정된 함수에 좌표 오브젝트를 리턴
	    			//실패하면 두 번째 매개 변수(showError)로 오류 처리
	    			//			console.log('geo 메소드: '+ showPosition +", " + showError);
	    			
	    		} else {
	    			toastr.warning("이 브라우저에서는 GPS를 사용하실 수 없습니다.");
	    			return false;
	    		}
	    	}
	    }
	});
}

	

//showPosition() : 위도와 경도를 출력
function showPosition(position) {
	
//	console.log('geo 메소드 > showPosition: '+position.coords.latitude+", "+position.coords.longitude);
	var sg_num_search = $('#sg_num_search').val();
	
	var form = { 
		cert_x: position.coords.latitude,
		cert_y: position.coords.longitude,
		sg_num: sg_num_search
	}
	$.ajax({
		url: "sgCert",
		method: "POST",
		dataType: "json",
		data: form,
		success: function(result){
			console.log(result);
			if(result.msg == "success"){
				toastr.success("참가 인증이 완료되었습니다. 즐겁게 운동하시고 건강한 하루 보내세요!");
				$('#btn_cert').text("참가 인증 완료");
			} else if(result.msg == "nobody in this room"){
				toastr.warning("해당 방에 참여한 사람이 없습니다. 다시 확인해 주세요.");
			} else if(result.msg == "already"){
				toastr.warning("이미 인증되어 있습니다.");
			} else if(result.msg == "badtime"){
				toastr.warning("마감 시간 전후 30분 이내에 참여 인증을 해주세요.");
			} else {
				toastr.warning("모임 지점에서 거리가 멀어(" + result.msg + "km) 참여 인증을 할 수 없습니다. 더 가까운 위치에서 인증해 주세요.");
			}
		}
	});
}

//showError() : 사용자의 위치를 얻지 못하면 실행
function showError(error) {
	switch(error.code) {
		case error.PERMISSION_DENIED:
			toastr.warning("사용자가 위치 정보에 대한 요청을 거절하여 확인할 수 없습니다.")
				break;
		case error.POSITION_UNAVAILABLE:
			toastr.warning("위치 정보를 사용할 수 없습니다. GPS를 연결해 주세요.")
				break;
		case error.TIMEOUT:
			toastr.warning("사용자 위치를 가져오기 위한 요청이 시간 초과되었습니다. 다시 시도해 주세요.")
				break;
		case error.UNKNOWN_ERROR:
			toastr.warning("알 수 없는 오류가 발생했습니다. 계속 오류가 발생하면 관리자에게 문의해 주세요.")
				break;
	}
}