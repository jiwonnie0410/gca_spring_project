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
	        var data = google.visualization.arrayToDataTable([
	          ['Year', 'Sales', 'Expenses'],
	          ['2013',  1000,      400],
	          ['2014',  1170,      460],
	          ['2015',  660,       1120],
	          ['2016',  1030,      540]
	        ]);
	
	        var options = {
	          title: 'Company Performance',
	          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
	          vAxis: {minValue: 0}
	        };
	
	        var chart = new google.visualization.AreaChart(document.getElementById('daily_chart'));
	        chart.draw(data, options);
	      }
	      
	      function monthlyChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['Year', 'Sales', 'Expenses'],
		          ['2013',  1000,      400],
		          ['2014',  1170,      460],
		          ['2015',  660,       1120],
		          ['2016',  1030,      540]
		        ]);
		
		        var options = {
		          title: 'Company Performance',
		          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
		          vAxis: {minValue: 0}
		        };
		
		        var chart = new google.visualization.AreaChart(document.getElementById('monthly_chart'));
		        chart.draw(data, options);
		      }
	    </script>
</head>
<body>

		<div id="content-wrapper">
			<div class="container-row">
					<div id="daily_chart" style="width: 100%; height: 390px;"></div>
					<div id="monthly_chart" style="width: 100%; height: 390px;"></div>
			</div>
		</div>
</body>
</html>