//페이지맵 이벤트

//ready이벤트 작성
$(function() {
	getBoardList(); // 목록조회
	insertBoard(); // 등록 이벤트 클릭 이벤트 지정
	deleteBoard();// 삭제

//	
//	$("#btnUpdete").click(function() {
//		$('#Modalread').modal('hide')
//		$('#ad_boardWriteForm [name="qb_id"]').val($('#frm #qb_id').html());
//		$('#ad_boardWriteForm [name="qb_content"]').val($('#frm #qb_content').html());
//		$('#myModal').modal('show')
//	});
	
	
//	$(document).on('click', '#userlisttb #asktb tr', function() {
//        var qb_id = getBoardList.row( this ).data().qb_id;
//    });
	
	

});

//상세보기
function getQb_id(qb_id) {
	//$("#Modalread").on('show.bs.modal', function() {
		console.log(qb_id);
		$("#Modalread .modal-body").load("qnView?qb_id="+qb_id)
	//});
	
	
	
}





/*//삭제 요청 결과처리
function deleteBoardHandler(qb_id) {
 alert("삭제되었습니다.");
}*/



//목록 조회요청
function getBoardList() {
	$.ajax({
		url:"ajax/getBoardList.json",
		data:$("#boardForm").serialize(),
		dataType:"json",
		success: getBoardListHandler
	});
}


//목록 조회 결과처리
function getBoardListHandler(datas) {
	$("#asktb").empty();
	for (var i = 0; i < datas.length; i++) {
		var tr = "<tr data-toggle='modal' data-target='#Modalread' id='newTr' onclick='getQb_id("+ datas[i].qb_id + ")'>";
		if(m_id != datas[i].m_id) {
			tr = '<tr>';
		}
		$(tr).append(
				$('<td>').html(datas[i].qb_an)).append(
				$('<td>').html(datas[i].m_id)).append(
				/*$('<td>').html(datas[i].qb_an)).append(*/
				$('<td>').html(datas[i].qb_title)).appendTo('#asktb').attr(
						"data", datas[i].bno);
	}// for
	$("#userlisttb").dataTable({"scrollY": "300px",   
        "paging": false})
}// getBoardListHandler
                    
  
  
  
//등록 요청
	//폼의 파라미터를 넘기기 위해 serialize() 함수를 사용한다.필요한 로직 처리를 하고 마찬가지로 @ResponseBody Annotation을 사용하여  Object형태로 넘김
function insertBoard() {
	$("#btnIns").click(function() {
			/*$("select option[value*='질문 유형 선택']").prop('disabled',true);*/
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
	/*$('<tr>').append($("<td id='newTr'>").html(data.qb_id))
			 .append($('<td>').html(data.m_id))
			 .append($('<td>').html(data.qb_title))
			 .prependTo('#asktb');*/
	getBoardList();
	$('#myModal').modal("hide"); //닫기 
}





//삭제 요청(rest방식)
function deleteBoard() {
	$("#btnDel").click(function(){ 
		var qb_id =$('#frm [name="qb_id"]').val()
		console.log(qb_id);
		$.ajax({
			url:"./ajax/board/"+qb_id,
			method:"delete",	
			success: deleteBoardHandler
		});
	});
}


//삭제 요청 결과처리
function deleteBoardHandler(qb_id) {
	 alert("삭제되었습니다.");
	 $('#Modalread').modal('hide');
	 getBoardList();
}


  
