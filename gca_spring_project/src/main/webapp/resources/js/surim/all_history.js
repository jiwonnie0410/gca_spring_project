 //달력 JS 옵션 제이쿼리 사용X 자바스크립트로만!
// https://fullcalendar.io/docs#toc

document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
		
		  //interaction: 일정 추가등의 이벤트용;  dayGrid:달력 달별로 보기기능
	    plugins: [ 'interaction', 'dayGrid'], 
	   
	    // 달력 최상단 버튼 옵션
 	    header: {
	        left: 'title',
	        center: '',
	        right: 'today prev,next'
	      }, 
	     
	    //디비에서 가져오는 일정값  
	    events: [
	    	{
	    		title: 'event1',
 	    		start: '2019-11-07T15:15',
 	    		color: '#FE9191',
	    	},
	    	{
	    		title: 'event2',
 	    		start: '2019-11-10T05:15',
 	    		color: '#3bc9e0',
	    	},
	    	{
	    		title: 'event3',
 	    		start: '2019-11-15T10:15',
 	    		color: 'yellow',
	    	},
	    ],
	    
	    editable: true, //일정 드래그 등 하여 수정가능
	    selectable: true, // 날짜클릭하여 이벤트 추가 가능
	    
	    //이벤트 클릭시 모달열기
	    eventClick: function(info) {
	    	var eventDate = info.event.start;
	    	
	    	var arrDate = eventDate.toString().split(":00 GMT");
	    	
	    	$("#eventModal").modal();
	    	$("#modalDate").html(arrDate[0]);
	    	
	    	console.log(eventDate + "date");
	    	
	    }//
	  });
	  
	 // 캘린더 날짜부분의 높이 450px보다 작으면 스크롤생김
	  calendar.setOption('contentHeight', 450);
	  calendar.render();
	});

