<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
		<!-- 통계 차트 그리기 -->
	    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script src="../resources/js/admin/chartjs.js"></script>
    	<script>
		    	google.charts.load("current", {packages:["corechart"]});
		    	google.charts.load('current', {'packages':['bar']});
		    	google.charts.setOnLoadCallback(drawChart1);
		    	google.charts.setOnLoadCallback(drawChart2);
		    	google.charts.setOnLoadCallback(drawChart3);
		    	google.charts.setOnLoadCallback(drawChart4);
    	</script>

</head>
<body>
		<div id="content-wrapper">
			<div class="container-fluid">
			
				<!-- /.container-fluid -->
				<div style="display:inline-block; text-align:center;">
					<font size="4"><b> 반짝 운동별 통계 </b></font>
					<div id="div_sgroup_exercise" style="width:700px; height:380px;"></div>
				</div>
				<div style="display:inline-block; text-align:center;">
					<font size="4"><b> 동호회 매치 운동별 통계 </b></font>
					<div id="div_bgroup_exercise" style="width:700px; height:380px;"></div>
				</div>
				<div style="display:inline-block; text-align:center;">
					<font size="4"><b> 연령대 및 성별 통계 </b></font>
					&nbsp;&nbsp;&nbsp;&nbsp;<button id="b1" class="button-title"> 성별 변경 </button>
					<div id="div_age_gender" style="width:700px; height:380px; vertical-align: top;"></div>
				</div>
				<div style="display:inline-block; text-align:center;">
					<font size="4"><b> 지역별 통계 </b></font>
					<div id="div_city" style="width:800px; height:380px;"></div>
				</div>
			</div>
		</div>
</body>

</html>
