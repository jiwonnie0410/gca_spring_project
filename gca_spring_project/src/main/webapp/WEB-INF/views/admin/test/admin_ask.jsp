<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<!-- <script>
//페이지맵 이벤트
//ready이벤트 작성

	

	$(function(){
		getBoardList(); //목록조회
		insertBoard(); //등록 이벤트 클릭 이벤트 지정
		deleteBoard();//삭제
		
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
	 /*  function getBoardListHandler(datas) {
		for (var i = 0; i < datas.length; i++) {
			$("<div>").append($("<span>").html(datas[i].bno) )
							.append(datas[i].title)
							.append($("<button id='btnDel'>").html("삭제"))
							.append($("<button type='button' id='write' class='btn btn-primary px-5 py-3'  data-toggle='modal' data-target='#myModal'>").html("작성"))
							.appendTo($("#boardList"))
							.attr("data",datas[i].bno);
		}
		
	}  */
	
	  function getBoardListHandler(datas) {
		for (var i = 0; i < datas.length; i++) {
			$("#asktb").empty();
				$('<tr>').append($('<td>').html(datas[i].bno))
						 .append($('<td>').html(datas[i].title))
						 .append($('<td>').html(datas[i].content))
						 .append($('<td>').html('<button id=\'write\'>작성</button>'))
						 .append($('<td>').html('<button id=\'btnDel\'>삭제</button>'))
						 .appendTo('#asktb')
						 .attr("data",datas[i].bno);
				}
			}//  
	
			
			
			//등록 요청
	function insertBoard() {
		$("#btnIns").click(function() {
			//var param = $("#frm").serialize();
			var param =JSON.stringify($('#frm').serializeObject());
			$.ajax({
				url:"ajax/insertBoard.json",
				method:'post',
				dataType:"json",
				data: param,
				contentType:"application/json",
				success:	insertBoardtHandler
			});		
		});
	}
	//등록 요청 결과처리
		function insertBoardtHandler(data) {
			$("<div>").append(data.bno)
						.append(data.title)
						.appendTo($("#boardList"));
				
		}
			
	//삭제 요청(rest방식)
	function deleteBoard() {
		$("#boardList").on("click","#btnDel", function() {
			var bno = $(this).parent().find("span").eq(0).html();
			console.log(bno);
			$.ajax({
				url:"board/"+bno,
				method:"delete",	
				success: deleteBoardHandler
			});
		});
	}
	
		//삭제 요청 결과처리
		function deleteBoardHandler(bno) {
			console.log( bno);
			$("[data = '" + bno+ "' ]" ).remove();
		}
		
		
		

</script> -->
<title>boardList_json.jsp</title>
</head>
<body>
<h3>게시판 목록</h3>
<div id="boardList"></div>
	<table class="table text-center">
		<thead>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">내용</th>
					<th class="text-center">삭제</th>
					<th class="text-center">답변</th>
				</tr>
			</thead>
		<tbody id="asktb"></tbody>
	</table>
	<button id="write" class="btn btn-primary px-5 py-3" type="button" data-toggle="modal" data-target="#myModal">Write</button>


<!-- Modal content-->
<div class="modal fade" id="myModal" role="dialog" >
    	<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>

		<div class="modal-body">

			<div class="panel-group">
				<div class="panel panel-success" style="margin-top: 10px;">
					<div class="panel-heading"
						style="background-color: pink; color: black">문의 사항</div>
					<div class="panel-body">
						<%-- form --%>
						<form action="insertBoard" id="frm">
							<div class="form-group">
								<!-- <div>
									이름<input name="writer" id="writer" placeholder="이름을 입력해주세요">
								</div> -->
							</div>
							<!-- <div class="form-group">
								<div>
									제목<input name="title" id="title" size="80"
										placeholder="제목을 입력해주세요">
								</div>
							</div> -->
							<div class="form-group">
								<div>
									내용
									<textarea name="content" id="content" rows="4" cols="80"
										placeholder="내용을 입력해주세요"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" id="btnIns">확인</button>
									<button type="reset" class="btn btn-danger">초기화</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
          <button type="button" class="btn btn-primary px-4 py-2" data-dismiss="modal">Close</button>
        </div>
	</div>	
	</div>
	</div>
</body>

</html>