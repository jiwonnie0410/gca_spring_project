//페이지맵 이벤트

//ready이벤트 작성
$(function() {
	getBoardList(); // 목록조회
	insertBoard(); // 등록 이벤트 클릭 이벤트 지정
	deleteBoard();// 삭제

//	 $("body").on("click", "[id^=write]", function() { var qb_id =
//	  $(this).closest("tr").find("td").eq(0).html();// closest ==조상검색
//	  console.log(qb_id); });
//	 
//
	$("#Modalread").on('show.bs.modal', function() {
		var qb_id =  $(this).closest("tr").find("td").eq(0).html();// closest
		$(".modal-body").load("adminQnView?qb_id="+qb_id)
		console.log(qb_id);
	});
	
	
		
});



//목록 조회요청
function getBoardList() {
	$.ajax({
		url:"ajax/getBoardList.json",
		dataType:"json",
		success: getBoardListHandler
	});
}

//목록 조회 결과처리
  function getBoardListHandler(datas) {
		$("#asktb").empty();
	for (var i = 0; i < datas.length; i++) {
			$("<tr id='"+datas[i].qb_id+"' onclick='location.href='${pageContext.request.contextPath}/board/view?ad_num=${row.ad_num}'>").append($('<td>').html(datas[i].qb_id))
					 .append($('<td>').html(datas[i].m_id)) 
					 .append($('<td>').html(datas[i].qb_title))
					 .append($('<td>').html(datas[i].qb_content))
					 .appendTo('#asktb')
					 .attr("data",datas[i].bno);
			}//for
		}//  getBoardListHandler
  
  
  
  
//등록 요청
	//폼의 파라미터를 넘기기 위해 serialize() 함수를 사용한다.필요한 로직 처리를 하고 마찬가지로 @ResponseBody Annotation을 사용하여  Object형태로 넘김
function insertBoard() {
$("#btnIns").click(function() {
	var param = JSON.stringify($("#ad_boardWriteForm").serializeObject());// form의 입력데이터를 쿼리스트링으로 만들어준다. 
	$.ajax({
		url:"./ajax/insertBoard",
		method:'post',
		dataType: "json",
		data: param,
		contentType:"application/json",
		success:	insertBoardtHandler,
		error: function() {
			alert("오류");
		}
	});	//ajax	
});//function
}//insertBoard
	
//등록 요청 결과처리
function insertBoardtHandler(data) {
	$('<tr>').append($('<td>').html(data.qb_id))
			 .append($('<td>').html(data.m_id))
			 .append($('<td>').html(data.qb_title))
			 .append($('<td>').html(data.qb_content))
			 .appendTo('#asktb');
	$('#myModal').modal("hide"); //닫기 
}



//삭제 요청(rest방식)
function deleteBoard() {
	$("#asktb").on("click","#btnDel", function() {
		var bno = $(this).parent().find("span").eq(0).html();
		console.log(bno);
		$.ajax({
			url:"board/"+qb_id,
			method:"delete",	
			success: deleteBoardHandler
		});
	});
}

	//삭제 요청 결과처리
	function deleteBoardHandler(bno) {
		console.log( qb_id);
		$("[data = '" + qb_id+ "' ]" ).remove();
	}
  
	
	function go_page(paging){
		document.boardForm.page.value = paging;
		document.boardForm.submit();
	}
  
  
