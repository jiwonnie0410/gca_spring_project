<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		
		<title> 운동하자 관리자 페이지 </title>
		
		<!-- Custom fonts for this template-->
		<link href="${pageContext.request.contextPath }/jsp/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"	type="text/css">
		<!-- Page level plugin CSS-->
		<link href="${pageContext.request.contextPath }/jsp/admin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
		<!-- Custom styles for this template-->
		<link href="${pageContext.request.contextPath }/jsp/admin/css/sb-admin.css" rel="stylesheet">
		<!-- Bootstrap core JavaScript-->
		<script src="${pageContext.request.contextPath }/jsp/admin/vendor/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/jsp/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="${pageContext.request.contextPath }/jsp/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Page level plugin JavaScript-->
		<script src="${pageContext.request.contextPath }/jsp/admin/vendor/chart.js/Chart.min.js"></script>
		<script src="${pageContext.request.contextPath }/jsp/admin/vendor/datatables/jquery.dataTables.js"></script>
		<script src="${pageContext.request.contextPath }/jsp/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="${pageContext.request.contextPath }/jsp/admin/js/sb-admin.min.js"></script>
		<!-- Demo scripts for this page-->
		<script src="${pageContext.request.contextPath }/jsp/admin/js/demo/datatables-demo.js"></script>
		<script src="${pageContext.request.contextPath }/jsp/admin/js/demo/chart-area-demo.js"></script>
		
		<!-- 데이터테이블 -->
		<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
</head>

<body id="page-top">
	<!-- 맨 위에 바 부분 -->
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
		<!-- 삼선 메뉴모양이랑 페이지 이름 -->
		<button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
			<i class="fas fa-bars" style="color:#FE9191;"></i>
		</button>
		<a class="navbar-brand mr-1" href="#"> 운동하자 관리자 </a>

		<!-- Navbar 맨 위에 검색하는 부분 -->
		<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="검색" aria-label="Search" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" style="background-color: #FE9191; border-color: #FE9191;"type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
	</nav>

	<!-- 메뉴 -->
	<div id="wrapper" >
		<ul class="sidebar navbar-nav">
			<li class="nav-item active" ><a class="nav-link">
				<i class="fas fa-fw fa-tachometer-alt"></i><span>&nbsp; MENU </span></a>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-folder"></i> <span> 회원 관리 </span>
				</a>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="pagesDropdown"	role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-folder"></i> <span> 게시판 관리 </span>
				</a>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="pagesDropdown"	role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-folder"></i> <span> 챌린지 관리 </span>
				</a>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="pagesDropdown"	role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
					<i class="fas fa-fw fa-folder"></i> <span> 통계 관리 </span>
			</li>
		</ul>
<div id="content-wrapper">
      <div class="container-fluid">
		<center> <h1>회원관리</h1></center>
			<section class="userlist">
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header" style="background-color:#FEBABA; ">회원관리</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>회원아이디</th>
										<th>회원이름</th>
										<th>회원닉네임</th>
										<th>나이</th>
										<!-- <th>Start date</th>
										<th>Salary</th> -->
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>회원아이디</th>
										<th>회원이름</th>
										<th>회원닉네임</th>
										<th>나이</th>
										<!-- <th>Salary</th> -->
									</tr>
								</tfoot>
								<tbody>
									<tr>
										<td ><a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>System Architect</td>
										<td>Edinburgh</td>
										<td>61</td>
									</tr>
									<tr>
										<td><a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a>Garrett Winters</td>
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>63</td>
									</tr>
									<tr>
										<td><a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a>Ashton Cox</td>
										<td>Junior Technical Author</td>
										<td>San Francisco</td>
										<td>66</td>
									</tr>
									<tr>
										<td><a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a>Cedric Kelly</td>
										<td>Senior Javascript Developer</td>
										<td>Edinburgh</td>
										<td>22</td>
									</tr>
									<tr>
										<td><a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a>Airi Satou</td>
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>33</td>
									</tr>
									<tr>
										<td><a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a>Brielle Williamson</td>
										<td>Integration Specialist</td>
										<td>New York</td>
										<td>61</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
	<br>
