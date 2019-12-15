<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.net.URLDecoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %> 
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath }/resources/js/board/user_Qna.js"></script>
<!--json할때 필요  -->
<script src="${pageContext.request.contextPath }/resources/js/json.min.js"></script>


<title>boardList_json.jsp</title>
</head>
<body>
<!-- -----------------------------------------검색폼 시작------------------------------------------------->
<div>
	<form action="getBoardList" name="boardForm">
		<input type="hidden" name="page" value="1"/>
		<select name="searchCondition">
			<option value="">선택</option>
			<option value="qb_title" <c:if test="${boardSearchVO.searchCondition=='qb_title'}">selected</c:if> >제목</option>
			<option value="qb_content" <c:if test="${boardSearchVO.searchCondition=='qb_content'}">selected</c:if> >내용</option>
		</select>
		<input name="keyword" value="${boardSearchVO.keyword}">
		<button>검색</button>
	</form>
</div>
<!-- -----------------------------------------------------검색폼 끝------------------------------------ -->



<!------------------------------------------------------- 목록 시작 ----------------------------------->
<h3>게시판 목록</h3>
	<table  class="table text-center">
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
<!------------------------------------------------------- 목록  끝 ----------------------------------->




<!-- ---------------------------------------페이징 시작------------------------------------------------- -->
	<my:paging paging="${paging}"></my:paging> 
<!-- --------------------------------------------------페이징 끝 ------------------------------------>	





<!----------------------------------게시판 작성  ------------------------------------------------------------>
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
						<form role="form" action="../ajax/insertBoard"  id="ad_boardWriteForm" name="ad_boardWriteForm">
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
	
	
	
<!-- -------------------------------------게시글 읽기------------------------------  -->	
<!-- Modal 읽기-->
	<!-- 게시물 상세보기 영역 -->
	<div class="modal fade" id="UserModalread" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					문의게시판 관리
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
				</div>
				<div class="modal-footer">
						<button type="button" class="btn btn-primary px-5 py-3 mt-3"
							id="btnDelete">삭제</button>
					<button type="button" class="btn btn-primary px-4 py-2"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>	
</body>

</html>