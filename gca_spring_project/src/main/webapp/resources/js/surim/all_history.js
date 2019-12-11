// https://fullcalendar.io/docs#toc
     
document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
		//한국어 적용
		//locale: 'kr',   
		
		//interaction: 일정 추가등의 이벤트용;  dayGrid:달력 달별로 보기기능
	    plugins: [ 'interaction', 'dayGrid', 'moment'], 
	   
	    // 달력 최상단 버튼 옵션
 	    header: {
	        left: 'title',
	        right: 'today prev,next'
	      }, 
	      
	    //디비에서 가져오는 일정값  	      
  
	    	 eventSources: [{  
	    		 events: function(info, successCallback, failureCallback  ) {
	    			 $.ajax({
	    				 url: "../ajax/getActiveHistList.json",
	    				 type: "GET",
	    				 dataType: "json",
	    				 data: {  
	    					 start: moment(info.startStr).format('YYYY-MM-DD'),
	    					 end: moment(info.endStr).format('YYYY-MM-DD')
	    					 
	    				 },
	    				 error: function(data){
	    					 console.log("false");
	    				 },
	    	    		 success: function(info) {
	    	    			 successCallback(info); 
	    	    		 },  
	    			 })    
	    		 },   
	    		 textColor: 'black'
	    	 }],
	    	  
	    
	    // 일정 시간 포멧
	    eventTimeFormat: {
	    	hour: '2-digit',
	    	minute: '2-digit'
	    },
	    
	    editable: true, //일정 드래그 등 하여 수정가능
	    selectable: true, // 날짜클릭하여 이벤트 추가 가능(모달)
	    
	    //이벤트 클릭시 모달열기
	    eventClick: function(info) {
	    	var dbArr = info.event._def.extendedProps; //디비에서 가져온 배열선언	    	
	    	var infoArr = info.event // fullcalendar에서 예약어로 적용된건 이쪽 배열에 저장됨 (ex: title, start, end등...)
	    	var eventDate = infoArr.start.toString().split(":00 GMT"); //시간을 배열로 자름
	    	console.log(infoArr);
	    	
	    	$("#eventModal").modal();   
	    	
	    	$("#title").html(infoArr.title)
	    	$("#date").html("마감일자: "+eventDate[0]); //시간을 모달 input에 주입, 분단위까지 출력됨
	    	$("#location").html("주소:" +dbArr.location);
	    	$("#end_cnt").html("필요인원: "+dbArr.end_cnt+"명");
	    	$("#sports_cd").html("종목: "+dbArr.sports_cd);
	    	$("#skill_cd").html("숙련도: "+dbArr.skill_cd);
	    	$("#age_range").html("나이: "+dbArr.age_range);
	    	$("#gender_cd").html("성별: "+dbArr.gender_cd);
	    	$("#status_cd").html(dbArr.status_cd);
	    	$("#sg_option").html("옵션: "+dbArr.sg_option);
	    	
	    	
	    	console.log(info.event._def.extendedProps);
	    	
	    }//
	  });
	  
	 // 캘린더 날짜부분의 높이 450px보다 작으면 스크롤생김
	  calendar.setOption('contentHeight', 450);
	  calendar.render();
	});

