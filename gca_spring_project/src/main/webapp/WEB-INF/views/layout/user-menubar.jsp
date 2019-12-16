<<<<<<< HEAD
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
<title> 웹앱 메뉴바 </title>
	<style>
		.navbar {
		  overflow: hidden;
		  background-color: white;
		  position: fixed;
		  bottom: 0;
		  width: 100%;
		  text-align: center;
		  z-index: 10;
		}
		
		.navbar a {
		  float: center;
		  display: inline;
		  color: #f2f2f2;
		  text-align: center;
		  text-decoration: none;
		  font-size: 43px;
		  padding: 7px;
		}
		
		.navbar a:hover {
		  background: #FE9191;
		  color: black;
		}
		
		.dropdown {
		  float: left;
		  overflow: hidden;
		}
		
		.dropdown .dropbtn {
		  font-size: 17px;    
		  border: none;
		  outline: none;
		  color: black;
		  padding: 14px 16px;
		  background-color: inherit;
		  font-family: inherit;
		  margin: 0;
		}
		
		.dropdown-content {
		  display: none;
		  position: absolute;
		  background-color: white;
		  min-width: 160px;
		  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		}
		
		.dropdown-content a {
		  float: none;
		  color: #FE9191;
		  padding: 12px 16px;
		  text-decoration: none;
		  display: block;
		  text-align: left;
		}
		
		.topnav a:hover, .dropdown:hover .dropbtn {
		  background-color: white;
		  color: #FE9191;
		}
		
		.dropdown-content a:hover {
		  background-color: #ddd;
		  color: black;
		}
		
		.dropdown:hover .dropdown-content {
		  display: block;
		}
		
		@media screen and (max-width: 600px) {
			  .topnav a:not(:first-child), .dropdown .dropbtn {
			    display: none;
			  }
			  .topnav a.icon {
			    float: right;
			    display: block;
			  }
		}
		
		@media screen and (max-width: 600px) {
			  .topnav.responsive {position: relative;}
			  .topnav.responsive .icon {
			    position: absolute;
			    right: 0;
			    top: 0;
			  }
			  .topnav.responsive a {
			    float: none;
			    display: block;
			    text-align: left;
			  }
			  .topnav.responsive .dropdown {float: none;}
			  .topnav.responsive .dropdown-content {position: relative;}
			  .topnav.responsive .dropdown .dropbtn {
			    display: block;
			    width: 100%;
			    text-align: left;
			  }
		}
	</style>
</head>
<body>

	<div class="navbar pr-2 pl-2">
	  <a class="nav_sgroup" href="#"><img src="${pageContext.request.contextPath }/resources/images/menubar/sgroup.png" alt="반짝" style="width:40px;"></a>
	  <a class="nav_bgroup" href="#"><img src="${pageContext.request.contextPath }/resources/images/menubar/bgroup.png" alt="동호회" style="width:40px;"></a>
	  <a class="nav_challenge" href="#"><img src="${pageContext.request.contextPath }/resources/images/menubar/trophy.png" alt="챌린지" style="width:40px;"></a>
	  <a class="nav_board" href="#"><img src="${pageContext.request.contextPath }/resources/images/menubar/board.png" alt="문의 게시판" style="width:40px;"></a>
	  <a class="nav_history" href="#"><img src="${pageContext.request.contextPath }/resources/images/menubar/history.png" alt="이력" style="width:40px;"></a>
	  <a class="" href="${pageContext.request.contextPath }/member/member_view.do"><img src="${pageContext.request.contextPath }/resources/images/menubar/profile.png" alt="프로필" style="width:40px;"></a>
	</div>
