$(function() {
	//레인지 슬라이드 옵션
	var slider = document.getElementById("myRange"); 
	var output = document.getElementById("checkRange"); //보증금선택쪽의 출력값
	var pay = document.getElementById("paynow"); //결제버튼의 출력값
	var payFormInput = $("#money_deposit"); //DB입력용 폼 인풋
	
	output.innerHTML = slider.value;
	pay.innerHTML = slider.value + "천원 결제하기";
	payFormInput.val(slider.value * 1000);
	
	slider.oninput = function() {
		output.innerHTML = this.value;
		pay.innerHTML = this.value + "천원 결제하기";
		payFormInput.val(this.value * 1000);
	}
});