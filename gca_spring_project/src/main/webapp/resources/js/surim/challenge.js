$(function() {
	//기본 챌린지 버튼 클릭시 모달창 팝업
	    $("#basic-btn").click(function(){
	    	if ( $(this).attr('class')!='join-btn start-challenge' ) {
	    		$("#basicModal").modal();
	    	}
	    });
		
        $("#basic-join-add").click(function(){
        	$("#basic-btn").toggleClass('start-challenge');
	
			  $("#basic-btn").hasClass('start-challenge') ?
				  $("#basic-btn").text('참가중') :
				  $("#basic-btn").text('참가');
        });
	
	//스페셜 챌린지 버튼 클릭시 모달창 팝업
	    $("#special-btn").click(function(){
	    	if ( $(this).attr('class')!='join-btn start-challenge' ) {
	       		 $("#specialModal").modal();
	       		 console.log("모달출력");
	       }
	    });
	
        $("#special-join-add").click(function(){
        	$("#special-btn").toggleClass('start-challenge');
	
			$("#special-btn").hasClass('start-challenge') ?
				$("#special-btn").text('참가중') :
				$("#special-btn").text('참가');
			location.href="payment"	
        });
})//