$(function() {
	//기본 챌린지 버튼 클릭시 모달창 팝업
	    $("#basic-join").click(function(){
	    	if ( $(this).attr('class')!='join-btn start-challenge' ) {
	    		$("#basicModal").modal();
	    	}
	    });
		
        $("#basic-join-add").click(function(){
        	$("#basic-join").toggleClass('start-challenge');
			  var $page = $('.page');
			  $page.toggleClass('color-bg-start')
			    .toggleClass('bg-animate-color');
	
			  $("#basic-join").hasClass('start-challenge') ?
				  $("#basic-join").text('참가중') :
				  $("#basic-join").text('참가');
        });
	
	//스페셜 챌린지 버튼 클릭시 모달창 팝업
	    $("#special-join").click(function(){
	    	if ( $(this).attr('class')!='join-btn start-challenge' ) {
	       		 $("#specialModal").modal();
	       }
	    });
	
        $("#special-join-add").click(function(){
			$("#payModal").modal();
        });
	
	
         $("#paynow").click(function(){
        	$("#special-join").toggleClass('start-challenge');
			  var $page = $('.page');
			  $page.toggleClass('color-bg-start')
			    .toggleClass('bg-animate-color');
	
			  $("#special-join").hasClass('start-challenge') ?
				  $("#special-join").text('참가중') :
				  $("#special-join").text('참가');
        }); 

})//