<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="paging" tagdir="/WEB-INF/tags" %> <!-- 페이징을 위한 라이브러리 -->
<!DOCTYPE html>
<html>
<head>
		<style>
				.check-box {
					display: inline-block;
					width: 20px;
					height: 20px;
					border: 2px solid #FE9191;
					background-color: white;
					cursor: pointer;
				}
				
				#newTr:hover {
					background-color: #FAF0F0;
					cursor: pointer
				}
				
				#endTr:hover {
					background-color: #EAEAEA;
					cursor: pointer
				}
		</style>
		
		<!-- 챌린지 자바스크립트 -->
		<script src="${pageContext.request.contextPath }/resources/js/admin/challenge_listjs.js"></script>
</head>
<body>
<div id="content-wrapper">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" align="center" style="padding-top:30px;">
					<font size="4"><b> 현재 진행 중인 챌린지 목록 </b></font><br /><br /><br />
						<div align="right">
							<!-- 검색폼 -->
							<form name="challengeSearchForm">
								<input type="hidden" name="page" value="1" />
								<table>
										<tr>
											<td><select id="searchCondition" name="searchCondition" class="btn btn-outline-warning btn-sm dropdown-toggle">
													<option value=""> 키워드 </option>
													<option value="title" <c:if test="${ChallengeSearchVO.searchCondition == 'title' }" >selected</c:if> > 제목 </option>
													<option value="content" <c:if test="${ChallengeSearchVO.searchCondition == 'content' }" >selected</c:if> > 내용 </option>
												</select></td>
											<td width="200"><input type="text" id="keyword" name="keyword" value="${ChallengeSearchVO.keyword }" class="form-control"></td>
											<td><button type="button" class="btn btn-outline-warning btn-sm" onclick="getChallengeList()">검색</button></td>
								</table>
							</form>
						</div><br />
						
					<table class="table" id="challenge-table">
							<!-- 챌린지 목록 들어오는 부분 -->
					</table>
							<!-- 페이징 -->
							<nav aria-label="Page navigation example">
							  <ul class="pagination justify-content-center" id="pageButton">
								    <li class="page-item">
								      <a class="page-link" href="javascript:getChallengeList()" aria-label="Previous" style="color:#FE9191;">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
											<!-- 페이지 번호 들어오는 곳 -->
								    <li class="page-item">
								      <a class="page-link" href="javascript:getChallengeList()" aria-label="Next" style="color:#FE9191;">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
							  </ul>
							</nav>
							
					<button class="button-general" data-toggle="modal" data-target="#challenge-create"> 챌린지 생성 </button><p>
			</div>
			<div class="col-md-2"></div>
	</div>

	</div>
	
	
<!-- 챌린지 생성 모달 시작 -->
	<div class="modal fade" id="challenge-create">
		<div class="modal-dialog">
			<div class="modal-content">
      
<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><b> 챌린지 생성 </b></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
        
<!-- Modal body -->
				<div class="modal-body">
					<div>
<!-- ***************************************************************************************************************************************** -->
					<form role="form" id="createChallengeForm" name="createChallengeForm" action="../ajax/createChallenge" method="post">
						<input type="hidden" id="cl_name" name="cl_name">
						<table>
							<tr height="50">
								<th width="60"> 구분 </th>
								<td>
									<input type="checkbox" value="basic" name="cl_status" onclick="oneCheckbox(this)" class="check-box"> 기본
									<input type="checkbox" value="special" name="cl_status" onclick="oneCheckbox(this)" class="check-box"> 스페셜
								</td>
							</tr>
							<tr height="50">
								<th> 기간 </th>
								<td> 시작 <input type="date" id="startDate" name="cl_start_dttm">
									  마감 <input type="date" id="endDate" name="cl_end_dttm"></td>
							</tr>
							<tr height="50">
								<th> 점수 </th>
								<td><select id="selectScore" name="cl_score" class="btn btn-outline-secondary btn-sm dropdown-toggle">
										<option	selected> 점수 선택 </option>
										<option	value="300"> 300 </option>
										<option	value="500"> 500 </option>
										<option	value="700"> 700 </option>
										<option	value="1000"> 1000 </option>
									</select>
								</td>
							</tr>
							<tr height="50">
								<th> 타입 </th>
								<td><select id ="challengeType" class="btn btn-outline-secondary btn-sm dropdown-toggle">
										<option	value="nothing" selected> 타입 선택 </option>
										<option	value="nTime"> 반짝 n번 참여 </option>
										<option	value="nKinds"> 반짝 n가지 종목 참여 </option>
										<option	value="mKind_nTime"> ㅁㅁ 종목 반짝 n번 참여 </option>
									</select>
								</td>
							</tr>
							<tr height="50">
								<th></th>
								<td id="addType"></td>
							</tr>
							<tr height="50">
								<th> 내용 </th>
								<td> <textarea cols="50" rows="3" id="challengeContent" name="cl_content"></textarea></td>
							</tr>
						</table>
					</form>
<!-- ***************************************************************************************************************************************** -->
					</div>
				</div>
<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="button-general" style="width:500px;" onclick="createChallengeButton()"> 생성 </button>
				</div>
        
			</div>
		</div>
	</div>
<!-- 모달 끝 -->

<!-- 챌린지 현황 보여주는 모달 시작 -->
	<div class="modal fade" id="challenge-going">
		<div class="modal-dialog">
			<div class="modal-content">
      
<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><b> 챌린지 진행 현황 </b></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
        
<!-- Modal body -->
				<div class="modal-body" align="center">
					<table id="chGoing">
							<!-- 챌린지 상세 내용이 보여질 부분 -->
					</table><br /><br />
					
					<table id="chPeople">
							<!-- 챌린지 참여 중인 사람들이 보여질 부분 -->
					</table>
				</div> 
<!-- Modal footer -->
				<div class="modal-footer">
					
				</div>
        
			</div>
		</div>
	</div>
<!-- 모달 끝 -->

</body>
</html>