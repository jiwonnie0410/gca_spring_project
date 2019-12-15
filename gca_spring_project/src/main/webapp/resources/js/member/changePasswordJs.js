// 비밀번호 조건 확인: 숫자, 특수문자 혼합하여 6-10자리 // 비밀번호 재확인
function pwCheck() {
	var first = $("#password1").val();
	var second = $("#password2").val();
	
	var pattern1 = /[0-9]/;
	var pattern2 = /[~!@#$%^&*()_+|<>?:{}]/;

	// 비밀번호 조건 체크
	if (first.length >= 6 && first.length <= 10) { // 길이 체크
		if (pattern1.test(first) && pattern2.test(first)) { // 숫자, 특수문자 혼합
			conPw = 1;
			$("#conditionPw").text("");
		} else {
			conPw = 0;
			$("#conditionPw").text("");
			$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-10자리 </font>");
		}
	} else {
		conPw = 0;
		$("#conditionPw").text("");
		$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-10자리 </font>");
	}

	// 비밀번호 재확인 체크
	if (first == second) {
		chPw = 1;
		$("#confirmPw").text("");
		$("#confirmPw").append("<font size=\"2\" color=\"blue\"> *비밀번호 재확인 완료 </font>");
	} else {
		chPw = 0;
		$("#confirmPw").text("");
		$("#confirmPw").append("<font size=\"2\" color=\"red\"> *재확인 비밀번호가 일치하지 않습니다. </font>");
	}
}