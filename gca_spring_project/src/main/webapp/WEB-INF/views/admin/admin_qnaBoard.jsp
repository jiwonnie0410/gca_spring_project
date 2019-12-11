<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script>
	//페이지맵 이벤트

	//ready이벤트 작성
	$(function() {
		getBoardList2(); //목록조회
		insertBoard(); //등록 이벤트 클릭 이벤트 지정
		deleteBoard();//삭제
		
		
	/* 	$("body").on("click", "[id^=write]", function() {
			var qb_id = $(this).closest("tr").find("td").eq(0).html();// closest ==조상검색
			console.log(qb_id);
		}); */
		
		 
		$("#Modalread").on('show.bs.modal', function(){
			var qb_id = $(this).closest("tr").find("td").eq(0).html();// closest ==조상검색
			console.log(qb_id);
			}); 
		
		

	});

	
	
	
	//목록 조회요청
	function getBoardList2() {
		$.ajax({
			url : "ajax/getBoardList2.json",
			dataType : "json",
			success : getBoardListHandler
		});
	}
	//목록 조회 결과처리

	function getBoardListHandler(datas) {
		$("#asktb").empty();
		for (var i = 0; i < datas.length; i++) {
			$('<tr>')
					.append($('<td>').html(datas[i].qb_id))
					.append($('<td>').html(datas[i].qb_title))
					.append($('<td>').html(datas[i].qb_content))
					.append(
							$('<td>')
									.html(
											"<button id='write' data-toggle='modal' data-target='#Modalread' >답글</button>"))
					.append($('<td>').html('<button id=\'btnDel\'>삭제</button>'))
					.appendTo('#asktb').attr("data", datas[i].qb_id);
		}
	}//  

	function insertBoard() {
		$("#btnIns").click(function() {
			var param = JSON.stringify($("#frm").serializeObject());// form의 입력데이터를 쿼리스트링으로 만들어준다. 
			$.ajax({
				url : "ajax/insertBoard.json",
				method : 'post',
				dataType : "json",
				data : param,
				contentType : "application/json",
				success : insertBoardtHandler,
				error : function() {
					alert("error");
				}
			}); //ajax	
		});//function
	}//insertBoard

	//등록 요청 결과처리
	function insertBoardtHandler(data) {
		$('<tr>').append($('<td>').html(data.qb_id)).append(
				$('<td>').html(data.m_id))
				.append($('<td>').html(data.qb_title)).append(
						$('<td>').html(data.qb_content)).appendTo('#asktb');
		$('#myModal').modal("hide"); //닫기 
	}

	//삭제 요청(rest방식)
	function deleteBoard() {
		$('#asktb').on("click", "#btnDel", function() {
			//var seq = $(this).parent().attr("data")
			var qb_id = $(this).closest("tr").find("td").eq(0).html();// closest ==조상검색
			console.log(qb_id);
			$.ajax({
				url : "board/" + qb_id,
				method : "delete",
				success : deleteBoardHandler
			});
		});
	}

	//삭제 요청 결과처리
	function deleteBoardHandler(qb_id) {
		$("[data = '" + qb_id + "' ]").remove();
	}

	function go_page(paging) {
		document.boardForm.page.value = paging;
		document.boardForm.submit();
	}

	// 3. 게시글 목록으로 이동 - 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
	/* $("#btnList").click(function(){
		location.href="${pageContext.request.contextPath}/admin_qnaBoard.?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
	}); */
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
		<my:paging paging="${paging}"></my:paging>
		<!-- 페이징 끝 -->
	</div>
	<!-- <button id="write" class="btn btn-primary px-5 py-3" type="button" data-toggle="modal" data-target="#myModal">Write</button> -->


	<!-- Modal content-->
	<div class="modal fade" id="myModal" role="dialog">
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
									<div class="form-group"></div>
									<div class="form-group">
										<div>
											제목 <select name="qb_title">
												<option value="qna1" selected>답변1</option>
												<option value="qna2">답변2</option>
												<option value="qna3">답변3</option>
												<option value="qna4">답변4</option>
											</select>
										</div>
									</div>
									<div>
										<input type="hidden" value="dto.">
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
					<button type="button" class="btn btn-primary px-4 py-2"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<!-- Modal 읽기-->
	<!-- 게시물 상세보기 영역 -->
	<div class="modal fade" id="Modalread" role="dialog">
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
								<form action="insertBoard" id="frm" method="post">
									<input type="hidden" value="${dto.qb_id}">
									<div class="form-group">
										<div>
											<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
											작성일자 :
											<fmt:formatDate value="${dto.qb_date}"
												pattern="yyyy-MM-dd a HH:mm:ss" />
											<!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
										</div>
									</div>
									<div class="form-group">
										<div>
											제목 <input name="qb_title" id="qb_title" size="80"
												value="${dto.ad_title}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<div>
											내용
											<textarea name="qb_content" id="qb_content" rows="4"
												readonly="readonly">${dto.ad_content}</textarea>
										</div>
									</div>
									<div style="width: 650px; text-align: center;">
										<!-- 게시물번호를 hidden으로 처리 -->
										<input type="hidden" name="ad_num" value="${dto.qb_num}">
										<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
										<c:if test="${sessionScope.m_id == dto.m_id}">
											<button type="button" class="btn btn-primary px-5 py-3 mt-3"
												id="btnUpdete" data-toggle='modal' data-target='#myModal'>답글</button>
											<button type="button" class="btn btn-primary px-5 py-3 mt-3"
												id="btnDelete">삭제</button>
										</c:if>
										<!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
										<!-- 	<button type="button" class="btn btn-primary px-5 py-3  mt-3" id="btnList">목록</button> -->
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary px-4 py-2"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>

</html>