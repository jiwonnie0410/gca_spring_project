// 반짝 운동별 통계 도넛
function drawChart1() {
	var data = new google.visualization.DataTable();
	$.ajax({
			url: "../ajax/chart/sgroup",
			dataType: "json",
			success: function(result) {
					// 차트에 컬럼 추가
					data.addColumn('string', '운동');
					data.addColumn('number', '횟수')
					
					// 디비에서 받아온 정보 result를 array 배열에 넣어서 차트 컬럼에 추가
					var array = [];
					for(i=0; i<result.length; i++) {
						array.push( [ result[i].exercise, result[i].count ] );
					}
					data.addRows(array);
					
					// 차트 옵션: 타이틀 없으면 오류 나기 때문에 저렇게라도 넣어줘야 함
					var options = {
							title : ' ',
							pieHole : 0.4,
					};
	
					// jsp파일에서 아이디로 태그 찾아서 차트 그려줌
					var chart = new google.visualization.PieChart(document.getElementById('div_sgroup_exercise'));
					chart.draw(data, options);
			}
	});
}

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 동호회 매치 운동별 통계 도넛
function drawChart2() {
	var data = new google.visualization.DataTable();
	$.ajax({
			url: "../ajax/chart/bgroup",
			dataType: "json",
			success: function(result) {
					// 차트에 컬럼 추가
					data.addColumn('string', '운동');
					data.addColumn('number', '횟수')
					
					// 디비에서 받아온 정보 result를 array 배열에 넣어서 차트 컬럼에 추가
					var array = [];
					for(i=0; i<result.length; i++) {
						array.push( [ result[i].exercise, result[i].count ] );
					}
					data.addRows(array);
					
					// 차트 옵션: 타이틀 없으면 오류 나기 때문에 저렇게라도 넣어줘야 함
					var options = {
							title : ' ',
							pieHole : 0.4,
					};
	
					// jsp파일에서 아이디로 태그 찾아서 차트 그려줌
					var chart = new google.visualization.PieChart(document.getElementById('div_bgroup_exercise'));
					chart.draw(data, options);
			}
	});
}

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 성별 연령대 통계 컬럼 차트
// 성별로 운동, 연령대 나눠서
function drawChart3() {
	// Some raw data (not necessarily accurate)
	var rowData1 = [
			[ 'Age', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua  Guinea',	'Rwanda', 'Average' ],
			[ '20대', 165, 938, 522, 998, 450, 114.6 ],
			[ '30대', 135, 1120, 599, 1268, 288, 382 ],
			[ '40대', 157, 1167, 587, 807, 397, 623 ],
			[ '50대 이상', 139, 1110, 615, 968, 215, 409.4 ] ];
	var rowData2 = [
			[ 'Age', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua  Guinea',	'Rwanda', 'Average' ],
			[ '20대', 122, 638, 722, 998, 450, 614.6 ],
			[ '30대', 100, 1120, 899, 1268, 288, 682 ],
			[ '40대', 183, 167, 487, 207, 397, 623 ],
			[ '50대 이상', 200, 510, 315, 1068, 215, 609.4 ] ];

	// Create and populate the data tables.
	var data = [];
	data[0] = google.visualization.arrayToDataTable(rowData1);
	data[1] = google.visualization.arrayToDataTable(rowData2);

	var options = {
		width : 700,
		height : 350,
		vAxis : {
			title : ""
		},
		hAxis : {
			title : "Age"
		},
		seriesType : "bars",
		series : {
			5 : {
				type : "line"
			}
		},
		animation : {
			duration : 1000,
			easing : 'out'
		},
	};
	var current = 0;
	// Create and draw the visualization.
	var chart = new google.visualization.ComboChart(document.getElementById('div_age_gender'));
	var button = document.getElementById('b1');
	function drawChart() {
		// Disabling the button while the chart is drawing.
		button.disabled = false; // 내가 버튼을 jsp 페이지에 이미 만들어뒀기 때문에 얘는 false로 해야 함
		options['title'] = (current ? '남성' : '여성') + ' 연령대별 운동 통계';

		chart.draw(data[current], options);
	}
	drawChart();

	button.onclick = function() {
		current = 1 - current;
		drawChart();
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	var data = new google.visualization.DataTable();
	$.ajax({
			url: "../ajax/chart/city",
			dataType: "json",
			success: function(result) {
					console.log(result);
					// 차트에 컬럼 추가
					data.addColumn('string', '월');
					data.addColumn('number', '서울');
					data.addColumn('number', '부산');
					data.addColumn('number', '대구');
					data.addColumn('number', '인천');
					data.addColumn('number', '광주');
					data.addColumn('number', '대전');
					data.addColumn('number', '울산');
					
					// 디비에서 받아온 정보 result를 array 배열에 넣어서 차트 컬럼에 추가
					var array = [];
					for(i=0; i<result.length; i++) {
						array.push( [ result[i].MONTH, result[i].Seoul, result[i].Busan, result[i].Daegu, result[i].Incheon, result[i].Gwangju, result[i].Daejeon, result[i].Ulsan ] );
					}
					data.addRows(array);
					
					// 차트 옵션: 타이틀 없으면 오류 나기 때문에 저렇게라도 넣어줘야 함
					var options = {
						title : '',
						curveType : 'function',
						legend : {	position : 'bottom'  }
					};
	
					// jsp파일에서 아이디로 태그 찾아서 차트 그려줌
					var chart = new google.visualization.ComboChart(document.getElementById('div_age_gender'));
					chart.draw(data, options);
			}
	});
}

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 지역별 통계 지도
function drawChart4() {
	var data = new google.visualization.DataTable();
	$.ajax({
			url: "../ajax/chart/city",
			dataType: "json",
			success: function(result) {
					console.log(result);
					// 차트에 컬럼 추가
					data.addColumn('string', '월');
					data.addColumn('number', '서울');
					data.addColumn('number', '부산');
					data.addColumn('number', '대구');
					data.addColumn('number', '인천');
					data.addColumn('number', '광주');
					data.addColumn('number', '대전');
					data.addColumn('number', '울산');
					
					// 디비에서 받아온 정보 result를 array 배열에 넣어서 차트 컬럼에 추가
					var array = [];
					for(i=0; i<result.length; i++) {
						array.push( [ result[i].MONTH, result[i].Seoul, result[i].Busan, result[i].Daegu, result[i].Incheon, result[i].Gwangju, result[i].Daejeon, result[i].Ulsan ] );
					}
					data.addRows(array);
					
					// 차트 옵션: 타이틀 없으면 오류 나기 때문에 저렇게라도 넣어줘야 함
					var options = {
						title : '',
						curveType : 'function',
						legend : {	position : 'bottom'  }
					};
	
					// jsp파일에서 아이디로 태그 찾아서 차트 그려줌
					var chart = new google.visualization.LineChart(document.getElementById('div_city'));
					chart.draw(data, options);
			}
	});
}