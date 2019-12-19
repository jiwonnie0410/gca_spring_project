<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>	
		<title> 지원 메뉴바 만드는 중임 </title>
		
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
		
		<!-- CSS -->
		<link href="./resources/css/menubar/jiwon-menubar.css" rel="stylesheet">
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
						<td onClick = "location.href='${pageContext.request.contextPath }/history/myChallengeList'">챌린지 히스토리</td>
						<td onClick = "location.href='${pageContext.request.contextPath }/sgroup/getSgList'">진행 중 반짝</td>
						<td onClick = "location.href='${pageContext.request.contextPath }/board/adlist'">동호회 홍보</td>
						<td onClick = "location.href='${pageContext.request.contextPath }/history/rank'">랭킹</td>
					</tr>
					<tr>	
						<td onClick = "location.href='${pageContext.request.contextPath }/history/score'">업적 히스토리</td>
						<td></td>
						<td onClick = "location.href='${pageContext.request.contextPath }'">마감 매치</td><!-- 주소추가-->
					</tr>
					<tr>
					<td onClick = "location.href='${pageContext.request.contextPath }'">문의하기</td>
					<td></td>
						<td onClick = "location.href='${pageContext.request.contextPath }/sixman/getSixList'">용병 구함</td>
					</tr>
				</table>
				
			</div>
		</div>

		<!-- 메뉴바에 들어가는 아이콘 5개 -->
		<a class="nav_sgroup" href="${pageContext.request.contextPath }/sgroup/getSgList"><img src="${pageContext.request.contextPath }/resources/images/menubar/sgroup.png" alt="반짝" style="width: 40px;"></a> 
		<a class="nav_bgroup" href="${pageContext.request.contextPath }/bgroup/getBgList"><img src="${pageContext.request.contextPath }/resources/images/menubar/bgroup.png" alt="동호회" style="width: 40px;"></a> 
		<a class="nav_challenge" href="${pageContext.request.contextPath }/challenge/list"><img src="${pageContext.request.contextPath }/resources/images/menubar/trophy.png" alt="챌린지" style="width: 40px;"></a>
		<a href="${pageContext.request.contextPath }/board/adlist"><img src="${pageContext.request.contextPath }/resources/images/menubar/board.png" alt="홍보" style="width: 40px;"></a> 
		<a href="${pageContext.request.contextPath }/member/member_view.do"><img src="${pageContext.request.contextPath }/resources/images/menubar/profile.png" alt="프로필" style="width: 40px;"></a> 
			<span class="badge badge-pill badge-danger" style="position:relative; left:150px;">1</span><!-- 알람이 오면 +1되는 부분 -->
		<a class="more"><img src="${pageContext.request.contextPath }/resources/images/icon/menu-bar.png" alt="더보기" style="width: 40px;"></a>
	</div>
</body>
</html>