$(function(){
	getChallengehtList();
});


// 챌린지 목록 띄우기
function getChallengehtList() {
	$.ajax({
		url : "../ajax/getChallengehtList",
		dataType : "json",
		success : getChallengeListtHandler
	});
}

// 목록 조회 결과처리
function getChallengeListtHandler(datas) {
	$("#chtb").empty();
	for (var i = 0; i < datas.length; i++) {
		$("<tr id='"+datas[i].CL_NUM+"'>").append($('<td>').html(datas[i].CL_NUM))
						.append($('<td>').html(datas[i].CL_NUM))
						 .append($('<td>').html(datas[i].CL_START_DTTM))
						 .appendTo('#chtb')
						 .attr("data",datas[i].CL_NUM);
				}//for
			}//  getChallengeListtHandler