<!--   <div class="dropdown sgroup">
    <button class="dropbtn"> 반짝 </button>
    <div class="dropdown-content">
      <a href="#"> 진행 중 반짝 </a>
      <a href="#"> 마감 반짝 </a>
    </div>
  </div>
  
  <div class="dropdown bgroup">
    <button class="dropbtn"> 동호회 매치 </button>
    <div class="dropdown-content">
      <a href="#"> 진행 중 매치 </a>
      <a href="#"> 동호회 홍보 </a>
      <a href="#"> 용병 구함 </a>
      <a href="#"> 마감 매치 </a>
    </div>
  </div>
  
	  <div class="dropdown challenge">
	    <button class="dropbtn"> 챌린지 및 랭킹 </button>
	    <div class="dropdown-content">
	      <a href="#"> 챌린지 </a>
	      <a href="#"> 랭킹 </a>
	    </div>
	  </div>
	  
	  <div class="dropdown">
	    <button class="dropbtn"> 문의 게시판 </button>
	  </div> -->

</body>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
>>>>>>> branch 'master' of https://github.com/jiwonnie0410/gca_spring_project.git

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!-- Popper JS -->
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<!-- Latest compiled JavaScript -->
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

		<!-- 아이콘 꼭있어야함 -->
		<!-- <link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script> -->
		
		<!--json할때 필요  -->
		<script	src="${pageContext.request.contextPath }/resources/js/json.min.js"></script>
		
		<!--my page모달  -->
		<script	src="${pageContext.request.contextPath }/resources/js/member/mypage.js"></script>
		<title>웹앱 메뉴바</title>

		<script type="text/javascript">
			$(document).ready(function() {
				$('.more').click(function() {
					if ($('.more').hasClass('more')) {
						$('.more').addClass('close').removeClass('more');
						$('.board').css('visibility', 'visible');
		
					} else if ($('.close').hasClass('close')) {
						$('.close').addClass('more').removeClass('close');
						$('.board').css('visibility', 'hidden');
					}
				});
			});
		</script>

<<<<<<< HEAD
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />

<script defer

	src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"

	integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"

	crossorigin="anonymous"></script>

<script defer

	src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"

	integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"

	crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>웹앱 메뉴바</title>

 

 

<script type="text/javascript">

$(document).ready(function(){

	  $('.more').click(function(){

	    if($('.more').hasClass('more')){

	       $('.more').addClass('close').removeClass('more');

	       $('.board').css('visibility', 'visible');

	    }else if($('.close').hasClass('close')){

	       $('.close').addClass('more').removeClass('close');  

	       $('.board').css('visibility', 'hidden');

	    }

	  });

	});

</script>

 

<style>

.more {

	display: block; 

	/* width: 40px;

	height: 16px; */

	/*  background-position: 0 78px;  */

}

 

.blind {

	position: absolute;

	overflow: hidden;

	clip: rect(0, 0, 0, 0);

	margin: -1px;

	width: 1px;

	height: 1px;

}

 

.more:hover, .close:hover {

	cursor: pointer;

}

 .close {

	display: block; 

	/* width: 42px;

	height: 16px; */

  /*   background-position: 200px 500px;  */

} 

 

.board {

	font-family: '돋움';

	font-size: 13px;

	/* position: absolute;

	top: -30px; */

	width: 500px;

	height: 200px;

	background: pink;

	visibility: hidden;

	 padding-right:13px;

	 align-content: center;

	 padding-top: 20px;

}

 

 

th,td{

/* border:1px solid black; */

padding: 10px;

}

 

 

 

 

 

 

 

 

 

 

 

.navbar {

	overflow: hidden;

	background-color: white;

	position: fixed;

	bottom: 0;

	width: 100%;

	text-align: center;

	z-index: 10;

}

 

.navbar a {

	float: center;

	display: inline;

	color: #f2f2f2;

	text-align: center;

	text-decoration: none;

	font-size: 43px;

	padding: 7px;

}

 

.navbar a:hover {

	background: #FE9191;

	color: black;

}

 

.dropdown {

	float: left;

	overflow: hidden;

}

 

.dropdown .dropbtn {

	font-size: 17px;

	border: none;

	outline: none;

	color: black;

	padding: 14px 16px;

	background-color: inherit;

	font-family: inherit;

	margin: 0;

}

 

