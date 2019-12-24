// https://fullcalendar.io/docs#toc
	
// 1. 캘린더 그리는 펑션
document.addEventListener('DOMContentLoaded', function() {

	  var calendarEl = document.getElementById('calendar');		//캘린더 틀
	  var calendar = new FullCalendar.Calendar(calendarEl, {
		//한국어 적용
		//locale: 'kr',   
		
		//interaction: 일정 추가등의 이벤트용;  dayGrid:달력 달별로 보기기능; moment: 일정 Dateformat용
	    plugins: [ 'interaction', 'dayGrid', 'moment'], 
	   
	    // 달력 최상단 버튼 옵션
 	    header: {
	        left: 'title', 
	        right: 'today prev,next'
	      }, 
	      
	    //디비에서 가져오는 활동 정보 값  	      
	    	 eventSources: [{  
	    		 events: function(info, successCallback, failureCallback  ) {
	    			 $.ajax({
	    				 url: "../ajax/getActiveHistList.json", //디비에서 활동 정보를 제이슨으로 받음
	    				 type: "GET",
	    				 dataType: "json",
	    				 data: {  
	    					 start: moment(info.startStr).format('YYYY-MM-DD'), //일정 시작날
	    					 end: moment(info.endStr).format('YYYY-MM-DD')		//일정 마지막날 
	    					 
	    					 /* 만약 end값이 있으면 start-end까지 일정을 그려준다, 
	    					  * 현재 활동이력은 이벤트 마감날을 기준으로 !하루!만 그려줄 예정으로
	    					  * 일정 마감일을 start에 매핑하였다
	    					  * 
	    					  * 일정 생성일(sg_start_dttn) = real_start
	    					  * 일정 마감일(sg_end_dttn) = start
	    					  */
	    				 },
	    				 error: function(data){
	    					 console.log("false");
	    				 },
	    	    		 success: function(info) {
	    	    			 successCallback(info); 
	    	    		 },  
	    			 })    
	    		 },   
	    		 textColor: 'black' // 일정 글자색; 일정 background-color은 카테고리별로 DB에서 불러옴
	    	 }],
	    
	    // 일정 시간 포멧
	    eventTimeFormat: {
	    	hour: '2-digit',
	    	minute: '2-digit'
	    },
	    
	    editable: true, //일정 드래그 등 하여 수정가능
	    selectable: true, // 날짜클릭하여 이벤트 추가 가능(모달창에 사용)
	     
	    
	    //이벤트 클릭시 모달열기
	    
	    /**
	     * 매퍼에서 셀렉트 하여 같은 view에서 가져오지만 fullcalendar 기본파라미터와 엑스트라 파라미터는 각각 다른 배열에 담김
	     * title, start, end, color 등 기본 파라미터는 <info.event>
	     * 엑스트라 파라미터는 <info.event._def.extendedProps> 담김; console에서 확인바람
	     */
	    eventClick: function(info) {
	    	var dbArr = info.event._def.extendedProps; // 디비에서 가져온 활동정보 배열선언	    	
	    	var infoArr = info.event // fullcalendar 기본 파라미터는 이쪽 배열에 저장됨 (ex: title, start, end등...)
	    	
	    	var format = calendar.formatDate(infoArr.start , {
	    		year: 'numeric',
	    		 month: 'numeric',
	    		 day: 'numeric',
	    		 timeZoneName: 'short',
	    		 timeZone: 'UTC',
	    		 locale: 'kr'
	    	});  
	    	
	    	var eventDate = format.toString().split("GMT")
	    
	    	$("#eventModal").modal();
	    	
	    	$("#title").html(infoArr.title)
	    	$("#date").html("마감일자: "+ eventDate[0]); //시간을 모달 input에 주입, 분단위까지 출력
	    	$("#location").html("주소:" + dbArr.location);
	    	$("#end_cnt").html("필요인원: "+ dbArr.end_cnt+"명");
	    	$("#sports_cd").html("종목: "+ dbArr.sports_cd);
	    	$("#skill_cd").html("숙련도: "+ dbArr.skill_cd);
	    	$("#age_range").html("나이: "+ dbArr.age_range);
	    	$("#gender_cd").html("성별: "+ dbArr.gender_cd);
	    	$("#status").html(dbArr.status);
	    	$("#sg_option").html("옵션: "+ dbArr.sg_option);
	    	
	    	console.log(dbArr.xy + " yx!!");
	    	
	    	// 수림 정적지도
//	    	var staticMapContainer  = document.getElementById('map-div'), // 이미지 지도를 표시할 div  
//	    	staticMapOption = { 
//	    	    center: new kakao.maps.LatLng( 35.85114890212509, 128.55619766644355 ), // 이미지 지도의 중심좌표
//	    	    level: 3 // 이미지 지도의 확대 레벨
//	    	};
//	    	//이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
//	    	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	    	
	    	
	    	/* 미현 : 지도  */
//	    	$("#map_xy").val(dbArr.xy);
//	    	view_map();
	    }//
	  });
	  
	 // 캘린더 가로세로 비율, 세로: 1 가로의 비율 조정가능, 세로:가로=1:0.8 
	  //calendar.setOption('contentHeight', 450);
	  calendar.setOption('aspectRatio', 0.8);
	  calendar.render();
	  
//	  view_map2(); 
	  //미현 : 지도 스크립트
//	  $('#aaa a').on('click', function (e) {
//		  e.preventDefault()
//		})
//	  
//	  $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
//		  map.relayout();
//		})
//		map.relayout();
	  
	});

