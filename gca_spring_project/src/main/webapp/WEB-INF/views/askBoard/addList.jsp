<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
    <head>
        <title>게시판</title>       
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script>
	$(document)
			.ready(
					function() {
						$("#btnWrite")
								.click(
										function() {
											// 페이지 주소 변경(이동)
											location.href = "${pageContext.request.contextPath}/board/write.do";
										});
					});
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page) {
		location.href = "${pageContext.request.contextPath}/board/list.do?curPage="
				+ page
				+ "&searchOption-${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
</script>


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
    
    <body>
        <!-- <form class="form-inline" id="frmSearch" action="/board/list"> -->
        <form class="form-inline" id="frmSearch" method="post" action="${pageContext.request.contextPath}/board/list.do">
            <div align="center">
              <div class="jumbotron">
				<h2>홍보</h2>
				<p>* 홍보.</p>
			 </div>
			
				<div align="center" style="padding-right:3%;padding-left:3%;">
				 <!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
		<c:if test="${sessionScope.userId != null}">
			<div align="right">
				<button type="button" id="btnWrite" name="write"
					class="btn btn-primary px-4 py-3" style="margin-right: 10%">Write</button>
				<!-- data-target="#myModal" -->
			</div>
		</c:if>
				<br>
			<select name="searchOption">
			<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
			<option value="all"
				<c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+아이디+제목</option>
			<option value="m_id"
				<c:out value="${map.searchOption == 'm_id'?'selected':''}"/>>아이디</option>
			<option value="ad_contents"
				<c:out value="${map.searchOption == 'ad_contents'?'selected':''}"/>>내용</option>
			<option value="title"
				<c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목</option>
		</select> <input name="keyword" value="${map.keyword}"> <input
			type="submit" value="조회">
		
	</form>
	<!-- 레코드의 갯수를 출력 -->
	<table class="table table-hover results" border="1">
		<thead>
			<tr>
				<th width="30"><center>번호</center></th>
				<th><center>이름</center></th>
				<th><center>제목</center></th>
				<th ><center>내용</center></th>
				<th><center>조회수</center></th>
			</tr>
		</thead>
		<tbody>
		<!-- db 목록을 가져와서 뿌려주는 곳 -->
		<c:forEach var="row" items="${map.list}">
			<c:choose>
				<c:when test="${fn:length(map.list) == 0}">
					<tr>
						<td colspan="3" align="center">조회결과가 없습니다.</td>
					</tr>
				</c:when>
				<%-- <c:when test="${row.show == 'y'}"> --%>
					<!-- show 컬럼이 y일때(삭제X 글) -->
					<tr>
						<td align="center"  width="10" style="text-overflow: ellipsis; overflow:hidden; white-space: nowrap;" align="center">${row.bno}</td>
						<!-- 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
						
						<td align="center" width="10" style="text-overflow: ellipsis; overflow:hidden; white-space: nowrap;" align="center">
						<a href="${pageContext.request.contextPath}/board/view.do?bno=${row.ad_number}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title}
								<!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 --> 
								<c:if test="${row.recnt > 0}">
									<span style="color: red;">(${row.recnt}) </span>
								</c:if>
						</a></td>
						
						<td align="center">${row.m_id}</td>
						
						<td class="autocut" width="10" style="text-overflow: ellipsis; overflow:hidden; white-space: nowrap;" align="center">${row.ad_contents}
							
							<%-- <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> 
							<fmt:formatDate value ="${row.regdate}" pattern="yyyy-MM-dd" /> --%>
						</td>
						
						<td width="10" style="text-overflow: ellipsis; overflow:hidden; white-space: nowrap;" align="center">${row.viewcnt}</td>
					</tr>
				<%-- </c:when> --%>
				<c:otherwise>
					<!-- show 컬럼이 n일때(삭제된 글) -->
					<tr>
						<td colspan="5" align="left">
						<c:if test="${row.recnt > 0}">
								<a href="${pageContext.request.contextPath}/board/view.do?ad_number=${row.ad_number}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">
								삭제된게시물입니다. 
								<!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 --> 
								<span style="color: red;">(${row.recnt}) </span>
								</a>
						</c:if> 
						<c:if test="${row.recnt == 0 }">
									삭제된 게시물입니다.
						</c:if></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>

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
	</table>
        
   <!-- Modal -->
  	<div class="modal fade" id="myModal" role="dialog" >
    	<div class="modal-dialog modal-lg">
    
      	<!-- Modal ad_contents-->
      	<div class="modal-content">
	        <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
        
        <div class="modal-body">
          
			<div class="panel-group">
			<div class="panel panel-success" style="margin-top: 10px;">
				<div class="panel-heading">홍보</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="${review_write}" method="post">
						<div class="form-group">
							<label class="control-label col-sm-2">작성자(ID):</label>
							<div class="col-sm-10">
								<input type="hidden" id="board_id" name="board_id" value="${boardView.writer}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">제목:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="review_title" name="review_title" placeholder="Title">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">내용:</label>
							<div class="col-sm-10">
								 <textarea name="ad_contents" id="ad_contents" rows="10" cols="80">${boardView.ad_contents}</textarea>
							</div>
						</div>
				
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-success">작 성</button>
								<button type="reset" class="btn btn-danger">초기화</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  
		
</body>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath }/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath }/js/aos.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath }/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="${pageContext.request.contextPath }/js/google-map.js"></script>
<script src="${pageContext.request.contextPath }/js/main.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>

<!--ㅡ모달  -->
<%-- jQuery CDN --%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>

</html>
