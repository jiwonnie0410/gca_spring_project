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
	<div>
		<table>
			<tr><th>점수</th><th>획득날짜</th><th>획득</th></tr>
			<c:forEach var="myscore" items="${myscorelist}">
				<tr>
					<td>${myscore.sch_score}</td><td>${myscore.sch_part}</td><td>${myscore.sch_dttm}</td>
				</tr>	
			</c:forEach>
	</table>
	</div>
</body>
</html>