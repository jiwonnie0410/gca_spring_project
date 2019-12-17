<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		
		<title> 운동하자 관리자 페이지 </title>
		
		<!-- Custom fonts for this template-->
		<link href="${pageContext.request.contextPath }/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"	type="text/css">
		<!-- Page level plugin CSS-->
		<link href="${pageContext.request.contextPath }/resources/css/admin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
		<!-- Custom styles for this template-->
		<link href="${pageContext.request.contextPath }/resources/css/admin/sb-admin.css" rel="stylesheet">
		<!-- Bootstrap core JavaScript-->
		<script src="${pageContext.request.contextPath }/resources/css/admin/vendor/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/resources/css/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="${pageContext.request.contextPath }/resources/css/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Page level plugin JavaScript-->
		<%-- <script src="${pageContext.request.contextPath }/resources/css/admin/vendor/chart.js/Chart.min.js"></script> --%>
		<script src="${pageContext.request.contextPath }/resources/css/admin/vendor/datatables/jquery.dataTables.js"></script>
		<script src="${pageContext.request.contextPath }/resources/css/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="${pageContext.request.contextPath }/resources/js/admin/sb-admin.min.js"></script>
		<!-- Demo scripts for this page-->
		<script src="${pageContext.request.contextPath }/resources/js/admin/demo/datatables-demo.js"></script>
		<%-- <script src="${pageContext.request.contextPath }/resources/js/admin/demo/chart-area-demo.js"></script> --%>
		<!-- Popper JS -->
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

		<script src="${pageContext.request.contextPath }/resources/scripts/json.min.js"></script>
		
		<style>
    			.button-title:hover {
					  background-color: #A6A6A6;
					  border: 2px solid #747474;
					  border-radius: 7px;
					  color: white;
				}
				
				.button-title {
					  background: #fff;
					  border: 2px solid #747474;
					  border-radius: 7px;
					  color: #747474;
					  font-size: 12px;
					  margin: 0.3em auto;
					  padding: 2px 4px;
					  position: relative;
					  text-transform: uppercase;
					  height: 30px;
					  width: 120px;
				}
				
				.button-general:hover {
					  background-color: #FEBABA;
					  border: 2px solid #FE9191;
					  border-radius: 7px;
					  color: white;
				}
				
				.button-general {
					  background: #FE9191;
					  border: 3px solid #fff;
					  border-radius: 7px;
					  color: white;
					  font-size: 15px;
					  font-weight: bold;
					  padding: 2px 4px;
					  position: relative;
					  text-transform: uppercase;
					  height: 45px;
					  width: 245px;
				}
    	</style>
</head>
<body>

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
	<div id="wrapper">
		<ul class="sidebar navbar-nav">
			<li class="nav-item active" ><a class="nav-link">
				<i class="fas fa-fw fa-tachometer-alt"></i><span>&nbsp; MENU </span></a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="../admin/getUserList">
					<i class="fas fa-fw fa-folder"></i> <span> 회원 관리 </span>
				</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="../admin/admin_qnaboard">
					<i class="fas fa-fw fa-folder"></i> <span> 게시판 관리 </span>
				</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="../admin/challenge">
					<i class="fas fa-fw fa-folder"></i> <span> 챌린지 관리 </span>
				</a>
			</li>
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="../admin/chart" id="pagesDropdown"	role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-folder"></i> <span> 통계 관리 </span>
				</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="income"> 매출 </a>
					<a class="dropdown-item" href="chart"> 통계 </a>
				</div>	
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="../sgroup/getSgList">
					<i class="fas fa-fw fa-chart-area"></i> <span> 운동하자 바로가기 </span>
				</a>
			</li>
		</ul>
		
		<!-- 각 메뉴마다 안에 들어가는 내용 부분 -->
		<tiles:insertAttribute name="admin-content" />
	</div>
	<div>
	</div>

	<!-- FOOTER (스티키) -->
	<footer class="sticky-footer">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
            	<span>Copyright © 운동하자 TEAM Girls Can do Anything 2019</span>
          	</div>
        </div>
	</footer>
</body>

</html>