<!-- -------------------------------------------------------------------------------------------------------------------- -->
<!-- 처리 상태 선택 -->
<div >
	<div align="right">
			<button type="button" class="btn button" style="border: 1.5px solid #FEBABA;" >전체</button>
			<button type="button" class="btn button" style="border: 1.5px solid #FEBABA;">처리 중</button>
			<button type="button" class="btn button" style="border: 1.5px solid #FEBABA;">처리 완료</button>&nbsp;&nbsp;
	</div>
	
</div>
			<section class="list">
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header" style="background-color:#FEBABA;">회원관리</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
										<td>Tiger Nixon<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>System Architect<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>지각함</td>
										<td>61</td>
										<td><button type="button" class="btn btn-primary px-3 py-2" data-toggle="modal" data-target="#myModal" style="background-color:#FEBABA;border: 1.5px solid #FEBABA;">보기</button></td>
									</tr>
									<tr>
										<td>Garrett Winters<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>Accountant<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>변태</td>
										<td>63</td>
										<td><button type="button" class="btn btn-primary px-3 py-2"  data-toggle="modal" data-target="#myModal" style="background-color:#FEBABA;border: 1.5px solid #FEBABA;">보기</button></td>
									</tr>
									<tr>
										<td>Ashton Cox<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>Junior Technical Author<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>술마시자고함</td>
										<td>66</td>
										<td><button type="button"  class="btn btn-primary px-3 py-2" data-toggle="modal" data-target="#myModal" style="background-color:#FEBABA;border: 1.5px solid #FEBABA;">보기</button></td>
									</tr>
									<tr>
										<td>Cedric Kelly<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>Senior Javascript Developer<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>Edinburgh</td>
										<td>22</td>
										<td><button type="button" class="btn btn-primary px-3 py-2" data-toggle="modal" data-target="#myModal" style="background-color:#FEBABA;border: 1.5px solid #FEBABA;">보기</button></td>
									</tr>
									<tr>
										<td>Airi Satou<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>Accountant<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>Tokyo</td>
										<td>33</td>
										<td><button type="button"  class="btn btn-primary px-3 py-2" data-toggle="modal" data-target="#myModal" style="background-color:#FEBABA;border: 1.5px solid #FEBABA;">보기</button></td>
									</tr>
									<tr>
										<td>Brielle Williamson<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>Integration Specialist<a onClick="window.open('${pageContext.request.contextPath }/jsp/member/profile.jsp','회원싱세보기','width=500,height=500, menubar=no, status=no, toolbar=no');">Tiger Nixon</a></td>
										<td>New York</td>
										<td>61</td>
										<td><button type="button" class="btn btn-primary px-3 py-2" data-toggle="modal" data-target="#myModal" style="background-color:#FEBABA;border: 1.5px solid #FEBABA;">보기</button></td>
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
        
        <h4 class="modal-title" >신고사유 </h4>
        <button type="button" class="close" data-dismiss="modal" style="background-color:red;border: 1.5px solid red;" >&times;</button>
      </div>
  
        <div class="modal-body">
          <div class="modal-content">
          <label>신고자 회원 아이디:</label>  
          <label>피신고자 회원 아이디:</label>   
          <label>신고 사유</label>	
          <textarea rows="10" class="form-control" readonly="readonly" id="content"></textarea>	
        </div>
      </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:#FEBABA;border: 1.5px solid #FEBABA;">Close</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:#FEBABA;border: 1.5px solid #FEBABA;">처리</button>
      </div>
    </div>

  </div>
</div>




	
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="vendor/datatables/jquery.dataTables.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin.min.js"></script>
	
	<!-- Demo scripts for this page-->
	<script src="js/demo/datatables-demo.js"></script>

</body>

</html>
