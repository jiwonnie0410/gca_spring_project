<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		
</head>
<body>
<div id="content-wrapper">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" align="center" style="padding-top:30px;">
					<font size="4"><b> 현재 진행 중인 챌린지 목록 </b></font><br /><br /><br />
						<div align="right">
							<form role="form" id="searchfrm" name="searchfrm" action="admin_deliverListForm.do" method="post">
								<input type="hidden" name="p" value="1">
								<input type="hidden" name="status" value="${param.status }">
								<table>
									<tr><td><select id="selectKey" name="selectKey" class="btn btn-outline-warning btn-sm dropdown-toggle">
											<option	value="o_id" selected> 챌린지 이름 </option></select></td>
									<td width="300"><input type="text" id='keyword' name='keyword' class="form-control"></td>
									<td><button id='searchBtn' name='searchBtn' onclick='searchBtn' class="btn btn-outline-warning btn-sm">검색</button></td>
									</tr>
								</table><br />
							</form>
						</div>
							
					<table class="table">
						<tr id='tr' align="center" style="background-color:#FEBABA;">
							<th width="5%"> NO </th>
							<th width="10%"> 구분 </th>
							<th width="45%"> 챌린지 이름 </th>
							<th width="12%"> 시작 날짜 </th>
							<th width="12%"> 마감 날짜 </th>
							<th width="10%"> 참여인원 </th>
						</tr>
						<tr class="table-tr" data-toggle="modal" data-target="#challenge-going">
							<td align="center"> 1 </td>
							<td align="center"> 스페셜 </td>
							<td> 돈 내고 돈 먹기 </td>
							<td align="center"> 2019-11-13 </td>
							<td align="center"> 2019-12-02 </td>
							<td align="center"> 30명 </td>
					</table>
						
						<!-- 페이징 -->
						<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous" style="color:#FE9191;">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    	
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next" style="color:#FE9191;">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					<button class="button-general" data-toggle="modal" data-target="#challenge-create"> 챌린지 생성 </button>
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
					<form role="form" id="createChallengeForm" name="createChallengeForm" action="#" method="post">
						<table>
							<tr height="50">
								<th width="60"> 구분 </th>
								<td>
									<input type="checkbox" value="basic" name="checkbox1" onclick="oneCheckbox(this)" class="check-box"> 기본
									<input type="checkbox" value="special" name="checkbox1" onclick="oneCheckbox(this)" class="check-box"> 스페셜
								</td>
							</tr>
							<tr height="50">
								<th> 기간 </th>
								<td> 시작 <input type="date" id="startDate" name="startDate">
									  마감 <input type="date" id="endDate" name="endDate"></td>
							</tr>
							<tr height="50">
								<th> 점수 </th>
								<td><select id="selectScore" name="selectScore" class="btn btn-outline-secondary btn-sm dropdown-toggle">
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
						</table>
					</form>
<!-- ***************************************************************************************************************************************** -->
					</div>
				</div>
<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="button-general" onclick="createChallengeButton()"> 생성 </button>
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
				<div class="modal-body">
				
					엳다가 챌린지 현황을 보여 주세요

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