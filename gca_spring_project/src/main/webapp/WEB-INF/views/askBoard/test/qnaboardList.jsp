<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<%String cp = request.getContextPath();%>
<%--ContextPath 선언 --%>
<html>
<head>
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						
						/* 검색 */
						  $(".search").keyup(function () {
								var searchTerm = $(".search").val();
								var listItem = $('.results tbody').children('tr');
								var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
								
							  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
									return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
								}
							  });
								
							  $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
								$(this).attr('visible','false');
							  });

							  $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
								$(this).attr('visible','true');
							  });

							  var jobCount = $('.results tbody tr[visible="true"]').length;
								$('.counter').text(jobCount + ' item');

							  if(jobCount == '0') {$('.no-result').show();}
								else {$('.no-result').hide();}
									  });
						
						
						

						//--페이지 셋팅
						var totalPage = $
						{
							totalPage
						}
						; //전체 페이지
						var startPage = $
						{
							startPage
						}
						; //현재 페이지

						var pagination = "";

						//--페이지네이션에 항상 10개가 보이도록 조절
						var forStart = 0;
						var forEnd = 0;

						if ((startPage - 5) < 1) {
							forStart = 1;
						} else {
							forStart = startPage - 5;
						}

						if (forStart == 1) {

							if (totalPage > 9) {
								forEnd = 10;
							} else {
								forEnd = totalPage;
							}

						} else {

							if ((startPage + 4) > totalPage) {

								forEnd = totalPage;

								if (forEnd > 9) {
									forStart = forEnd - 9
								}

							} else {
								forEnd = startPage + 4;
							}
						}
						//--페이지네이션에 항상 10개가 보이도록 조절

						//전체 페이지 수를 받아 돌린다.
						for (var i = forStart; i <= forEnd; i++) {
							if (startPage == i) {
								pagination += ' <button name="page_move" start_page="'+i+'" disabled>'
										+ i + '</button>';
							} else {
								pagination += ' <button name="page_move" start_page="'+i+'" style="cursor:pointer;" >'
										+ i + '</button>';
							}
						}

						//하단 페이지 부분에 붙인다.
						$("#pagination").append(pagination);
						//--페이지 셋팅

						
						
						$("a[name='id']").click(
								function() {
									location.href = "view?id="
											+ $(this).attr("content_id");
								});
						$("a[name='write']").click(
								function() {
									location.href = "view?id="
											+ $(this).attr("content_id");
								});
						$("a[name='subject']").click(
								function() {
									location.href = "view?id="
											+ $(this).attr("content_id");
								});
						$("a[name='content']").click(
								function() {
									location.href = "view?id="
											+ $(this).attr("content_id");
								});
						
						

						$("#write").click(function() {
							location.href = "edit";
						});

						$(document).on(
								"click",
								"button[name='page_move']",
								function() {

									var visiblePages = 10;//리스트 보여줄 페이지

									$('#startPage').val(
											$(this).attr("start_page"));//보고 싶은 페이지
									$('#visiblePages').val(visiblePages);

									$("#frmSearch").submit();

								});
						
						

					});
</script>
<style>
    table{
     table-layout:fixed;
}

.results tr[visible='false'],
	.no-result{
	  display:none;
	}
	
	.results tr[visible='true']{
	  display:table-row;
	}

    </style>
</head>

<body>
	<form class="form-inline" id="frmSearch" action="/board/list">
		<input type="hidden" id="startPage" name="startPage" value="">
		<!-- 페이징을 위한 hidden타입 추가 -->
		<input type="hidden" id="visiblePages" name="visiblePages" value="">
		<!-- 페이징을 위한 hidden타입 추가 -->
		<div align="center">
			<div class="jumbotron">
				<h2>홍보</h2>
			</div>
			<div class="container" >
				<br>
				<!--검색  -->
				<div class="form-group pull-right">
					<input type="text" class="search form-control" placeholder="검색"style="border-color: #FE9191;">
				</div>
				<!--검색  -->
				<div class=”table-responsive“>
					<!-- <table class="table table-hover results">
						<thead>
							<tr>
								<td align="right">
									<button type="button" id="write" name="write"
										class="btn btn-primary px-4 py-3">글 작성</button>
								</td>
							</tr>
					</table> -->
					<table class="table table-hover results"  >
						<thead>
							<tr>
								<th width="10"><center>#</center></th>
								<th width="30"><center>ID</center></th>
								<th width="20"><center>Title</center></th>
								<th width="40"><center>내용</center></th>
							</tr>
							<!-- 검색시 없을경우 -->
							<tr class="warning no-result">
								<td colspan="3"><i class="fa fa-warning"></i> No result</td>
							</tr>
							<!-- 검색시 없을경우 end-->
						</thead>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
						<c:choose>
							<c:when test="${fn:length(boardList) == 0}">
								<tr>
									<td colspan="3" align="center">조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="boardList" items="${boardList}"
									varStatus="status">
									<tr>
										<td  width="10" style="text-overflow: ellipsis; overflow:hidden; white-space: nowrap;" align="center"><a name="id" class="mouseOverHighlight" content_id="${boardList.id}">${boardList.id}</a></td>
										<td  width="15" style="text-overflow: ellipsis; overflow:hidden; white-space: nowrap;" align="center"><a name="writer" class="mouseOverHighlight"content_id="${boardList.id}">${boardList.writer}</a></td>
										<td width="25" style="text-overflow: ellipsis; overflow:hidden; white-space: nowrap;"><a name="subject" class="mouseOverHighlight" content_id="${boardList.id}">${boardList.subject}</a></td>
										<td width="30" style="text-overflow: ellipsis; overflow:hidden; white-space: nowrap;"><a name="content" class="mouseOverHighlight" content_id="${boardList.id}">${boardList.content}</a></td>
										<%-- <td align="center">${boardList.register_datetime}</td> --%>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<br>
					<div id="pagination"></div>
				</div>
			</div>
			<br>
			<!-- 글쓰기 버튼  -->
			<div align="right">
				<button type="button" id="write" name="write" class="btn btn-primary px-4 py-3" style="margin-right: 10%">Write</button>
				<!-- data-target="#myModal" -->
			</div>
		</div>
	</form>


	</script>
</body>

<script src="<%=cp%>/resources/js/jquery.min.js"></script>
<script src="<%=cp%>/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="<%=cp%>/resources/js/popper.min.js"></script>
<script src="<%=cp%>/resources/js/bootstrap.min.js"></script>
<script src="<%=cp%>/resources/js/jquery.easing.1.3.js"></script>
<script src="<%=cp%>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=cp%>/resources/js/jquery.stellar.min.js"></script>
<script src="<%=cp%>/resources/js/owl.carousel.min.js"></script>
<script src="<%=cp%>/resources/js/jquery.magnific-popup.min.js"></script>
<script src="<%=cp%>/resources/js/aos.js"></script>
<script src="<%=cp%>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=cp%>/resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="<%=cp%>/resources/js/google-map.js"></script>
<script src="<%=cp%>/resources/js/main.js"></script>
<script type="text/javascript"src="http://code.jquery.com/jquery-1.11.3.js"></script>
<!--ㅡ모달  -->
<%-- jQuery CDN --%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
</html>
