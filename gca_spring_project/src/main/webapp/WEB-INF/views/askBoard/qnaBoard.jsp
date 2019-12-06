<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--json할때 필요  -->
<script src="${pageContext.request.contextPath }/resources/js/json.min.js"></script>

<script>
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
				$('<tr>').append($('<td>').html(datas[i].qb_id))
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
			//var param = $("#frm").serialize();
			var param = JSON.stringify($("#frm").serializeObject());// form의 입력데이터를 쿼리스트링으로 만들어준다. 
			$.ajax({
				url:"ajax/insertBoard.json",
				method:'post',
				dataType:"json",
				data: param,
				contentType:"application/json",
				success:	insertBoardtHandler
			});	//ajax	
		});//function
	}//insertBoard
			
	//등록 요청 결과처리
		function insertBoardtHandler(data) {
			$("#asktb").empty();
			$('<tr>').append($('<td>').html(data.qb_id))
					 .append($('<td>').html(data.m_id))
					 .append($('<td>').html(data.qb_title))
					 .append($('<td>').html(data.qb_content))
					 .appendTo('#asktb');
					 
		}
	
					 
					 
					 
					 /* //등록 요청 결과처리
		function insertBoardtHandler(data) {
			$("<div>").append(data.bno)
						.append(data.title)
						.appendTo($("#boardList"));
				
		} */
			
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
		
		
		

</script>
<title>boardList_json.jsp</title>
</head>
<body>
<h3>게시판 목록</h3>
<div id="boardList"></div>
	<table class="table text-center">
		<thead>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">작성자</th>
					<th class="text-center">제목</th>
					<th class="text-center">내용</th>
					<!-- <th class="text-center">삭제</th>
					<th class="text-center">답변</th> -->
				</tr>
			</thead>
		<tbody id="asktb"></tbody>
	</table>
	<button id="write" class="btn btn-primary px-5 py-3" type="button" data-toggle="modal" data-target="#myModal">Write</button>




<!--게시판 작성  -->
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
					<div class="panel-heading" style="background-color: pink; color: black">문의 사항</div>
					<div class="panel-body">
						<%-- form --%>
						<form action="insertBoard" id="frm" name="frm">
						<!-- <input type="hidden" id="qb_id" name="qb_id" value="${qb_id}" /> -->
							
							
							<div class="form-group">
								<div>
									제목
									<select name="qb_title" >
										  <option value="qna1" selected>질문1</option>
										  <option value="qna2">질문2</option>
										  <option value="qna3" >질문3</option>
										  <option value="qna4">질문4</option>
									 </select>
								</div>
							</div> 
							<div class="form-group">
								<div>
									내용
									<textarea name="qb_content" id="qb_content" placeholder="내용을 입력해주세요"></textarea>
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