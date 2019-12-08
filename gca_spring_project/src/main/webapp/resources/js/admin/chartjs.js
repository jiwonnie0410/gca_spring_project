// 반짝 운동별 통계 도넛
function drawChart1() {
	var data = google.visualization.DataTable();
	
/*	var array = [];
	array.push([ '올리브', 1, 5 ]);
	array.push([ '페퍼로니', 5, 8 ]);
	array.push([ '루꼴라', 2, 2 ]);
	array.push([ '치즈', 3, 1 ]);
	array.push([ '양파', 6, 15 ]);
	data.addRows(array);*/
	
	
	data.addColumn('string', 'Name');
  data.addColumn('number', 'Height');
  data.addRows(3);
  data.setCell(0, 0, 'Tong Ning mu');
  data.setCell(1, 0, 'Huang Ang fa');
  data.setCell(2, 0, 'Teng nu');
  data.setCell(0, 1, 174);
  data.setCell(1, 1, 523);
  data.setCell(2, 1, 86);
	
	
	var options = {
			title : ' ',
			pieHole : 0.4,
	};

	var chart = new google.visualization.PieChart(document.getElementById('div_sgroup_exercise'));
	chart.draw(data, options);
	
	/*$.ajax({
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
	});*/

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

	var chart = new google.visualization.PieChart(document.getElementById('div_bgroup_exercise'));
	chart.draw(data, options);
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
}

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 지역별 통계 지도
function drawChart4() {
	var data = google.visualization.arrayToDataTable([
			[ 'Year', '서울', '부산', '대구', '인천', '광주', '대전', '울산' ],
			[ '2004', 100, 40, 43, 49, 39, 23, 59 ],
			[ '2005', 117, 46, 42, 45, 49, 43, 56 ],
			[ '2006', 66, 112, 44, 43, 38, 27, 52 ],
			[ '2007', 103, 54, 43, 46, 32, 43, 39 ] ]);

	var options = {
		title : '',
		curveType : 'function',
		legend : {	position : 'bottom'  }
	};

	var chart = new google.visualization.LineChart(document.getElementById('div_city'));

	chart.draw(data, options);
}