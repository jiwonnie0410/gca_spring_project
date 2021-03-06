$(document).ready(function(){
	
	$(window).scroll(scroll);
	
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: 'auto',
		centeredSlides: false,
		spaceBetween: 30,
		grabCursor: true
	});
	$('.swiper-wrapper').on('click','.swiper-slide', condition);
	badminton();
	
	//이 조건을 제외하면 s_end_room.js와 똑같음.
	$('.create_room').on('click', function(){
		location.href='createRoomForm';
	});
	
	p9();
	setInterval(p8,1000);
	
	//방 참여
	$('.table').on('click', '.tr', function(){
		var sg_num = $(this).attr("class").substring(3);
		var sg_dttm = $(this).find('p.p8').text();
		
		//선택한 방에 참여하기 전 참여 인원 파악하고 참여 여부 묻기
		$.ajax({
			url: "sgValidIn/" + sg_num,
			dataType: "json",
			contentType : "application/json",
			success: function(result){
				move_room(result, sg_dttm);
			} 
		});
	});

	
});

//배드민턴 이미지 삽입
function badminton(){
	$('#S04').prepend( $('<img>').attr({ class:'pr-3', src:'../resources/images/mihy/badminton-pink.png', style:'width:33px'}) );
	$('#S04').hover(function(){
		$(this).children().eq(0).attr({src:'../resources/images/mihy/badminton-white.png'}); 
	}, function(){
		$(this).children().eq(0).attr({src:'../resources/images/mihy/badminton-pink.png'}); 
	});
}

//검색 조건(운동 종목별)
function condition(){
	$('#key').val("sports");
	$('#keyval').val($(this).data("sports"));
//	console.log($('#keyval').val())
	searchSport.submit();
}

//마지막 페이지에서 다음 정보 로딩
function scroll(){
	if(Math.floor($(window).scrollTop()) == $(document).height() - $(window).height()){

		var end_dis = $('.tr').last().find('.dis').val();
		var end_dttm = $('.tr').last().find('.dttm').val();
		var end_num = $('.tr').last().attr('class').substring(3);
		var key = $('#key').val();
		var keyval = $('#keyval').val();
		
		var form = {
				end_dis: end_dis,
				end_dttm: end_dttm,
				end_num: end_num,
				key: key,
				keyval: keyval
				
		}
		
		var url;
		if( $('.table').attr('class').substr(-7) != 'endroom'){
			url = "getSgList/";
		} else if( $('.table').attr('class').substr(-7) != 'endroom' ){
			url = "getSgListEnd/";
		}
		
		$.ajax({
			url: url,
			type: "POST",
			dataType:"html",
			data : form,
			success: function(result){
				var tr_last = $('#tb1 tbody tr').length-1;
				$('#tb1 tbody').append(result);
				var tr_gt = $('#tb1 tbody tr:gt(' + tr_last + ')');
				for(var i=0; i<tr_gt.length; i++){
					var p9_dis = tr_gt.eq(i).find('.p9 span');
					var mathround_dis = Math.round(p9_dis.text() *10) / 10;
					p9_dis.text(mathround_dis + "km");
				}
			}
		});
	}
}

//조회거리 반올림
function p9(){
	for(var i=0; i<$('.p9').length; i++){
		var p9_dis = $('.p9').eq(i).children();
		var mathround_dis = Math.round(p9_dis.text() *10) / 10;
		p9_dis.text(mathround_dis + "km");
	}
}


//남은 시간 계산
function p8(){
	var now = new Date().getTime();
	for(var i=0; i< $('.dttm').length; i++){
		var dttm = $('.dttm').eq(i).val();
		
		var year = dttm.substring(0,4);
		var month = dttm.substring(5,7)-1;
		var day = dttm.substring(8,10);
		var hour = dttm.substring(11,13);
		var min = dttm.substring(14,16);
	
		var countDownDate = new Date(year, month, day, hour, min, 0, 0).getTime();
		var distance = countDownDate - now;
		var d = Math.floor(distance / (1000 * 60 * 60 * 24));
		var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)); 
		var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)); 
		var s = Math.floor((distance % (1000 * 60)) / 1000);
		
		if(d<0){
			$('.p8').eq(i).html("<span class='badge badge-pill badge-secondary'><font color='white'><b>마감</b></font></span>");
		} else if(d<1 && h<1 && m<1){
			$('.p8').eq(i).html("<span class='badge badge-pill badge-danger'><font color='white'><b>"+s+"초 남음</b></font></span>");
		} else if(d<1 && h<1){
			$('.p8').eq(i).html("<span class='badge badge-pill badge-danger'><font color='white'><b>"+m+"분"+s+"초</b></font></span>");
		} else if(d<1){
			$('.p8').eq(i).html("<span class='badge badge-pill badge-danger'><font color='white'><b>"+h+"시간 남음</b></font></span>");
		} else {
			$('.p8').eq(i).html("<span class='badge badge-pill badge-success'><font color='white'><b>"+d+"일 남음</b></font></span>");
		}
	}
}

//방 참여
function move_room(result, sg_dttm){

	Notiflix.Report.Init({
		svgSize:'80px',
		plainText:'false'		
	});
	
	if(result.result_msg == 'already'){ //마감이든 아니든 already면 참여
		location.href='alreadyIn?sg_num='+result.pk_num+'&endroom='+sg_dttm;
	} else if(mgrant == 'M01'){
		if(sg_dttm == "마감"){ //마감이면 무조건(full이나 yes나 모두)
			Notiflix.Report.Info('모집 마감', '마감 시간이 초과되어 참여하실 수 없습니다.', '확인');
			return false;
		} else if(sg_dttm != "마감" && result.result_msg == 'full'){
			Notiflix.Report.Info('모집 인원 초과', '모집 인원이 초과되어 참여하실 수 없습니다. 인원 변동이 발생하면 참여해 주세요.', '확인');
			return false;
		} else if(sg_dttm != "마감" && result.result_msg == 'yes'){
			Notiflix.Confirm.Show( 
				'선택한 반짝에 참여하시겠습니까?'
				, '참여 시 바로 그룹 채팅에 참여하시게 됩니다. 모임 참여로 건강한 라이프를 즐겨 보세요!'
				, '확인'
				, '취소'
				, function() {
				    $.ajax({
						url:'roomIn?sg_num='+result.pk_num,
						dataType: "json",
						success: function(){
							msg = {
									cmd : "join",
									id : result.m_id,
									msg : "<"+result.m_id+"님이 참가하셨습니다.>",
									sg_num : result.pk_num
							}
							webSocket.send(  JSON.stringify( msg )   );
							location.href='alreadyIn?sg_num='+result.pk_num;
						}
					});
				}
				, function(){ // No button callback
					return false;
				}
			)
		}
	} else {
		Notiflix.Report.Failure('참여할 수 없습니다.', '회원님의 계정이 정지되어 새로운 모임에 참여하실 수 없습니다.', '확인');
		return false;
	}
	
	
}