<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<!-- 부트스트랩용 링크 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/ionicons.min.css"> 
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/flaticon.css"> 
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/icomoon.css">
	
<!-- 개인설정 -->	
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/surim/joinButton.css"> 
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/surim/challengeStyle.css">

</head>



<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<section style="background-color: #FE919;">
		<!-- 챌린지 카드 시작 -->
		<div class="container">
			<div style="text-align:center;"><h2><b>챌린지 목록</b></h2></div>
			<div class="ftco-schedule">
				<div class="row">
					<div class="col-md-4 nav-link-wrap">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<!-- 기본 챌린지 -->
							<a class="nav-link ftco-animate active" id="v-pills-8-tab"
								data-toggle="pill" href="#v-pills-8" role="tab"
								aria-controls="v-pills-8" aria-selected="true">기본 챌린지 <span>Basic
									Challenges</span></a>
							<!-- 스페셜 챌린지 -->
							<a class="nav-link ftco-animate" id="v-pills-9-tab"
								data-toggle="pill" href="#v-pills-9" role="tab"
								aria-controls="v-pills-9" aria-selected="false">스페셜 챌린지 <span>Special
									Challenges</span></a>
						</div>
					</div>

					<!-- 기본 챌린지 -->
					<div class="col-md-8 tab-wrap">
						<div class="tab-content" id="v-pills-tabContent">
							<div class="tab-pane fade show active" id="v-pills-8"
								role="tabpanel" aria-labelledby="day-8-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
								   <img src="${pageContext.request.contextPath }/images/cycling1.jpg" width="100%" height="50">
									<div class="text pl-md-5">
										<h6>12월 15일(일) ~ 23일(토) 총7일</h6>
										<h6>자전거관련 반짝 3번 참여하기</h6>
										<h6>점수: 100점</h6>
										<h6>마감까지 nn일</h6>
										<div class="page">
											<button type="button" class="join-btn" id="basic-join">참가</button>
										</div>
									</div>
								</div>
							</div>

							<!-- 스페셜 챌린지 -->
							<div class="tab-pane fade" id="v-pills-9" role="tabpanel"
								aria-labelledby="v-pills-day-9-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<img src="${pageContext.request.contextPath }/images/image_2.jpg" width="100%" height="50">
									<div class="text pl-md-5">
										<h6>12월 25일(수)</h6>
											<h6>크리스마스에 홈트레이닝하기</h6>
										<h6>점수: 300점</h6>
										<h6>보증금: 1천원-5천원 (1천원단위)</h6>
										<h6>마감까지 nn일</h6>
										<div class="page">
											<button type="button" class="join-btn" id="special-join">참가</button>
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
				</div>
			</div>
		</div>
	</section>

	<!-- loader -->
	<script
		src="${pageContext.request.contextPath }/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/aos.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/scrollax.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/js/main.js"></script>

	<!-- 참가버튼 클릭시 모달뜨게함 -->
	<script src="${pageContext.request.contextPath }/js/surim/challenge.js"></script>


</body>
</html>