.dropdown-content {

	display: none;

	position: absolute;

	background-color: white;

	min-width: 160px;

	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);

}

 

.dropdown-content a {

	float: none;

	color: #FE9191;

	padding: 12px 16px;

	text-decoration: none;

	display: block;

	text-align: left;

}

 

.topnav a:hover, .dropdown:hover .dropbtn {

	background-color: white;

	color: #FE9191;

}

 

.dropdown-content a:hover {

	background-color: #ddd;

	color: black;

}

 

.dropdown:hover .dropdown-content {

	display: block;

}

 

@media screen and (max-width: 600px) {

	.topnav a:not (:first-child ), .dropdown .dropbtn {

		display: none;

	}

	.topnav a.icon {

		float: right;

		display: block;

	}

}

 

@media screen and (max-width: 600px) {

	.topnav.responsive {

		position: relative;

	}

	.topnav.responsive .icon {

		position: absolute;

		right: 0;

		top: 0;

	}

	.topnav.responsive a {

		float: none;

		display: block;

		text-align: left;

	}

	.topnav.responsive .dropdown {

		float: none;

	}

	.topnav.responsive .dropdown-content {

		position: relative;

	}

	.topnav.responsive .dropdown .dropbtn {

		display: block;

		width: 100%;

		text-align: left;

	}

}

</style>
=======
		<style>
				.more {
					display: block;
					/* width: 40px;
					height: 16px; */
					/*  background-position: 0 78px;  */
				}
				
				.blind {
					position: absolute;
					overflow: hidden;
					clip: rect(0, 0, 0, 0);
					margin: -1px;
					width: 1px;
					height: 1px;
				}
				
				.more:hover, .close:hover {
					cursor: pointer;
				}
				
				.close {
					display: block;
					/* width: 42px;
					height: 16px; */
					/*   background-position: 200px 500px;  */
				}
				
				.board {
					font-family: '돋움';
					font-size: 13px;
					/* position: absolute;
					top: -30px; */
					width: 500px;
					height: 200px;
					background: pink;
					visibility: hidden;
					padding-right: 13px;
					align-content: center;
					padding-top: 20px;
				}
				
				th, td {
					/* border:1px solid black; */
					padding: 10px;
				}
				
				.navbar {
					overflow: hidden;
					background-color: white;
					position: fixed;
					bottom: 0;
					width: 100%;
					text-align: center;
					z-index: 10;
				}
				
				.navbar a {
					float: center;
					display: inline;
					color: #f2f2f2;
					text-align: center;
					text-decoration: none;
					font-size: 43px;
					padding: 7px;
				}
				
				.navbar a:hover {
					background: #FE9191;
					color: black;
				}
				
				.dropdown {
					float: left;
					overflow: hidden;
				}
				
				.dropdown .dropbtn {
					font-size: 17px;
					border: none;
					outline: none;
					color: black;
					padding: 14px 16px;
					background-color: inherit;
					font-family: inherit;
					margin: 0;
				}
				
				.dropdown-content {
					display: none;
					position: absolute;
					background-color: white;
					min-width: 160px;
					box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
				}
				
				.dropdown-content a {
					float: none;
					color: #FE9191;
					padding: 12px 16px;
					text-decoration: none;
					display: block;
					text-align: left;
				}
				
				.topnav a:hover, .dropdown:hover .dropbtn {
					background-color: white;
					color: #FE9191;
				}
				
				.dropdown-content a:hover {
					background-color: #ddd;
					color: black;
				}
				
				.dropdown:hover .dropdown-content {
					display: block;
				}
				
				@media screen and (max-width: 600px) {
					.topnav a:not (:first-child ), .dropdown .dropbtn {
						display: none;
					}
					.topnav a.icon {
						float: right;
						display: block;
					}
				}
				
				@media screen and (max-width: 600px) {
					.topnav.responsive {
						position: relative;
					}
					.topnav.responsive .icon {
						position: absolute;
						right: 0;
						top: 0;
					}
					.topnav.responsive a {
						float: none;
						display: block;
						text-align: left;
					}
					.topnav.responsive .dropdown {
						float: none;
					}
					.topnav.responsive .dropdown-content {
						position: relative;
					}
					.topnav.responsive .dropdown .dropbtn {
						display: block;
						width: 100%;
						text-align: left;
					}
				}
		</style>
