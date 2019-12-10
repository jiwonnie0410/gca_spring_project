<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>운동하자 관리자 페이지</title>
<!--json할때 필요  -->
<script src="${pageContext.request.contextPath }/resources/js/json.min.js"></script>


<script type="text/javascript" >
	$(function(){
		userList();

		userSelect();
		
		userDelete();
	});
	
	
	//사용자 삭제 요청
	function userDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var m_id = $(this).closest('tr').find('#hidden_m_id').val();
			var result = confirm(m_id +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'members/'+m_id,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						userList();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	
	//사용자 조회 요청
	function userSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var m_id = $(this).closest('tr').find('#hidden_m_id').val();
			//특정 사용자 조회
			window.open('${pageContext.request.contextPath }/member/admin_member_view.do?m_id='+m_id , '회원싱세보기' , 'width=500,height=500, menubar=no, status=no, toolbar=no'); 
		}); //조회 버튼 클릭
	}//userSelect
		
	
	//사용자 목록 조회 요청
	function userList() {
		$.ajax({
			url:'members',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:userListResult
		});
	}//userList
	
	
	
	//사용자 목록 조회 응답
	function userListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.m_id))
			.append($('<td>').html(item.m_name))
			.append($('<td>').html(item.m_password))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_m_id\'>').val(item.m_id))
			.appendTo('tbody');
		});//each
	}//userListResult
</script>
</head>

<body id="page-top">


		<!------------------------------------------------------------------------------------------------------------  -->
		<div id="content-wrapper">
			<div class="container-fluid">
				<h1 align="center">회원관리</h1>
				<section class="userlist">
					<div class="card mb-3">
						<div class="card-header" style="background-color: #FEBABA;">회원관리</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table text-center">
									<thead>
										<tr>
											<th class="text-center">아이디</th>
											<th class="text-center">이름</th>
											<th class="text-center">성별</th>
											<th class="text-center">거주지</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
				</section>
				<br>
<!-- -------------------------------------------------------------------------------------------------------------------- -->
				<!-- 처리 상태 선택 -->
				<div>
					<div align="right">
						<button type="button" class="btn button"
							style="border: 1.5px solid #FEBABA;">전체</button>
						<button type="button" class="btn button"
							style="border: 1.5px solid #FEBABA;">처리 중</button>
						<button type="button" class="btn button"
							style="border: 1.5px solid #FEBABA;">처리 완료</button>
						&nbsp;&nbsp;
					</div>

				</div>
				<section class="list">
					<!-- DataTables Example -->
					<div class="card mb-3">
						<div class="card-header" style="background-color: #FEBABA;">신고관리</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>신고자 회원 아이디</th>
											<th>피신고자 회원이름</th>
											<th>사유</th>
											<th>신고당한 횟수</th>
											<th>상세보기</th>
											<!-- <th>ㅅ</th>
										<th>Salary</th> -->
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>신고자 회원 아이디</th>
											<th>피신고자 회원아이디</th>
											<th>사유</th>
											<th>신고당한 횟수</th>
											<th>상세보기</th>
											<!-- <th>Start date</th>
										<th>Salary</th> -->
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<td>Tiger Nixon<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>System Architect<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>지각함</td>
											<td>61</td>
											<td><button type="button"
													class="btn btn-primary px-3 py-2" data-toggle="modal"
													data-target="#myModal"
													style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">보기</button></td>
										</tr>
										<tr>
											<td>Garrett Winters<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>Accountant<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>변태</td>
											<td>63</td>
											<td><button type="button"
													class="btn btn-primary px-3 py-2" data-toggle="modal"
													data-target="#myModal"
													style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">보기</button></td>
										</tr>
										<tr>
											<td>Ashton Cox<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>Junior Technical Author<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>술마시자고함</td>
											<td>66</td>
											<td><button type="button"
													class="btn btn-primary px-3 py-2" data-toggle="modal"
													data-target="#myModal"
													style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">보기</button></td>
										</tr>
										<tr>
											<td>Cedric Kelly<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>Senior Javascript Developer<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>Edinburgh</td>
											<td>22</td>
											<td><button type="button"
													class="btn btn-primary px-3 py-2" data-toggle="modal"
													data-target="#myModal"
													style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">보기</button></td>
										</tr>
										<tr>
											<td>Airi Satou<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>Accountant<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>Tokyo</td>
											<td>33</td>
											<td><button type="button"
													class="btn btn-primary px-3 py-2" data-toggle="modal"
													data-target="#myModal"
													style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">보기</button></td>
										</tr>
										<tr>
											<td>Brielle Williamson<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>Integration Specialist<a
												onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger
													Nixon</a></td>
											<td>New York</td>
											<td>61</td>
											<td><button type="button"
													class="btn btn-primary px-3 py-2" data-toggle="modal"
													data-target="#myModal"
													style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">보기</button></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title">신고사유</h4>
					<button type="button" class="close" data-dismiss="modal"
						style="background-color: red; border: 1.5px solid red;">&times;</button>
				</div>

				<div class="modal-body">
					<div class="modal-content">
						<label>신고자 회원 아이디:</label> <label>피신고자 회원 아이디:</label> <label>신고
							사유</label>
						<textarea rows="10" class="form-control" readonly="readonly"
							id="content"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">Close</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="background-color: #FEBABA; border: 1.5px solid #FEBABA;">처리</button>
				</div>
			</div>

		</div>
	</div>





	
</body>

</html>
