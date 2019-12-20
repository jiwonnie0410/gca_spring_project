<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<sec:authentication property="principal.m_id" var="m_id"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	//3. 댓글 수정
	$("#btnReplyUpdate").click(function(){
		if(confirm("수정하시겠습니까?")){
		var adr_content = $("#adr_content").val();
		$.ajax({
			type: "put",
			url: "${pageContext.request.contextPath}/reply/update/${vo.adr_num}",
			// 기본값 text/html을 json으로 변경
			headers: {
				"Content-Type":"application/json"
			},
			// 데이터를 json형태로 변환
			data: JSON.stringify({
				adr_content : $('#adr_content').val(),
				adr_num : '${vo.adr_num}'
			}),
			dataType: "text",
			success: function(result){
				if(result == "success"){
					alert("수정되었습니다.");
					$("#modifyReply").css("visibility", "hidden");
					// 댓글 목록 갱신
					listReplyRest("1");
					}
				}
			});
		}
	});
	
	
	// 4. 댓글 상세화면 닫기
	$("#btnReplyClose").click(function(){
		$("#modifyReply").css("visibility", "hidden");
	});
	
	
	// 5. 댓글 삭제
	$("#btnReplyDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type: "delete",
				url: "${pageContext.request.contextPath}/reply/delete/${vo.adr_num}",
				success: function(result){
					if(result == "success"){
						alert("삭제되었습니다.");
						$("#modifyReply").css("visibility", "hidden");
						listReplyRest("1");
					}
				}
			});
		}
	});
</script>
</head>


<body>
	댓글 번호 : ${vo.adr_num}<br>
	<input type="hidden" id="adr_num" name="adr_num" value="${vo.adr_num}">
	<textarea id="adr_content" name="adr_content" rows="3" cols="40">${vo.adr_content}</textarea>
	<div style="text-align: center;">
		<!-- 본인 댓글만 수정, 삭제가 가능하도록 처리 -->
		<c:if test="${m_id == vo.m_id}">
			<button type="button" id="btnReplyUpdate" >수정</button>
			<button type="button" id="btnReplyDelete" >삭제</button>
		</c:if>
		<button type="button" id="btnReplyClose" >닫기</button>
	</div>
</body>
</html>