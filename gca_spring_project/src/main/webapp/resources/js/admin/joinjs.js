// 회원가입 체크

//if('${message}' != ''){
//	alert('${message}');
//}

// 아이디 조건 확인: 영문자, 숫자 혼합하여 6-12자리
function idCondition() {
	var pattern1 = /[a-zA-Z]/;
	var pattern2 = /[0-9]/;

	var id = document.joinfrm.joinId;
	var confirmMsg = document.joinfrm.idConfirmMsg;

	// 조건 유효성이 맞지 않으면 회원가입 폼에 빨간색으로 주의 메시지 띄움
	if (pattern1.test(id.value) && pattern2.test(id.value)) { 	// 길이 체크
		if (id.value.length >= 6 && id.value.length <= 12) { 	// 영문, 숫자 체크
			$("#idConfirmMsg").text("");
			document.joinfrm.idButton.disabled = false;
		} else {
			document.joinfrm.idButton.disabled = true;
			$("#idConfirmMsg").text("");
			$("#idConfirmMsg").append("<font size=\"2\" color=\"red\"> *영문자, 숫자를 혼합하여 6-8자리 </font>");
		}
	} else {
		document.joinfrm.idButton.disabled = true;
		$("#idConfirmMsg").text("");
		$("#idConfirmMsg").append("<font size=\"2\" color=\"red\"> *영문자, 숫자를 혼합하여 6-8자리 </font>");
	}
}

var conPw = 0;
var chPw = 0;
function checkForm() {
	var form = document.joinfrm;

	// 필요한 정보를 다 넣었는지 확인
	if (form.joinid.value == "") {
		alert("아이디를 입력하세요.");
		form.joinid.focus();
		return false;
	}

	if (form.joinid.readOnly != true) {
		alert("아이디 중복체크를 해 주세요.");
		form.joinid.focus();
		return false;
	}

	if (form.password1.value == "") {
		alert("비밀번호를 입력하세요.");
		form.password1.focus();
		return false;
	}
	
	if (conPw == 0) {
		alert("비밀번호 조건을 확인해 주세요.");
		form.password1.focus();
		return false;
	}

	if (chPw == 0) {
		alert("비밀번호 재확인을 해 주세요.");
		form.password2.focus();
		return false;
	}

	if (form.name.value == "") {
		alert("이름을 입력하세요.");
		form.name.focus();
		return false;
	}

	if (form.phone2.value == "" || form.phone3.value == "") {
		alert("전화번호를 입력하세요.");
		form.phone2.focus();
		return false;
	}

	if (isNaN(form.phone2.value) == true
			|| isNaN(form.phone3.value) == true) {
		alert("전화번호는 숫자만 입력해 주세요.");
		form.phone2.focus();
		return false;
	}

	if (form.email1.value == "") {
		alert("이메일을 입력하세요.");
		form.eamil1.focus();
		return false;
	}

	if (form.postcode.value == "") {
		alert("주소를 입력하세요.");
		form.address2.focus();
		return false;
	}

	if (form.address2.value == "") {
		alert("상세 주소를 입력하세요.");
		form.address2.focus();
		return false;
	}

	// 휴대폰 번호 한 컬럼에 넣으려고 합침
//	var ph = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
//	form.mPhone.value = ph;

	// 이메일 한 컬럼에 넣기 위해 합침
//	var m = form.email1.value + "@" + form.email2.value;
//	form.mEmail.value = m;

	form.submit();
}

// 중복되는 아이디인지 체크
function idCheck() {
	var chkId = document.joinfrm.joinid;
	if (chkId.value == "") {
		alert("아이디를 입력하세요.");
		chkId.focus();
		return false;
	}

	$.ajax({
		url : 'checkId.do',
		data : {
			id : document.joinfrm.joinid.value
		},
		dataType : 'json',
		success : function(result) {
			if (result.flag == true) { // 아이디 사용 가능할 때
				alert(document.joinfrm.joinid.value + "는 사용 가능한 ID입니다.");
				document.joinfrm.joinid.readOnly = true;
				document.joinfrm.password1.focus();
			} else { // 아이디 사용 불가능 할 때
				alert("사용할 수 없는 ID입니다.");
			}
		}
	});
}

// 비밀번호 조건 확인: 숫자, 특수문자 혼합하여 6-8자리
// 밑에다 합쳐놨음 지금 안 씀: 비밀번호 조건 만족 안 할 때 재확인 완료 후 조건 만족하면 재확인이 제대로 안 되는 문제가 있음
function pwCondition() {
	var pattern1 = /[0-9]/;
	var pattern2 = /[~!@#$%^&*()_+|<>?:{}]/;

	var first = document.joinfrm.password1;

	// 비밀번호 조건 체크
	if (first.value.length >= 6 && first.value.length <= 8) { // 길이 체크
		if (pattern1.test(first.value) && pattern2.test(first.value)) { // 숫자, 특수문자 혼합
			conPw = 1;
			$("#conditionPw").text("");
		} else {
			conPw = 0;
			$("#conditionPw").text("");
			$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-8자리 </font>");
		}
	} else {
		conPw = 0;
		$("#conditionPw").text("");
		$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-8자리 </font>");
	}
}

// 비밀번호 조건 확인: 숫자, 특수문자 혼합하여 6-8자리 // 비밀번호 재확인
function pwCheck() {
	var first = $("#password1").val();
	var second = $("#password2").val();
	
	var pattern1 = /[0-9]/;
	var pattern2 = /[~!@#$%^&*()_+|<>?:{}]/;

	// 비밀번호 조건 체크
	if (first.length >= 6 && first.length <= 8) { // 길이 체크
		if (pattern1.test(first) && pattern2.test(first)) { // 숫자, 특수문자 혼합
			conPw = 1;
			$("#conditionPw").text("");
		} else {
			conPw = 0;
			$("#conditionPw").text("");
			$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-8자리 </font>");
		}
	} else {
		conPw = 0;
		$("#conditionPw").text("");
		$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-8자리 </font>");
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

//체크박스 하나만 선택 되게 하기 (복수 선택 방지)
function oneCheckbox(a){
    var obj = document.getElementsByName("checkbox1");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != a){
            obj[i].checked = false;
        }
    }
}