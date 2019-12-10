<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.net.URLDecoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<script>
//페이지맵 이벤트
//ready이벤트 작성
	$(function(){
		getBoardList2(); //목록조회
		insertBoard(); //등록 이벤트 클릭 이벤트 지정
		deleteBoard();//삭제
		
	});
	
	//목록 조회요청
	function getBoardList2() {
		$.ajax({
			url:"ajax/getBoardList2.json",
			dataType:"json",
			success: getBoardListHandler
		});
	}
	//목록 조회 결과처리
	
	  function getBoardListHandler(datas) {
			$("#asktb").empty();
		for (var i = 0; i < datas.length; i++) {
				$('<tr>').append($('<td>').html(datas[i].qb_id))
						 .append($('<td>').html(datas[i].qb_title))
						 .append($('<td>').html(datas[i].qb_content))
						 .append($('<td>').html("<button id='write' data-toggle='modal' data-target='#myModal' >답글</button>"))
						 .append($('<td>').html('<button id=\'btnDel\'>삭제</button>')) 
						 .appendTo('#asktb')
						 .attr("data",datas[i].bno);
				}
			}//  
	
			
			
			function insertBoard() {
				$("#btnIns").click(function() {
					var param = JSON.stringify($("#frm").serializeObject());// form의 입력데이터를 쿼리스트링으로 만들어준다. 
					$.ajax({
						url:"ajax/insertBoard.json",
						method:'post',
						dataType:"json",
						data: param,
						contentType:"application/json",
						success:	insertBoardtHandler,
						error: function() {
							alert("error");
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
<div id="content-wrapper">
			<div class="container-fluid">
				<h1 align="center">질문 관리</h1>
				<section class="boardList">
					<div class="card mb-3">
						<div class="card-header" style="background-color: #FEBABA;">회원관리</div>
						<div class="card-body">
							<div class="table-responsive">
	<table class="table text-center">
		<thead>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">내용</th>
					<th class="text-center">답변</th>
					<th class="text-center">삭제</th> 
				</tr>
			</thead>
		<tbody id="asktb"></tbody>
	</table>
	</div>
	</div>
	</div>
	</section>
	</div>
	<!-- 페이징 시작 -->
	<%-- <my:paging paging="${paging}"></my:paging> --%>
<!-- 페이징 끝 -->
	</div>
	<!-- <button id="write" class="btn btn-primary px-5 py-3" type="button" data-toggle="modal" data-target="#myModal">Write</button> -->


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
							</div>
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
									<textarea name="qb_content" id="qb_content" 
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