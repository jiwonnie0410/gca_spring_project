<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 내 쪽지함]</title>
	<!------------------------------------------------------- 목록 1.시작 ----------------------------------->
<script type="text/javascript">
	$(function() {
		getBoardList(); //목록 조회
	});

	//목록 조회 요청
	function getBoardList() {
		$.ajax({
			url : "ajax/getBoardList.json",
			dataType : "json",
			success : getBoardListHandler
		});
	}

	//목록조회 결과처리
	function getBoardListHandler(datas) {
		for (i = 0; i < datas.length; i++) {
			$("<div>").append($("<span>").html(datas[i].altert_num))
					.append( datas[i].altert_content)
					.append($("<button id='btnDel'>").html("삭제"))
					.appendTo($("#list"))
					.attr("data", datas[i].altert_num);
		}
	}
</script>
</head>
<body>


	<div class="row">
		<div class="col-4">
			<div class="card">
				<div class="card-header" style="background-color: #FEBABA;">
					쪽지함</div>
				<div id="list"></div>
			</div>
		</div>
	</div>


	<!------------------------------------------------------- 목록1.  끝 ----------------------------------->


<!------------------------------------------------------- 목록 2.시작 ----------------------------------->
	<div class="row" style="border: 2pt groove gray; " >
		<div class="col-4">
			<div class="card">
				<div class="card-header" style="background-color: #FEBABA; ">
					쪽지함</div>
				<div class="card-body">
					<%--   <c:forEach var = "altert" items="${?? }"> --%>
					쪽지번호 :
					<%-- ${altert.altert_num } --%>
					보낸사람 :
					<!-- <img alt="" src="">  -->
					내용 :
					<%-- ${altert.altert_content } --%>
					보낸 날짜 :
					<%--  ${altert.altert_dttm }  --%>
					<button>삭제</button>
					<%--    </c:forEach> --%>
				</div>
			</div>
		</div>
	</div>
<!------------------------------------------------------- 목록2.  끝 ----------------------------------->


</body>
</html>