function sendEmail() {
	// 필요한 정보가 다 입력되었는지 확인
	if(document.forgotIdfrm.name.value == ""){
		alert("이름을 입력하세요.");
		document.forgotIdfrm.name.focus();
		return false;
	}
	
	if(document.forgotIdfrm.email1.value == ""){
		alert("이메일을 입력하세요.");
		document.forgotIdfrm.email1.focus();
		return false;
	}
	
	//이메일 한 컬럼에 넣기 위해 합침
	var m = document.forgotIdfrm.email1.value + "@" + document.forgotIdfrm.email2.value;
	document.forgotIdfrm.mEmail.value = m;
	
	document.forgotIdfrm.submit();
}