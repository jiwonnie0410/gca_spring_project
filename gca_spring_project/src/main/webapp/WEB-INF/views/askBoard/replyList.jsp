<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<sec:authentication property="principal.m_id" var="m_id"/>
<title>Insert title here</title>
</head>
<body>
	<table style="width: 360px" >
		<!-- 댓글 목록 -->
		<c:forEach var="row" items="${list}">
		<tr>	
			<td  style="width: 290px; " >
			   ${row.m_nick}&nbsp;&nbsp;(<fmt:formatDate value="${row.adr_regdate}" pattern="yyyy-MM-dd"/>)
			</td>
			<td colspan="2">
				<!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
				 <c:if test="${m_id == row.m_id}">
					<button type="button" id="btnModify" style="background-color: #FE9191; color: white; width: 60px;"  onclick="showReplyModify('${row.adr_num}')" >댓글<br>수정</button>
				</c:if>
			</td>
			
		</tr>
		
		
			
		<tr>
			<td style="word-break:break-all; style="width: 350px; ">		
				${row.adr_content}
				 <hr> 
			</td>
			<%-- <td colspan="2">
				<!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
				 <c:if test="${m_id == row.m_id}">
					<button type="button" id="btnModify" style="background-color: #FE9191; color: white; width: 60px;"  onclick="showReplyModify('${row.adr_num}')" >댓글<br>수정</button>
				</c:if>
			</td> --%>
			
			
		</tr>
		</c:forEach>
		
		
		
		
		<!-- 페이징 -->
		<tr style="text-align: center;">
			<td>
				<!-- 현재 페이지 블럭이 1보다 크면 처음페이지로 이동 -->
				<c:if test="${replyPager.curBlock > 1}">
					<a href="javascript:listReply('1')">[처음]</a>
				</c:if>
				<!-- 현재 페이지 블럭이 1보다 크면 이전 페이지 블럭으로 이동 -->
				<c:if test="${replyPager.curBlock > 1}">
					<a href="javascript:listReply('${replyPager.prevPage}')">[이전]</a>
				</c:if>
				<!-- 페이지 블럭 처음부터 마지막 블럭까지 -->
				<c:forEach var="num" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
					<c:choose>
						<c:when test="${num == replyPager.curPage}">
							${num}&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:listReply('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 다음페이지로 이동 -->
				<c:if test="${replyPager.curBlock <= replyPager.totBlock}">
					<a href="javascript:listReply('${replyPager.nextPage}')">[다음]</a>
				</c:if>
				<!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 끝으로 이동 -->
				<c:if test="${replyPager.curBlock <= replyPager.totBlock}">
					<a href="javascript:listReply('${replyPager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
	
	
	
	<!-- 댓글 수정 영역-->
	<div id="modifyReply"></div>
</body>
</html>