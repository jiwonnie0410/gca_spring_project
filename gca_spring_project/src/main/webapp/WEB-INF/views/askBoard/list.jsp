<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--ContextPath 선언 --%>
<%String cp = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<!-- 삭제 -->
<!-- 삭제 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
		location.href = "${pageContext.request.contextPath}/board/adlist?curPage="
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
        <form class="form-inline" id="frmSearch" method="post" action="${pageContext.request.contextPath}/board/adlist">
		<div align="center">
			<div class="jumbotron" style="background-color: #FE9191; ">
				<h2 style="color: white;" >홍보</h2>
				<!-- <p style="color: white;">* 홍보.</p> -->
			 </div>
			<%--  <sec:authentication property="principal.m_id"/>  --%>
			<div align="center" style="padding-right: 3%; padding-left: 3%;">
				<!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
				<%-- <c:if test="${sessionScope.m_id != null}"> --%>
					<div align="right">
						<button class="btn" type="button" id="btnWrite" name="write"  style="margin-right: 10%; background-color: #FE9191; color: white;">Write</button>
					</div>
				<%-- </c:if>  --%>
				
				<form name="SearchForm">
				<table>
						<tr>
							<td><select id="searchCondition" name="searchCondition" class="btn btn-outline-warning btn-sm dropdown-toggle" style="">
									<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
									<option value="all"<c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+아이디+제목</option>
									<option value="m_id"<c:out value="${map.searchOption == 'm_id'?'selected':''}"/>>아이디</option>
									<option value="ad_content"<c:out value="${map.searchOption == 'ad_content'?'selected':''}"/>>내용</option>
									<option value="title"<c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목</option>
							</select></td>
							<td><input name="keyword" value="${map.keyword}" class="form-control"> </td>
							<td><button type="submit" class="btn btn-outline-warning btn-sm"
									style="border-color: #FAF0F0; color: #ffc0cb;">검색</button></td>
						</tr>
					</table>
			</form>	
			</div>
		</div>
	</form>
	<!-- 레코드의 갯수를 출력 -->
	<table class="table" >
		<thead>
			<tr>
				<th width="20%" align="center"><center> 번호</center></th>
				<!-- <th>아이디</th> -->
				<th width="30%" align="center"><center>제목</center></th>
				<th width="30%" align="center" ><center>내용</center></th>
				<th width="20%" align="center"><center>조회수</center></th>
			</tr>
		</thead>
		<tbody>
		<!-- db 목록을 가져와서 뿌려주는 곳 -->
			<c:choose>
				<c:when test="${fn:length(map.list) == 0}">
					<tr>
						<td colspan="3" align="center">조회결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
								<!-- db 목록을 가져와서 뿌려주는 곳 -->
						<c:forEach var="row" items="${map.list}">
								<tr>
									<%-- <td align="center" width="10"style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${row.ad_num}</td> --%>
									<td align="center">${row.m_id}</td>
									<!-- 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
									<td align="center" width="10" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" align="center">
										<a href="${pageContext.request.contextPath}/board/view?ad_num=${row.ad_num}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.ad_title}
												
												<!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 --> 
												<c:if test="${row.recnt > 0}">
													<span style="color: red;">(${row.recnt}) </span>
												</c:if>
										</a>
									</td>
									<td class="autocut" width="10"style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"align="center">${row.ad_content}<%-- <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> 
										<fmt:formatDate value ="${row.regdate}" pattern="yyyy-MM-dd" /> --%>
									</td>
									<td width="10"style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"align="center">${row.ad_count}</td>
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
	</table>

</body>
</html>
