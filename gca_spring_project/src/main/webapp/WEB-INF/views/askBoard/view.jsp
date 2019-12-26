<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- text hight-->
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>

<!--json할때 필요  -->
<script
	src="${pageContext.request.contextPath }/resources/js/json.min.js"></script>

<script src="//code.jquery.com/jquery.min.js"></script>


<sec:authentication property="principal.m_id" var="m_id" />
<title>게시글 작성</title>

<script>

		// TextArea 자동 높이 설정
		//리사이즈 스크립트 설정
		function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
		}
		
	$(document)
			.ready(
					
					
					function() {

						/* --------------- 게시글 관련 --------------- */
						// 1. 게시글 수정
						$("#btnUpdete")
								.click(
										function() {
											if (confirm("수정하시겠습니까?")) {
												/* var title = document.form1.title.value; ==> name속성으로 처리할 경우
												var content = document.form1.content.value;
												var writer = document.form1.writer.value; */
												var title = $("#ad_title")
														.val();
												var content = $("#ad_content")
														.val();
												if (ad_title == "") {
													alert("제목을 입력하세요");
													document.form1.ad_title
															.focus();
													return;
												}
												if (ad_content == "") {
													alert("내용을 입력하세요");
													document.form1.ad_content
															.focus();
													return;
												}

												document.form1.action = "${pageContext.request.contextPath}/board/update"

												var that = $("#form1");
												var str = "";
												// 태그들.each(함수)
												// id가 uploadedList인 태그 내부에 있는 hidden태그들
												// form에 hidden태그들을 추가
												$("#form1").append(str);
												// 폼에 입력한 데이터를 서버로 전송
												document.form1.submit();

												// 폼에 입력한 데이터를 서버로 전송
												document.form1.submit();
											}
										});

						// 2. 게시글 삭제
						$("#btnDelete")
								.click(
										function() {
											// 댓글이 존재하는 게시물의 삭제처리 방지
											/* var count = "${count}";
											if(count > 0) {
												alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
												return;
											} */
											if (confirm("삭제하시겠습니까?")) {
												document.form1.action = "${pageContext.request.contextPath}/board/delete.do";
												document.form1.submit();
											}
										});

						// 3. 게시글 목록으로 이동 - 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
						$("#btnList")
								.click(
										function() {
											location.href = "${pageContext.request.contextPath}/board/adlist.?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
										});

						/* --------------- 댓글 관련 -------------- */
						// 1. 댓글 입력
						$("#btnReply").click(function() {
							//reply(); // 폼데이터 형식으로 입력
							replyJson(); // json 형식으로 입력
						});

						// 2. 댓글 목록
						//listReply("1"); // 댓글 목록 불러오기
						//listReply2(); // json 리턴방식
						listReplyRest("1"); // rest방식

					});
	
	

	/* --------------- 게시글 관련 -------------- */

	// $(객체) $("태그") $("#id") $(".class")
	/* --------------- 댓글 관련 -------------- */

	// 1_1. 댓글 입력 함수(폼 데이터 방식)
	function reply() {
		var adr_content = $("#adr_content").val();
		var ad_num = "${dto.ad_num}"
		// 비밀댓글 체크여부
		var adr_hidden = "n";
		// 태그.is(":속성") 체크여부 true/false
		if ($("#adr_hidden").is(":checked")) {
			adr_hidden = "y";
		}

		// 비밀댓글 파라미터 추가
		var param = "adr_content=" + adr_content + "&ad_num=" + ad_num
				+ "&adr_hidden=" + adr_hidden;
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/reply/insert",
			data : param,
			success : function() {
				alert("댓글이 등록되었습니다.");
				listReply2();
				//listReply("1");
			}
		});
	}

	// 1_2. 댓글 입력 함수(json방식)
	function replyJson() {
		var adr_content = $("#adr_content").val();
		var ad_num = "${dto.ad_num}"
		// 비밀댓글 체크여부
		var adr_hidden = "n";
		// 태그.is(":속성") 체크여부 true/false
		if ($("#adr_hidden").is(":checked")) {
			adr_hidden = "y";
		}
		$.ajax({
			method : "post",
			url : "${pageContext.request.contextPath}/reply/insertRest",
			contentType : "application/json",
			dataType : "text",
			// param형식보다 간편
			data : JSON.stringify({
				ad_num : ad_num,
				adr_content : adr_content,
				adr_hidden : adr_hidden
			}),
			success : function() {
				alert("댓글이 등록되었습니다.");
				// 댓글 입력 완료후 댓글 목록 불러오기 함수 호출
				//listReply("1"); 	// 전통적인 Controller방식 //@RequestParam
				//listReply2(); 	// json리턴 방식
				listReplyRest("1"); // Rest 방식 --pathvariable
			}
		});
	}

	// 2_1. 댓글 목록 - 전통적인 Controller방식
	function listReply(num) {
		$
				.ajax({
					type : "get",
					url : "${pageContext.request.contextPath}/reply/adlist?ad_num=${dto.ad_num}&curPage="
							+ num,
					success : function(result) {
						// responseText가 result에 저장됨.
						$("#listReply").html(result);
					}
				});
	}

	// 2_2. 댓글 목록 - RestController를 이용 json형식으로 리턴
	function listReply2() {
		$
				.ajax({
					type : "get",
					//contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
					url : "${pageContext.request.contextPath}/reply/listJson.do?ad_num=${dto.ad_num}",
					success : function(result) {
						console.log(result);
						var output = "<table>";
						for ( var i in result) {
							output += "<tr>";
							output += "<td>" + result[i].m_id;
							output += "(" + changeDate(result[i].adr_regdate)
									+ ")<br>";
							output += result[i].adr_content + "</td>";
							output += "<tr>";
						}
						output += "</table>";
						$("#adr_content").html(output);
					}
				});
	}

	// 2_2. 댓글 목록 - 날짜 형식 변환 함수 작성
	function changeDate(date) {
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute
				+ ":" + second;
		return strDate;
	}

	// 2_3. 댓글 목록 - Rest방식
	function listReplyRest(num) {
		$
				.ajax({
					type : "get",
					url : "${pageContext.request.contextPath}/reply/list/${dto.ad_num}/"
							+ num,
					success : function(result) {
						// responseText가 result에 저장됨.
						$("#listReply").html(result);
					}
				});
	}

	// 댓글 수정화면 생성 함수
	function showReplyModify(adr_num) {
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/reply/detail/" + adr_num,
			success : function(result) {
				$("#modifyReply").html(result);
				// 태그.css("속성", "값")
				$("#modifyReply").css("visibility", "visible");
			}
		})
	}
