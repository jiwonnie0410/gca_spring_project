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
	    	    			 console.log(info);
	    	    		 }
	    			 })
	    		 },   
	    		 color: '#FE9191',
	    		 textColor: 'white',
	    	 }],
	    	  
	    
	    // 일정 시간 포멧
	    eventTimeFormat: {
	    	hour: '2-digit',
	    	minute: '2-digit'
	    },
	    
	    editable: true, //일정 드래그 등 하여 수정가능
	    selectable: true, // 날짜클릭하여 이벤트 추가 가능
	    
	    //이벤트 클릭시 모달열기
	    eventClick: function(info) {
	    	var eventDate = info.event.start;
	    	var arrDate = eventDate.toString().split(":00 GMT");
	    	
	    	$("#eventModal").modal();
	    	$("#modalDate").html(arrDate[0]);
	    	
	    	console.log(eventDate + "date");
	    	console.log(info)
	    	
	    }//
	  });
	  
	 // 캘린더 날짜부분의 높이 450px보다 작으면 스크롤생김
	  calendar.setOption('contentHeight', 450);
	  calendar.render();
	});

