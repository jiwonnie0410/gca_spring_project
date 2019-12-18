<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	
<script src="${pageContext.request.contextPath }/resources/js/admin/user.js"></script>


  <style>
    table{
     table-layout:fixed;
}
    .autocut{
     text-overflow:ellipsis;
     overflow:hidden;
     white-space: nowrap;
     align="center"
}
    </style>
</head>

<body >
<!------------------------------------------------------------------------------------------------------------  -->
<div id="content-wrapper">
 <div class="container-fluid">
		<h1 align="center">회원관리</h1>
		<section class="userlist">
			<div class="card mb-3">
				<div class="card-header" style="background-color: #FEBABA;">회원관리</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table text-center">
							<thead>
								<tr>
									<th class="text-center">아이디</th>
									<th class="text-center">이름</th>
									<th class="text-center">성별</th>
									<!-- <th class="text-center">거주지</th> -->
									<th class="text-center">계정상태</th>
									<th class="text-center">조회</th>
									<th class="text-center">삭제</th>
								</tr>
							</thead>
							<tbody id="userlist"></tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
			
				
<!-- -------------------------------------------------------------------------------------------------------------------- -->
		<!-- 처리 상태 선택 -->
		<div align="right">
			<button type="button" class="btn button" style="border: 1.5px solid #FEBABA;">전체</button>
			<button type="button" class="btn button" style="border: 1.5px solid #FEBABA;">처리 중</button>
			<button type="button" class="btn button" style="border: 1.5px solid #FEBABA;">처리 완료</button>
			&nbsp;&nbsp;
		</div>

		<div align="center">
        <form class="form-inline" id="frmSearch" method="post" action="${pageContext.request.contextPath}/admin/getUserList">
			<!-- <div align="center" style="padding-right: 3%; padding-left: 3%;"> -->
				<table>
						<tr>
							<td><select id="searchCondition" name="searchCondition" class="btn btn-outline-warning btn-sm dropdown-toggle" style="">
									<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
									<option value="all"<c:out value="${map.searchOption == 'all'?'selected':''}"/>>전체</option>
									<option value="tr_reason_cd"<c:out value="${map.searchOption == 'tr_reason_cd'?'selected':''}"/>>신고유형</option>
									<option value="tr_mid"<c:out value="${map.searchOption == 'tr_mid'?'selected':''}"/>>피신고자 아이디</option>
									<option value="m_id"<c:out value="${map.searchOption == 'm_id'?'selected':''}"/>>신고자</option>
							</select></td>
							<td><input name="keyword" value="${map.keyword}" class="form-control"> </td>
							<td><button type="submit" class="btn btn-outline-warning btn-sm" style="border-color: #FAF0F0; color: #ffc0cb;">검색</button></td>
						</tr>
				</table>
		</form>
		</div>
		
		<!-- 레코드의 갯수를 출력 -->
		<table class="table" >
		<thead>
			<tr>
				<th ><center>번호</center></th>
				<th  align="center"><center>신고한 회원</center></th>
				<th align="center"><center>신고당한 회원</center></th>
				<th align="center"><center>신고유형</center></th>
				<th align="center"><center>신고 날짜</center></th>
			</tr>
		</thead>
		<tbody>
		<!-- db 목록을 가져와서 뿌려주는 곳 -->
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="5" align="center">조회결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
								<!-- db 목록을 가져와서 뿌려주는 곳 -->
						<c:forEach var="row" items="${list}">
						<tr>
							<td align="center" width="10"style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${row.tr_num}</td>
							<td align="center">${row.m_id}</td>
							<td align="center">${row.tr_mid}</td>
							<td  align="center">${row.tr_reason_cd}</td>
							<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
							<td align="center"><fmt:formatDate value="${row.tr_dttm}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	

		<!-- 페이징 -->
		<tr>
			<td colspan="5">
				<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> 
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('1')">[처음]</a>
				</c:if> 
				<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 --> 
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
				</c:if>  
				<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 --> 
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<!-- 현재페이지이면 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == map.boardPager.curPage}">
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach> <!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
				</c:if> <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 --> <c:if
					test="${map.boardPager.curPage <= map.boardPager.totPage}">
					<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
		<!-- 페이징 -->
		</tbody>
		</table>
	</div>
</div>
<!-- 	
	Modal
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			Modal content
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title">신고사유</h4>
					<button type="button" class="close" data-dismiss="modal"
						style="background-color: red; border: 1.5px solid red;">&times;</button>
				</div>

				<div class="modal-body">
					<div class="modal-content">
						<label>신고자 회원 아이디:</label> <label>피신고자 회원 아이디:</label> <label>신고
							사유</label>
						<textarea rows="10" class="form-control" readonly="readonly"
							id="content"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">Close</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">처리</button>
				</div>
			</div>

		</div>
	</div> -->



<!-- ------------------------------------------Modal 읽기------------------------------------------------------------------>
	<!-- 게시물 상세보기 영역 -->
	<div class="modal fade" id="Modalread" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					회원정보 조회
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
<!-- ------------------------------------------Modal 읽기 끝------------------------------------------------------------------>				
				
				
				
				
				
				
	
</body>

</html>
