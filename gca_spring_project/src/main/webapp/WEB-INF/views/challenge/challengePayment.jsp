<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>challengePayment</title>

<!-- 로그인한사람의 id,닉네임,캐릭터코드 저장 -->
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.m_nick" var="nick"/>
<sec:authentication property="principal.m_image_cd" var="image"/>

<!-- jquery js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- json-serializeObject js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
	

<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/surim/challengePayment.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/addOption.css">


<!-- 부트페이 연동 -->
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>

<script>
  
$(function() {
	payGoGo(); // 1. 결제버튼 클릭시 결제창 띄움, 결제완료시 DB에 결제정보, 챌린지 참여정보 입력
	
});

// 1. 결제버튼 클릭시 결제창 띄움, 결제완료시 DB에 결제정보, 챌린지 참여정보 입력 
function payGoGo() {
	$("#payBtn").on("click", function(){
		var challengeName = "${challenge.cl_name}";  		//챌린지이름
		var payPrice = $('#checkRange').text()+"000"; 		//사용자가 정한 보증금
		payPrice *= 1; //형변환용
		
		BootPay.request({
			price: payPrice, //실제 결제되는 가격
			application_id: "5de9c9d85ade160030cc4a87", //부트페이 사용자고유키 - 수림문의
			name: "${challenge.cl_name}", //결제창에서 보여질 이름
			pg: '',  
			method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			items: [  
				{
					item_name: '나는 아이템', //상품명
					qty: 1, //수량
					unique: '${challenge.cl_num}', //해당 상품을 구분짓는 primary key
					price: payPrice, //상품 단가
					cat1: '${challenge.cl_status}', // 대표 상품의 카테고리 상, 50글자 이내
//					cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
//					cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
				}
			],
			user_info: {
				username: '${id}',
				email: 'email@naver.com',
				addr: '사용자 주소',
				phone: '010-1234-4567'
			},
			order_id: 'order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
// 			account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
// 			extra: {
// 			    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
// 				end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
// 		        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
// 		        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
// 			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			//console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function (data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			//console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    //console.log(data);
			
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			
			
// 				for(var i in data) {
// 				console.log("attr: " + i + ", value: " + data[i]);
// 				$("#money_moid").val(data[2]);
// 				$('#money_moid').val(2);
			}
			
			// 아작스 시작; ChallengeHist 테이블에 참가이력 추가
	    	var historyParam = JSON.stringify($("#historyForm").serializeObject());; //디비에 넣을값; 해당 챌린지정보
	    	$.ajax({
	    		url: "ajax/insertChallenge.json",
	    		method: "post",
	    		dataType: "json",
	    		data: historyParam,
	    		contentType: "application/json"
	    	});
	    	
	    	var moneyParam = JSON.stringify($("#moneyForm").serializeObject());; //디비에 넣을값; 해당 챌린지정보
	    	$.ajax({
	    		url: "ajax/insertMoney.json",
	    		method: "post",
	    		dataType: "json",
	    		data: moneyParam,
	    		contentType: "application/json"
	    	});
	    				
			
			//alert("결제완료! 챌린지 목록으로 이동합니다");
			//location.href="list";
		});
		
	});
}


</script>

<style>
	#payValue {
		text-align: center;
		font-weight: bold;
		font-size: 20px;
	}
	#payBtn {
		background: #FE9191;
		border: none;
		border-radius: 3px;
		font-size: 22px;
		font-weight: bold;
		width: 100%;
		height: 40px;
	}
	
	#payRule .card-header {
		margin-bottom: 0px;
	}

	
</style>
</head>
<body>
	<!-- 뒤로가기 버튼 -->
	<div class="back-div">  
		<input type="button" class="back-btn" id="back-btn">
		<h3 style="font-weight: bold">챌린지 결제</h3>
	</div>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="content-div">
					<!-- 챌린지 기본옵션 시작 -->
					<span class="pinkText"><fmt:formatDate   
							value="${challenge.cl_start_dttm }" type="date" /> ~ <fmt:formatDate
							value="${challenge.cl_end_dttm }" type="date" />
						(D-${challenge.gap_day })</span>
					<span class="mediumText">${challenge.cl_name }</span> 
					<span class="mediumText">기간내 | ${challenge.cl_cnt }회 참여</span> 
					<span class="mediumText"> 
						<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px"> ${challenge.cl_score }점
					</span>
					<!-- 챌린지 기본옵션 끝 -->
					<!-- 결제폼 시작 -->
					<div id="payment-div" class="payment-div">
						<!-- 보증금 버튼 -->
						<div>
							<table class="rangeTable" style="width: 100%">   
								<thead>
									<tr>
										<td><span class="mediumText">
												<img src="${pageContext.request.contextPath }/resources/images/icon/money.png" width="25px">보증금 선택
											</span>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="slidecontainer">
											  <input type="range" min="1" max="5" value="3" class="rangeSlider" id="myRange">
											</div>
										 </td>
										 <td id="payValue">
											<p id="checkRange" style="display: inline" ></p>천원
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 보증금 범위 -->
					</div>
					<!-- 결제 약관 -->
					<div class="accordion" id="payRule">
					<br>
					  <div class="card">
					    <div class="card-header" id="heading">
					      <h2 class="mb-0">
					        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse" aria-expanded="false" aria-controls="collapse">
					          <span class="smallText">스페셜 챌린지 이용약관에 동의하며, 표기된 금액을 결제하는데 동의합니다</span>
					        </button>
					      </h2>
					    </div>
					    <div id="collapse" class="collapse" aria-labelledby="heading" data-parent="#payRule">
					      <div class="card-body">
					      	<span class="pinkText">챌린지 시작 후, 취소 불가</span>
					      	<span class="smallText">챌린지는 여러 회원님들이 함께하는 대회인만큼, 챌린지 시작 후에는 환불이 불가능합니다</span>
					      	<span class="pinkText">챌린지 100% 달성시</span> 
					      	<span class="smallText">보증금 전액 환급, 기준 포인트 100% 지급</span>
					      	<span class="pinkText">챌린지 80% 달성시</span>
					      	<span class="smallText">보증금 전액 환급, 기준 포인트 80% 지급 </span>
					      </div>
					    </div>
					  </div>
					</div>
					
					<!-- 결제폼 끝 -->
				</div>
			</div>
		</div>
		
		<form id="historyForm">
			<input name="cl_num" type="hidden" value="${challenge.cl_num }">
			<input name="m_id" type="hidden" value=${id }>
		</form>
		
		<form id="moneyForm">
			<input name="cl_num" type="hidden" value="${challenge.cl_num }">
			<input name="m_id" type="hidden" value=${id }>
			<input name="money_deposit" type="hidden" id="money_deposit">
			<input name="money_moid" id="money_moid">
		</form>
	<!-- 결제버튼, 금액 주입은 addOption JS 참조 -->
	<button id="payBtn" class="pay-btn"><p id="paynow"></p></button>
	</div>
</body>
</html>