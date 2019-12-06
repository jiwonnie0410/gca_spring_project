// 반짝 운동별 통계 도넛
function drawChart1() {
	var data = google.visualization.arrayToDataTable([ [ 'Task', 'percentage' ] ]);
	$.ajax({
			url: "",
			dataType: "json",
			success: function(result) {
					
					data.addColumn('string', '토핑');
					data.addColumn('number', '슬라이스');
					data.addColumn('number', '숫자');
	
					var array = [];
					for (i = 0; i < result.length; i++) {
						array.push([ result[i].dname, result[i].cnt1, result[i].cnt2 ]);
					}
					data.addRows(array);
					
					var options = {
							title : ' ',
							pieHole : 0.4,
					};
	
					var chart = new google.visualization.PieChart(document.getElementById('div_sgroup_exercise'));
					chart.draw(data, options);
			}
	});

}

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 동호회 매치 운동별 통계 도넛
function drawChart2() {
	var data = google.visualization.arrayToDataTable([
			[ 'Task', 'Hours per Day' ], [ '축구', 11 ], [ '야구', 2 ],
			[ '농구', 2 ], [ '볼링', 2 ], [ '기타', 7 ] ]);

	var options = {
		title : ' ',
		pieHole : 0.4,
	};

	var chart = new google.visualization.PieChart(document
			.getElementById('div_bgroup_exercise'));
	chart.draw(data, options);
}

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 성별 연령대 통계 컬럼 차트
// 성별로 운동, 연령대 나눠서
function drawChart3() {
	// Some raw data (not necessarily accurate)
	var rowData1 = [
			[ 'Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua  Guinea',
					'Rwanda', 'Average' ],
			[ '2004/05', 165, 938, 522, 998, 450, 114.6 ],
			[ '2005/06', 135, 1120, 599, 1268, 288, 382 ],
			[ '2006/07', 157, 1167, 587, 807, 397, 623 ],
			[ '2007/08', 139, 1110, 615, 968, 215, 409.4 ],
			[ '2008/09', 136, 691, 629, 1026, 366, 569.6 ] ];
	var rowData2 = [
			[ 'Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua  Guinea',
					'Rwanda', 'Average' ],
			[ '2004/05', 122, 638, 722, 998, 450, 614.6 ],
			[ '2005/06', 100, 1120, 899, 1268, 288, 682 ],
			[ '2006/07', 183, 167, 487, 207, 397, 623 ],
			[ '2007/08', 200, 510, 315, 1068, 215, 609.4 ],
			[ '2008/09', 123, 491, 829, 826, 366, 569.6 ] ];

	// Create and populate the data tables.
	var data = [];
	data[0] = google.visualization.arrayToDataTable(rowData1);
	data[1] = google.visualization.arrayToDataTable(rowData2);

	var options = {
		width : 700,
		height : 350,
		vAxis : {
			title : "Cups"
		},
		hAxis : {
			title : "Month"
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
	var chart = new google.visualization.ComboChart(document
			.getElementById('div_age_gender'));
	var button = document.getElementById('b1');
	function drawChart() {
		// Disabling the button while the chart is drawing.
		button.disabled = true;
		google.visualization.events.addListener(chart, 'ready', function() {
			button.disabled = false;
			button.value = 'Switch to ' + (current ? 'Tea' : 'Coffee');
		});
		options['title'] = 'Monthly ' + (current ? 'Coffee' : 'Tea')
				+ ' Production by Country';

		chart.draw(data[current], options);
	}
	drawChart();

	button.onclick = function() {
		current = 1 - current;
		drawChart();
	}
}

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 지역별 통계 지도
function drawChart4() {
	var data = google.visualization.arrayToDataTable([
			[ 'Year', '서울', '부산', '대구', '인천', '광주', '대전', '울산' ],
			[ '2004', 1000, 400, 430, 490, 390, 230, 590 ],
			[ '2005', 1170, 460, 420, 450, 490, 430, 560 ],
			[ '2006', 660, 1120, 440, 430, 380, 270, 520 ],
			[ '2007', 1030, 540, 430, 460, 320, 430, 390 ] ]);

	var options = {
		title : 'Company Performance',
		curveType : 'function',
		legend : {
			position : 'bottom'
		}
	};

	var chart = new google.visualization.LineChart(document
			.getElementById('div_city'));

	chart.draw(data, options);
}