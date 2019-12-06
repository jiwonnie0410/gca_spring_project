<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>challengeContents.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="./resources/scripts/json.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">

<script>
//아작스용
$(function(){
	insertChallenge(); //챌린지 참여시 디비에 이력남김
	
	function insertChallenge(){
		//기본 챌린지 참가버튼
	    $("#basic-btn").click(function(){
	    	if ( $(this).attr('class')!='join-btn start-challenge' ) {
	    		$("#basicModal").modal(); //모달 팡법
	    	}
	    });
		
	    $("#basic-join-add").click(function(){
	    	$("#basic-btn").toggleClass('start-challenge');
	
			  $("#basic-btn").hasClass('start-challenge') ?
				  $("#basic-btn").text('참가중') :
				  $("#basic-btn").text('참가');
	    });
	
	    //스페셜 챌린지 참가버튼
	    $("#special-btn").click(function(){
	    	if ( $(this).attr('class')!='join-btn start-challenge' ) {
	       		 $("#specialModal").modal();
	       		 console.log("모달출력"); //모달 팝업
	       }
	    });
	
	    $("#special-join-add").click(function(){
	    	$("#special-btn").toggleClass('start-challenge');
	
			$("#special-btn").hasClass('start-challenge') ?
				$("#special-btn").text('참가중') :
				$("#special-btn").text('참가');
				
	    });	
	};
	
});

</script>

</head>    
<body>
	<!-- 뒤로가기 버튼 -->
	<div class="back-div">  
		<input type="button" class="back-btn" id="back-btn">
		<h3 style="font-weight: bold">챌린지</h3>
	</div>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="content-div">
					<!-- 챌린지 기본옵션 시작 -->
					<img src="${pageContext.request.contextPath }/resources/images/sports/${challenge.sports1_cd }.jpg" width="100%" height="200px"> 
					<span><fmt:formatDate
							value="${challenge.cl_start_dttm }" type="date" /> ~ <fmt:formatDate
							value="${challenge.cl_end_dttm }" type="date" />
						(D-${challenge.gap_day })</span>
						
					<span>${challenge.cl_name }</span> 
					<span>기간내 | ${challenge.cl_cnt }회 참여</span> 
					<c:if test="${challenge.cl_status != 'basic' }">
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/icon/money.png" width="25px">1천원~5천원
					</span>
					<span> 
						<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px"> ${challenge.cl_score }점
					</span>
					</c:if>
					<!-- 챌린지 기본옵션 끝 -->
					<hr>
					<!-- 챌린지 세부설명 -->
					<span>${challenge.cl_content}</span>
					<hr>
					<!-- 보증금/포인트 설명 -->
					<c:if test="${challenge.cl_status != 'basic' }">
					<span>
						<img src="${pageContext.request.contextPath }/resources/images/icon/money.png" width="25px">
						보증금
						<br>스페셜 챌린지 참가시 보증금이 필요하며 챌린지 성공 퍼센트에 따라 환급비율이 달라집니다.
					</span>
					</c:if>
					<span style="padding-bottom: 50px">
						<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px">
						포인트 
						<br>획득시 회원등급 결정에 사용됩니다.
					</span>
					<!-- 보증금설명/포인트 설명 끝 -->
					
					<!-- 기본/스페셜챌린지버튼 시작 -->
					<c:choose>
						<c:when test="${challenge.cl_status == 'basic' }">
							<button class="join-btn" id="basic-btn">참가하기</button>
						</c:when>
						<c:otherwise>
							<button class="join-btn" id="special-btn">참가하기</button>
						</c:otherwise>
					</c:choose>
					<!-- 기본/스페셜챌린지버튼 끝 -->
				</div>
			</div>   
		</div>
	</div>
	
	<!-- 기본챌린지용 모달 -->
		<div class="modal fade" id="basicModal" role="dialog">
			<div class="modal-dialog">
		
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">${challenge.cl_name }</h5>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<span> 
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px"> ${challenge.cl_score }점
						</span>
						<p>기본챌린지에 참여하시겠습니까?</p>
						<p>참가시 취소가 되지 않습니다</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="pink-btn"
							data-dismiss="modal" id="basic-join-add">Join</button>
						<button type="button" class="white-btn" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 스페셜챌린지용 모달 -->
		<div class="modal fade" id="specialModal" role="dialog">
			<div class="modal-dialog">
		
				<!-- Modal content-->   
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">${challenge.cl_name }</h5>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<span>    
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px"> ${challenge.cl_score }점
						</span>
						<p>스페셜챌린지에 참여하시겠습니까?</p>
						<p>참가시 소정의 보증금이 필요하며 결제후 취소가 되지 않습니다</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="pink-btn"
							data-dismiss="modal" id="special-join-add"
							onclick="location.href='payment?num=${challenge.cl_num}'">Join</button>
						<button type="button" class="white-btn" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>