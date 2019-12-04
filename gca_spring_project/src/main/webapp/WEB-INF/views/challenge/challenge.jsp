<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>challenge.jsp</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 모달 링크용 modal -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script>
    $(function() {
    	
/*     	//챌린지 남은일자 계산
		var today = new Date(); //오늘일자
    	
		//마감날짜
		var endDateInput = $("[name=end_date]");
		for(i = 0; i < endDateInput.length; i++ ){
			var dataSplit = endDateInput[i].value.split('-');

			var year = dataSplit[0];
			var month = dataSplit[1] - 1; // 달은 -1 해야 정상적으로 출력
			var day = dataSplit[2];
			
			var endDate = new Date(year, month, day);
			
			var gap = endDate.getTime() - today.getTime();
			gap = Math.floor(gap / (1000 * 60 * 60 * 24 ))+1; //d-day 계산; 당일은 0
			
			if (gap == 0 ) {
				$("input[name=gapInput]").eq(i).val("(D-Day!!)");      
			} else {
				$("input[name=gapInput]").eq(i).val("(D-"+gap +")");
			}
			
		} */
		
	});
    
    </script>
    
    <style>
      .btn-primary {
      	color: white;
      	background-color: #FE9191;
      	border: none;
      }
      
      .nav-link.active {
     	 background: #FE9191;
     	 color: white;
      }
      .nav-link {
      	border-radius: 3px;
      	color: black;
      	font-size: 22px;
      	font-weight: bold;
      }
      .nav span {
      	display: block;
      	font-size: 14px;
      	border-radius: 3px;
      }
      .tab-pane {
      	margin-top: 5px;
      }
      
      .content-div {
      	background: #FAF0F0;
      	border-radius: 3px;
      	padding: 20px;
      	color: black;
      	margin-top: 10px;
      	margin-bottom: 10px;
      }
      
      span {
      	display: block;
      }
      
      .join-btn {
      	background: #FE9191;
      	width: 100%;
      	border: none;
      	border-radius: 3px;
      	height: 40px;
      	font-size: 20px;
      	font-weight: bold;
      	color: white;
      }
      
      .join-btn.start-challenge {
      	background: none;
      	color: #FE9191;
      	font-size: 35px;
      }
      
      input {
      	border: none;
      	background: none;
      	width: 90px;
      }
      .gapInput {
      }
      
    </style>
  </head>
  
  <body>
    <div class="container">
      <div style="text-align:center;"><h2><b>챌린지 목록</b></h2></div>
      <div class="row">
        <div class="col">
        	<!-- 상단 nav-tabs 시작 -->
            <ul class="nav nav-fills">
              <!-- 기본 챌린지 -->
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#basicChallenges">기본 챌린지<br><span>Basic Challenges</span></a>
              </li>
              <!-- 스페셜 챌린지 -->
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#specialChallenges">스페셜 챌린지<br><span>Special Challenges</span></a>
              </li>
            </ul>
            <!-- 상단 nav-tabs 끝 -->
            
            <div class="tab-content">
              <!-- 기본 챌린지 내용 div 시작 -->
              <div class="tab-pane fade show active" id="basicChallenges">
              	
              	<c:forEach items="${challengeList}" var="list">
	              	<c:if test="${list.cl_status == 'basic' }"> 
	              	<div class="content-div">
	              		<img src="${pageContext.request.contextPath }/resources/images/sports/${list.sports1_cd }.jpg" width="100%" height="200px">
	              		<span><fmt:formatDate value="${list.cl_start_dttm }" type="date" /> ~
						<fmt:formatDate value="${list.cl_end_dttm }" type="date" />　　　(D-${list.gap_day })</span>
						<span>${list.cl_name }</span>
						<span>기간안에 ${list.cl_cnt }회 참여</span>
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px">
							${list.cl_score }점
						</span>
	              	</div>
	              	</c:if>
              	</c:forEach>
              </div>
              
              
              <!-- 기본 챌린지 내용 div 끝 -->    
              
              <!-- 스페셜 챌린지 내용 div 시작 -->
               <div class="tab-pane fade" id="specialChallenges">
              	<c:forEach items="${challengeList}" var="list">
              		<c:if test="${list.cl_status != 'basic' }"> 
	              	<div class="content-div">
	              		<img src="${pageContext.request.contextPath }/resources/images/sports/${list.sports1_cd }.jpg" width="100%" height="200px">
	              		<span><fmt:formatDate value="${list.cl_start_dttm }" type="date" /> ~
						<fmt:formatDate value="${list.cl_end_dttm }" type="date" />　　　(D-${list.gap_day })</span>
						<span>${list.cl_name }</span>
						<span>기간안에 ${list.cl_cnt }회 참여</span>
						<span> 
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px">
							${list.cl_score }점
						</span>
						<span>
							<img src="${pageContext.request.contextPath }/resources/images/icon/money.png" width="25px">
							1천원~5천원
						</span>
						
<!-- 						<div class="page"> -->
<!-- 							<button type="button" class="join-btn" name="special-btn">참가</button> -->
<!-- 						</div> -->
	              	</div>
	              	</c:if>
              	</c:forEach>
              </div>
              <!-- 스페셜 챌린지 내용 div 끝 -->
            </div>
        </div>
		

		<!-- 기본챌린지용 모달 -->
		<div class="modal fade" id="basicModal" role="dialog">
			<div class="modal-dialog">
		
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">자전거관련 반짝 3번 참여하기</h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<p>기본챌린지에 참여하시겠습니까?</p>
						<p>참가시 취소가 되지 않습니다</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-dismiss="modal" id="basic-join-add">Join</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">Close</button>
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
						<h4 class="modal-title">크리스마스에 홈트레이닝하기</h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<p>스페셜챌린지에 참여하시겠습니까?</p>
						<p>참가시 소정의 보증금이 필요하며 결제후 취소가 되지 않습니다</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-dismiss="modal" id="special-join-add">Join</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 스페셜챌린지-결제용 모달 -->
		<div class="modal fade" id="payModal" role="dialog">
			<div class="modal-dialog">
		
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">* 스페셜 챌린지 참가규칙 *</h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<p>챌린지 100% 성공시 보증금 100% 페이백 및 점수 획득!</p>
						<p>챌린지 80% 이상 성공시 100% 페이백</p>
						<p>챌린지 80% 미만 80% 페이백</p>
						<b>결제금액</b><br> 
						<input type="radio" name="costGroup">1,000원
						<input type="radio" name="costGroup">2,000원 <input
							type="radio" name="costGroup" checked="checked">3,000원
						<input type="radio" name="costGroup">4,000원 <input
							type="radio" name="costGroup">5,000원
						<hr>
						<b>결제유형</b><br> <input type="radio" name="payGroup"
							checked="checked">네이버페이 <input type="radio"
							name="payGroup">카카오페이 <input type="radio"
							name="payGroup">이니시스
					</div>
		
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-dismiss="modal" id="paynow">결제완료</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">결제취소</button>
					</div>
				</div>
			</div>
		</div> 
			 
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  		<!-- 참가버튼 클릭시 모달뜨게함 -->
	<script src="${pageContext.request.contextPath }/resources/js/surim/challenge.js"></script>
  	
  </body>
</html>