</script>


<style>
#modifyReply {
	/* width: 600px;
	height: 130px; */
	background-color: pink;
	padding: 10px;
	z-index: 10;
	visibility: hidden;
}
/* 넒이설정 */
.textarea_size{
 width:90%;
}
/* 최소 높이값설정 */
textarea.textarea_size{ min-height: 50px; }
</style>

</head>
<body>
	<!-- 게시물 상세보기 영역 -->
	<input type="hidden" value="${dto.ad_num}">
	<div class="col-35">
		<div class="card">
			<div class="card-header" style="background-color: #FEBABA;">
				게시물 읽기</div>
			<div class="card-body">
				<form name="form1" id="form1" method="post">
					<c:choose>
						<c:when test="${m_id == dto.m_id}">
							<div class="form-group" align="center">
								<div align="center">
									<h5 align="center">
										<span style="color: #FE9191"><i
											class="fab fa-pagelines"></i></span><i class="fab fa-pagelines"></i>
										<span style="color: #FE9191"><i
											class="fab fa-pagelines"></i></span> <input name="ad_title"
											id="ad_title" value="${dto.ad_title}"
											placeholder="제목을 입력해주세요"
											style="border-color: #FE9191; border-radius: 0.5em; align-content: center;"
											size="18px"> <i class="fab fa-pagelines"></i><span
											style="color: #FE9191"><i class="fab fa-pagelines"></i></span><i
											class="fab fa-pagelines"></i>
									</h5>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group" align="center">
								<div align="center">
									<h5 align="center">
										<span style="color: #FE9191"><i
											class="fab fa-pagelines"></i></span><i class="fab fa-pagelines"></i>
										<span style="color: #FE9191"><i
											class="fab fa-pagelines"></i></span> ${dto.ad_title} <i
											class="fab fa-pagelines"></i><span style="color: #FE9191"><i
											class="fab fa-pagelines"></i></span><i class="fab fa-pagelines"></i>
									</h5>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
					<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
					<div class="form-group">
						&nbsp;&nbsp;<i class="fas fa-map-marker-alt"></i> ${dto.ad_city}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<i class="far fa-clock"></i>
						<fmt:formatDate value="${dto.ad_date}" pattern="yyyy-MM-dd" />
					</div>
					<!-- 
					<div class="form-group" align="center">
						<label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;"> 작성자</label>&nbsp;&nbsp; &nbsp; 

					</div> -->


					<c:choose>
						<c:when test="${m_id == dto.m_id}">
							<div class="boxA">
								<div class="box1">
									<label style="background-color: #FE9191; color: white; border-radius: 10px; width: 100px; text-align: center;">동호회소개</label>&nbsp;&nbsp;
									<textarea class="textarea_size" onkeydown="resize(this)"
										onkeyup="resize(this)" name="ad_content"
										style="width: 100%; border-color:#FE9191;  " id="ad_content"
										placeholder="내용을 입력해주세요">${dto.ad_content}</textarea>
								</div>
							</div>
							<div class="form-group" align="center">
								<!-- 게시물번호를 hidden으로 처리 -->
								<input type="hidden" name="ad_num" value="${dto.ad_num}">
								<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
								<button type="button" class="btn" id="btnUpdete" style="background-color: #FE9191; color: white;">수정</button>
								<button type="button" class="btn " id="btnDelete" style="background-color: #FE9191; color: white;">삭제</button>
								<!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
								<button type="button" class="btn " id="btnList"
									style="background-color: #FE9191; color: white;">목록</button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group">
									<label style="background-color: #FE9191; color: white; border-radius: 10px; width: 100px; text-align: center;">동호회 소개</label> 
								<div >
									<br>${dto.ad_content}
								</div>
							</div>

							<div class="form-group" align="center">
								<div>
									<img style="padding-bottom: 5px;" width="40px" height="40px"
										src="${pageContext.request.contextPath }/resources/images/Characters/${dto.m_image_cd}.gif">
								</div>
								${dto.m_nick}
								<!-- 게시물번호를 hidden으로 처리 -->
								<input type="hidden" name="ad_num" value="${dto.ad_num}">
								<!-- <button type="button" class="btn " id="btnList"
									style="background-color: #FE9191; color: white;">목록</button>
 -->
							</div>
						</c:otherwise>
					</c:choose>
			</div>
		</div>

	</div>
	<!-- 게시물 상세보기 영역 -->
	<br>
	<table>
		<tr>
			<td>&nbsp; <textarea rows="3" cols="36" id="adr_content"
					placeholder="댓글을 작성해주세요" style="border-color: #FE9191"></textarea></td>
			<td>&nbsp;
				<button type="button" class="btn " id="btnReply"
					style="background-color: #FE9191; color: white;">
					댓글<br> 작성
				</button> <br> <!-- 비밀댓글 체크박스 --> &nbsp; <input type="checkbox"
				id="adr_hidden" style="border: 2px solid #FE9191;">비밀<span
				style="color: #FE9191"><i class="fas fa-lock"></i></span>
			</td>
		</tr>
	</table>
	<!-- 댓글 목록 영역 -->
	<div id="listReply"></div>
	<!-- 댓글 목록 영역 -->

</body>

</html>