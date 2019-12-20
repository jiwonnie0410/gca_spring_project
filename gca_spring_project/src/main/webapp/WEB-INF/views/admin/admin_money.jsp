<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	      google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(dailyChart);
	      google.charts.setOnLoadCallback(monthlyChart);
	
	      function dailyChart() {
	    	  	var data = new google.visualization.DataTable();
	    		$.ajax({
	    				url: "../ajax/chart/daily",
	    				data: {start:$('#dailyStart').val(), end:$('#dailyEnd').val()},
	    				dataType: "json",
	    				success: function(result) {
	    						// 차트에 컬럼 추가
	    						data.addColumn('string', '일자');
	    						data.addColumn('number', '총 입금액');
	    						data.addColumn('number', '순수익');
	    						
	    						// 디비에서 받아온 정보 result를 array 배열에 넣어서 차트 컬럼에 추가
	    						var array = [];
	    						for(i=0; i<result.length; i++) {
	    							array.push( [ result[i].day, result[i].income, result[i].earning ] );
	    						}
	    						data.addRows(array);
	    						
	    						// 차트 옵션: 타이틀 없으면 오류 나기 때문에 저렇게라도 넣어줘야 함
	    						var options = {
	    								title: '',
	    						         hAxis: {title: 'day',  titleTextStyle: {color: '#333'}},
	    						         vAxis: {minValue: 0}
	    						};
	    		
	    						// jsp파일에서 아이디로 태그 찾아서 차트 그려줌
	    						var chart = new google.visualization.AreaChart(document.getElementById('daily_chart'));
	    						chart.draw(data, options);
	    				}
	    		});
	      }
	      
	      function monthlyChart() {
	    	  	var data = new google.visualization.DataTable();
	    		$.ajax({
	    				url: "../ajax/chart/monthly",
	    				data: {start:$('#monthlyStart').val(), end:$('#monthlyEnd').val()},
	    				dataType: "json",
	    				success: function(result) {
	    						// 차트에 컬럼 추가
	    						data.addColumn('string', '월별');
	    						data.addColumn('number', '총 입금액');
	    						data.addColumn('number', '순수익');
	    						
	    						// 디비에서 받아온 정보 result를 array 배열에 넣어서 차트 컬럼에 추가
	    						var array = [];
	    						for(i=0; i<result.length; i++) {
	    							array.push( [ result[i].month, result[i].income, result[i].earning ] );
	    						}
	    						data.addRows(array);
	    						
	    						// 차트 옵션: 타이틀 없으면 오류 나기 때문에 저렇게라도 넣어줘야 함
	    						var options = {
	    								title: '',
	    						         hAxis: {title: 'month',  titleTextStyle: {color: '#333'}},
	    						         vAxis: {minValue: 0}
	    						};
	    		
	    						// jsp파일에서 아이디로 태그 찾아서 차트 그려줌
	    						var chart = new google.visualization.AreaChart(document.getElementById('monthly_chart'));
	    						chart.draw(data, options);
	    				}
	    		});
		      }
	    </script>
	    
	    <style>
	    
	    .noticeTime {
			width: fit-content;
		    position: relative;
		    left: 200px;
		    margin-bottom: 30px;
		    border-color: #bfacdf;
		    border-radius: 10px;
		    border-style: dotted;
		    padding: 20px;
	    }
	    
	    .bigText {
		    font-size: 21px;
		    font-weight: bold;
		    color: #242424;
	    }
	    .smallText {
	    	font-size: 20px;
	    	color: #242424;
	    }
	    
	    
	    </style>
	    
</head>
<body>

		<div id="content-wrapper">
			<div class="container-row">

				<div class="noticeTime">
				  	<span class="bigText">― 스페셜 챌린지 환급시간 ―</span><br>
					<span class="smallText">챌린지 실패: 챌린지 마감 다음날 am 0:05</span><br>
					<span class="smallText">챌린지 성공: 유저의 성공 다음날 am 0:10</span>
				</div>
				
<!-- 				<div class="noticePercent"> -->
<!-- 				  	<span class="bigText">― 스페셜 챌린지 환급시간 ―</span><br> -->
<!-- 					<span class="smallText">챌린지 실패: 챌린지 마감 다음날 am 0:05</span><br> -->
<!-- 					<span class="smallText">챌린지 성공: 유저의 성공 다음날 am 0:10</span> -->
<!-- 				</div> -->
			
			<!-- 일별 수익 현황 보기 -->
					<table>
							<tr><td width="200"></td>
								<td width="250"> <button type="button" onclick="dailyChart()" class="button-title" style="width:200px; height:43px; font-size:18px;"><b>일별  수익현황  보기</b></button> </td>
								<td> <b>시작일</b></td>
								<td><input class="form-control" type="date" id="dailyStart" name="dailyStart"> </td>
								<td width="60" align="center"> <b>―</b> </td>
								<td><b>마지막일</b></td>
								<td><input class="form-control" type="date" id="dailyEnd" name="dailyEnd"></td>
							</tr>
					</table>
					<div id="daily_chart" style="width: 100%; height: 370px;"></div> <!-- 차트 그리기 -->
			
			<!-- 월별 수익 현황 보기 -->
					<table>
							<tr><td width="200"></td>
								<td width="250"> <button type="button" onclick="monthlyChart()" class="button-title" style="width:200px; height:43px; font-size:18px;"><b>월별  수익현황  보기</b></button> </td>
								<td><b>시작 월</b></td>
								<td><input class="form-control" type="date" id="monthlyStart" name="monthlyStart"></td>
								<td width="60" align="center"><b>―</b></td>
								<td><b>마지막 월</b></td>
								<td><input class="form-control" type="date" id="monthlyEnd" name="monthlyEnd"></td>
							</tr>
					</table>
					<div id="monthly_chart" style="width: 100%; height: 370px;"></div> <!-- 차트 그리기 -->
			
			</div>
		</div>
</body>
</html>



