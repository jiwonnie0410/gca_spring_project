//페이지맵 이벤트

//ready이벤트 작성
$(function() {
	getBoardList2(); // 목록조회
	insertBoard(); // 등록 이벤트 클릭 이벤트 지정
	deleteBoard();// 삭제

//	 $("body").on("click", "[id^=write]", function() { var qb_id =
//	  $(this).closest("tr").find("td").eq(0).html();// closest ==조상검색
//	  console.log(qb_id); });
 

	
	$("#btnUpdete").click(function() {
		$('#Modalread').modal('hide')
		$('[name="qb_id"]').val($('#frm #qb_an_id').html());
		$('[name="qb_content"]').val($('#frm #qb_an').html());
		$('#myModal').modal('show')
	});
	
	
	$("#Modalread").on('show.bs.modal', function() {
		var qb_id = $(event.target).closest("tr").find("td").eq(0).html();// closest
		$("#Modalread .modal-body").load("adminQnView?qb_id="+qb_id)
		$('#qb_origin').val(qb_id)
		console.log(qb_id);
	});   
	
});

// 목록 조회요청
function getBoardList2() {
	$.ajax({
		url : "../ajax/getBoardList2",
		dataType : "json",
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : getBoardListHandler
	});
}
// 목록 조회 결과처리
function getBoardListHandler(datas) {
	$("#asktb").empty();
	for (var i = 0; i < datas.length; i++) {
		$('<tr>')
				.append($('<td>').html(datas[i].qb_id))
				.append($('<td>').html(datas[i].qb_an))
				.append($('<td>').html(datas[i].qb_title))
			/*	.append($('<td class="tdcontent">').html(datas[i].qb_content))*/
				.append($('<td>').html(
								"<button id='write' data-toggle='modal' data-target='#Modalread' >답글</button>"))
				.append($('<td>').html('<button id=\'btnDel\'>삭제</button>'))
				.appendTo('#asktb').attr("data", datas[i].qb_id);
	}
}//  
   


function insertBoard() {
	$("#btnIns").click(function() {
		var param = JSON.stringify($("#frm").serializeObject());// form의 입력데이터를
		// 쿼리스트링으로
		// 만들어준다.
		$.ajax({
			url : "../ajax/insertBoard.json",
			method : 'post',
			dataType : "json",
			data : param,
			contentType : "application/json",
			success : insertBoardtHandler,
			error : function() {
				alert("error");
			}
		}); // ajax
	});// function
}// insertBoard

// 등록 요청 결과처리
function insertBoardtHandler(data) {
/*	$('<tr>').append($('<td>').html(data.qb_id)).append(
			$('<td>').html(data.m_id)).append($('<td>').html(data.qb_title))
			.append($('<td>').html(data.qb_content)).appendTo('#asktb');*/
	getBoardList2();
	$('#myModal').modal("hide"); // 닫기
}



// 삭제 요청
function deleteBoard() {
	$('#asktb').on("click", "#btnDel", function() {
		var qb_id = $(this).closest("tr").find("td").eq(0).html();// closest// ==조상검색
		console.log(qb_id);
		$.ajax({
			url : "../ajax/board/" + qb_id,
			method : "delete",
			success : deleteBoardHandler
		});
	});
}


// 삭제 요청 결과처리
function deleteBoardHandler(qb_id) {
	$("[data = '" + qb_id + "' ]").remove();
}

function go_page(paging) {
	document.boardForm.page.value = paging;
	document.boardForm.submit();
}


