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
	$.ajax({
			url: "../ajax/chart/gender",
			dataType: "json",
			success: function(result) {
					var rowData1 = new google.visualization.DataTable();
					// 여성 차트에 컬럼 추가
					rowData1.addColumn('string', '연령대');
					rowData1.addColumn('number', '농구');
					rowData1.addColumn('number', '달리기');
					rowData1.addColumn('number', '등산');
					rowData1.addColumn('number', '배드민턴');
					rowData1.addColumn('number', '볼링');
					rowData1.addColumn('number', '수영');
					rowData1.addColumn('number', '자전거');
					
					// 디비에서 받아온 여성 연령대별 정보 result를 array1 배열에 넣어서 차트 컬럼에 추가
					var array1 = [];
					for(i=0; i<result.female.length; i++) {
						var age = result.female[i].AGE;
						if(age == 40)
							age = age + '대 이상';
						else
							age = age + '대'
						array1.push( [ age, result.female[i].BASKETBALL, result.female[i].RUNNING, result.female[i].HIKING, result.female[i].BADMINTON, result.female[i].BOWLING, result.female[i].SWIMMING, result.female[i].BICYCLE ] );
					}
					rowData1.addRows(array1);
					
					var rowData2 = new google.visualization.DataTable();
					// 남성 차트에 컬럼 추가
					rowData2.addColumn('string', '연령대');
					rowData2.addColumn('number', '농구');
					rowData2.addColumn('number', '달리기');
					rowData2.addColumn('number', '등산');
					rowData2.addColumn('number', '배드민턴');
					rowData2.addColumn('number', '볼링');
					rowData2.addColumn('number', '수영');
					rowData2.addColumn('number', '자전거');
					
					// 디비에서 받아온 남성 연령대별 정보 result를 array1 배열에 넣어서 차트 컬럼에 추가
					var array2 = [];
					for(i=0; i<result.male.length; i++) {
						var age = result.female[i].AGE;
						if(age == 40)
							age = age + '대 이상';
						else
							age = age + '대'
						array2.push( [ age, result.male[i].BASKETBALL, result.male[i].RUNNING, result.male[i].HIKING, result.male[i].BADMINTON, result.male[i].BOWLING, result.male[i].SWIMMING, result.male[i].BICYCLE ] );
					}
					rowData2.addRows(array2);
					
					var data = [];
					data[0] = rowData1;
					data[1] = rowData2;
					
					// 차트 옵션: 타이틀 없으면 오류 나기 때문에 저렇게라도 넣어줘야 함
					var options = {
							width : 700,
							height : 380,
							vAxis : { title : "" },
							hAxis : { title : "Age" },
							seriesType : "bars",
//							series : { 5 : { type : "line" } },
							animation : { duration : 1000, easing : 'out' },
					};
					
					var current = 0;
					// jsp파일에서 아이디로 태그 찾아서 차트 그려줌
					var chart = new google.visualization.ComboChart(document.getElementById('div_age_gender'));
					var button = document.getElementById('b1');
					
					function drawChart() {
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