>>>>>>> branch 'master' of https://github.com/jiwonnie0410/gca_spring_project.git

</head>

<body>
	<div class="navbar pr-2 pl-2">
		<div class="board" align="center">
			<div class="list">
				<table class="list">
					<tr>
						<th>활동 이력</th>
						<th>반짝</th>
						<th>동호회 매치</th>
					</tr>
					
					<tr>
						<td onClick=" location.href=''">활동 히스토리</td>
						<td onClick=" location.href=''">마감 반짝</td>
						<td onClick=" location.href=''">진행 중 매치</td>
					</tr>

					<tr>
						<td onClick=" location.href=''">챌린지 히스토리</td>
						<td onClick=" location.href=''">진행 중 반짝</td>
						<td onClick=" location.href=''">동호회 홍보</td>
					</tr>

					<tr>
						<td onClick=" location.href=''">업적 히스토리</td>
						<td onClick=" location.href=''"></td>
						<td onClick=" location.href=''">용병 구함</td>
					</tr>
				</table>
			</div>
		</div>

		<a class="nav_sgroup" href="#"><img	src="${pageContext.request.contextPath }/resources/images/menubar/sgroup.png" alt="반짝" style="width: 40px;"></a>
		<a class="nav_bgroup" href="#"><img	src="${pageContext.request.contextPath }/resources/images/menubar/bgroup.png" alt="동호회" style="width: 40px;"></a> 
		<a class="nav_challenge" href="#"><img src="${pageContext.request.contextPath }/resources/images/menubar/trophy.png" alt="챌린지" style="width: 40px;"></a> 
		<a class=""	href="${pageContext.request.contextPath }/member/member_view.do"><img src="${pageContext.request.contextPath }/resources/images/menubar/profile.png" alt="프로필" style="width: 40px;"></a>

		<!-- <a class="more"><span class="blind"><i class="fas fa-align-justify"></i></span> -->
		<a class="more"><img src="${pageContext.request.contextPath }/resources/images/icon/icon.png" alt="더보기" style="width: 40px;"></a>

	</div>

<<<<<<< HEAD
 
=======
	<!-- Modal 읽기-->
	<!-- Modal 읽기-->
	<!-- Modal 읽기-->
	<!-- Modal 읽기-->
	<!-- Modal 읽기-->
	<!-- Modal 읽기-->
	<!-- my page 상세보기 영역 -->
	<div class="modal fade" id="MyModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					My Page
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<div align="center">
						<h2>Choose Your Option</h2>
					</div>
					<br>
					<div class="info-user2">
						<input type="button" value="수정" id="btnUpdate"> <input
							type="button" value="삭제" id="btnDelete">
						<div style="color: red;">${message}</div>
						<!--이모티콘이로 대체  -->
						<span aria-hidden="true" class="li_settings fs1"></span> <span
							aria-hidden="true" class="li_lock fs1"></span> <i
							class="fas fa-user-edit  fa-lg" aria-hidden="true"
							style="color: black; font-size: 100px;"></i> <i
							class="fa fa-lock fa-lgx" aria-hidden="true"
							style="color: black; font-size: 100px;"> </i> <a
							href="changePassword"> 비밀번호 변경 </a>

					</div>
					</form>
					<form action="../logout" method="post">
						<button>로그아웃</button>
					</form>
					<button type="button" class="btn btn-primary px-4 py-2"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
>>>>>>> branch 'master' of https://github.com/jiwonnie0410/gca_spring_project.git










</body>

</html>