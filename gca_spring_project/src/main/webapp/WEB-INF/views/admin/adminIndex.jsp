<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>

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
			
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-folder"></i> <span> 회원 관리 </span>
				</a>
				<!-- 여기는 일단 그냥 달아놨음 
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="#"> 회원 목록 </a>
					<a class="dropdown-item" href="#"> 신고 관리 </a>
				</div>
				 -->
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
				<a class="nav-link dropdown-toggle" href="#" id="pagesDropdown"	role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-folder"></i> <span> 통계 관리 </span>
				</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="#"> 매출 </a>
					<a class="dropdown-item" href="#"> 통계 </a>
				</div>	
			</li>
		</ul>
		
		<!-- 각 메뉴마다 안에 들어가는 내용 부분 -->
		<div id="content-wrapper">
			<div class="container-fluid">
				<!-- /.container-fluid -->
			</div>
		</div>
		
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
