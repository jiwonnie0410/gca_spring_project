<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	  <a class="" href="#"><img src="${pageContext.request.contextPath }/resources/images/menubar/profile.png" alt="프로필" style="width:40px;"></a>
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
</html>