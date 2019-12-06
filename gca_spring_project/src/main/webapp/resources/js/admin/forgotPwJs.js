//if('${message}' != ''){
//	alert('${message}');
//}

function resetPw() {
	var form = document.forgotPwfrm;
	// 필요한 정보가 다 입력되었는지 확인
	if(form.fid.value == ""){
		alert("아이디를 입력하세요.");
		document.forgotIdfrm.name.focus();
		return false;
	}
	
	if(form.fname.value == ""){
		alert("이름을 입력하세요.");
		document.forgotIdfrm.name.focus();
		return false;
	}
	
	if(form.femail1.value == ""){
		alert("이메일을 입력하세요.");
		document.forgotIdfrm.email1.focus();
		return false;
	}
	
	//이메일 한 컬럼에 넣기 위해 합침
	var m = form.femail1.value + "@" + form.femail2.value;
	form.mEmail.value = m;
	
	document.forgotPwfrm.submit();
}