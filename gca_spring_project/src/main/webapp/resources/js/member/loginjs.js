function checkForm() {
	var form = document.loginfrm;

	if (form.id.value == "") {
		alert("아이디를 입력하세요.");
		form.id.focus();
		return false;
	}

	if (form.pw.value == "") {
		alert("비밀번호를 입력하세요.");
		form.pw.focus();
		return false;
	}

	form.submit();
}