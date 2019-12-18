<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		
		<title>웹앱 메뉴바</title>
		
		<script type="text/javascript">
				$(document).ready(function(){
					  $('.more').click(function(){
						    if($('.more').hasClass('more')){
						       $('.more').addClass('close').removeClass('more');
						       $('.board').css('display', 'block');
						    }else if($('.close').hasClass('close')){
						       $('.close').addClass('more').removeClass('close');  
						       $('.board').css('display', 'none');
						    }
					  });
				});
		</script>
		
		<style>
			.more {
				display: block; 
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
			} 
			
			.board {
				font-family: '돋움';
				font-size: 13px;
				width: 600px;
				height: 200px;
				background: pink;
				display:none;
				/* padding-right:10px; */
				align-content: center;
				/* padding-top: 20px; */
			}
			
			th,td{
				padding: 5px;
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
</head>
<body>
	<div class="navbar pr-2 pl-2">
		<div class="board" align="center">
			<div class="list">
			
			 	<!-- 3줄 탭에 들어가는 메뉴 -->
			 	<table class="list" >
					<tr>
						<th>활동 이력</th>
						<th>반짝</th>
						<th>동호회 매치</th>
						<th>챌린지</th>
					</tr>
					<tr>
						<td onClick = "location.href='${pageContext.request.contextPath }/history/activeHistory'">활동 히스토리</td>
						<td onClick = "location.href='${pageContext.request.contextPath }/sgroup/getSgListEnd'">마감 반짝</td>
						<td onClick = "location.href='${pageContext.request.contextPath }/'">진행 중 매치</td>
						<td onClick = "location.href='${pageContext.request.contextPath }/challenge/list'">챌린지</td>
					</tr>
					<tr>	
						<td onClick = "location.href='${pageContext.request.contextPath }/history/challengeList'">챌린지 히스토리</td>
						<td onClick = "location.href='${pageContext.request.contextPath }/sgroup/getSgList'">진행 중 반짝</td>
						<td onClick = "location.href='${pageContext.request.contextPath }/board/adlist'">동호회 홍보</td>
						<td onClick = "location.href='${pageContext.request.contextPath }'">랭킹</td>
					</tr>
					<tr>	
						<td onClick = "location.href='${pageContext.request.contextPath }/history/rank'">업적 히스토리</td>
						<td onClick = "location.href='${pageContext.request.contextPath }'">마감 매치</td><!-- 주소추가-->
						<td onClick = "location.href='${pageContext.request.contextPath }/sixman/getSixList'">용병 구함</td>
					</tr>
				</table>
				
			</div>
		</div>

		<!-- 메뉴바에 들어가는 아이콘 5개 -->
		<a class="nav_sgroup" href="${pageContext.request.contextPath }/sgroup/getSgList"><img src="${pageContext.request.contextPath }/resources/images/menubar/sgroup.png" alt="반짝" style="width: 40px;"></a> 
		<a class="nav_bgroup" href="${pageContext.request.contextPath }/bgroup/getBgList"><img src="${pageContext.request.contextPath }/resources/images/menubar/bgroup.png" alt="동호회" style="width: 40px;"></a> 
		<a class="nav_challenge" href="${pageContext.request.contextPath }/challenge/list"><img src="${pageContext.request.contextPath }/resources/images/menubar/trophy.png" alt="챌린지" style="width: 40px;"></a>
		<a href="${pageContext.request.contextPath }/qnaboard"><img src="${pageContext.request.contextPath }/resources/images/menubar/board.png" alt="문의" style="width: 40px;"></a> 
		<a href="${pageContext.request.contextPath }/member/member_view.do"><img src="${pageContext.request.contextPath }/resources/images/menubar/profile.png" alt="프로필" style="width: 40px;"></a> 
		<a class="more"><img src="${pageContext.request.contextPath }/resources/images/icon/icon.png" alt="더보기" style="width: 40px;"></a>
	</div>
</body>
</html>