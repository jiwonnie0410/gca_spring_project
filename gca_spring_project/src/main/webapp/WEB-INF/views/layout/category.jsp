<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<!-- 반응형 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title> 운동하자 카테고리 </title>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- FONT AWESOME 아이콘 가져오기 -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
		
		<style>
			  table {
				    width: 100%;
				    border-top: 1px solid #000000;
				    border-bottom: 1px solid #000000;
				    border-collapse: collapse;
				  	border-spacing: 50px;
				  	font-size: 15px;
			  }
			  /* th, td {
				    border-bottom: 2px dotted #9E9E9E; 
				    padding: 10px;
			  } */
			  #one-td {
			  		border-right: 2px dotted #9E9E9E;
			  }
			  
			  #first-td {
			  		border-right: 2px dotted #9E9E9E;
			  		border-bottom: 2px dotted #9E9E9E;
			  }
			  #second-td {
			  		border-bottom: 2px dotted #9E9E9E;
			  }
		</style>


</head>
<body>
<!-- 
		반짝: 진행 반짝, 마감 반짝
		동호회 매치: 진행 매치, 마감 매치, 동호회 홍보, 용병 구함
		챌린지: 챌린지, 랭킹
		활동이력: 활동 히스토리. 챌린지 히스토리, 업적 히스토리
		
		문의하기 게시판
		관리자면 관리자 페이지로 가기 
 -->
 	<br />
 		<!-- 반짝 메뉴 -->
		<font size="3"> &nbsp;&nbsp;<font color="#FFE400"><i class="fas fa-star"></i></font> 반짝 </font>
		<table>
			<tr>
				<td width="50%" id="one-td" onClick="location.href='${pageContext.request.contextPath }/sgroup/getSgList'"> 진행 중 반짝 </td>
				<td width="50%" onClick="location.href='${pageContext.request.contextPath }/sgroup/getSgListEnd'"> 마감 반짝 </td>
			</tr>
		</table>
		<br />
		
		<!-- 동호회 매치 메뉴 -->
		<font size="3"> &nbsp;&nbsp;<font color="#F15F5F"><i class="fas fa-users"></i></font> 동호회 매치 </font>
		<table>
			<tr>
				<td width="50%" id="first-td" onClick="location.href='${pageContext.request.contextPath }/bgroup/getBgList'"> 진행 중 매치 </td>
				<td width="50%" id="second-td" onClick="location.href='${pageContext.request.contextPath }/bgroup/getBgListEnd'"> 마감 매치 </td>
			</tr>
			<tr>
				<td id="one-td" width="50%" onClick="location.href='${pageContext.request.contextPath }/sixman/getSixList'"> 용병 구함 </td>
				<td></td>
			</tr>
		</table>
		<br />
		
		<!-- 챌린지 및 랭킹 메뉴 -->
		<font size="3"> &nbsp;&nbsp;<font color="#4374D9"><i class="fas fa-trophy"></i></font> 챌린지 및 랭킹 </font>
		<table>
			<tr>
				<td width="50%" id="one-td" onClick="location.href='${pageContext.request.contextPath }/challenge/list'"> 챌린지 </td>
				<td width="50%" onClick="location.href='${pageContext.request.contextPath }/history/rank'">랭킹</td>
			</tr>
		</table>
		<br />
		
		<!-- 각종 히스토리 메뉴 -->
		<font size="3"> &nbsp;&nbsp;<font color="#CC723D"><i class="fas fa-history"></i></font> 히스토리 </font>
		<table>
			<tr>
				<td width="50%" id="first-td" onClick="location.href='${pageContext.request.contextPath }/history/activeHistory'"> 활동 히스토리 </td>
				<td width="50%" id="second-td" onClick="location.href='${pageContext.request.contextPath }/history/score'"> 업적 히스토리 </td>
			</tr>
			<tr>
				<td width="50%" id="one-td" onClick="location.href='${pageContext.request.contextPath }/history/challengeList'"> 챌린지 히스토리 </td>
				<td></td>
			</tr>
		</table>
		<br />
		
		<!-- 게시판 메뉴 -->
		<font size="3"> &nbsp;&nbsp;<font color="#2F9D27"><i class="fas fa-edit"></i></font> 게시판 </font>
		<table>
			<tr>
				<td width="50%" id="one-td" onClick="location.href='${pageContext.request.contextPath }/board/adlist'"> 동호회 홍보 </td>
				<td onClick="location.href='${pageContext.request.contextPath }/qnaboard'">문의하기</td>
			</tr>
		</table>
		<br />
		
		<!-- 관리자 페이지 가기 -->
		<div align="right">
			<a href="${pageContext.request.contextPath }/admin/chart"> 관리자 모드 바로가기 <i class="fas fa-user-secret"></i> &nbsp;&nbsp;</a>
		</div>
</body>
</html>