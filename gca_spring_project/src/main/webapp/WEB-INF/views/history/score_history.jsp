<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>스코어 히스토리</title>

</head>
<body>
	<div align="left" style="background: #FE9191; color: #fff; height: 70px; padding:20px; font-size:20px; font-weight:bold;">
		점수 획득 내역
	</div>
<!-- 레벨 표시 -->
	<div align="center" style="padding-top:50px;">
		<span style="font-size: 40px; font-style: oblique; color: #FE9191;">
			<img style="padding-bottom:5px;" width="55px" height="55px"
			       src="${pageContext.request.contextPath }/resources/images/level/${mylevel.m_level_cd}.png">
			&nbsp;
			
			${mylevel.m_level_cd}
		</span>
	</div>
	
<!-- 점수 획득 내역 -->	
	<div align="center" style="padding:10px; padding-top: 50px;">
		<table id="scorelist" border="3" style="text-align: center; border: 3px solid #FE9191; border-radius: 7px;">
			<tr style="background-color: #FE9191; color: #fff;">
				<th style="border-right-color: #fff">점수</th>
				<th width="30%" style="border-right-color: #fff">획득</th>
				<th width="50%">획득날짜</th>
			</tr>
			<c:if test="${myscorelist.isEmpty()}">
				<tr>
					<td colspan="3">획득한 점수가 없습니다</td>
				</tr>
			</c:if>
			
			<!-- forEach로 내용 뿌려주는 부분 -->
			<c:forEach var="myscore" items="${myscorelist}">
				<tr>
					<td style="padding:10px; ">
						<div>
							<img style="padding-bottom:5px;" width="55px" height="55px"
		          				src="${pageContext.request.contextPath }/resources/images/jey/money11.png">
		          		</div>
		          		<div>+${myscore.sch_score}</div></td>
					<td>${myscore.sch_part}</td>
					<td>${myscore.sch_dttm}</td>
				</tr>	
			</c:forEach>
		</table>
	</div>
	
</body>
</html>