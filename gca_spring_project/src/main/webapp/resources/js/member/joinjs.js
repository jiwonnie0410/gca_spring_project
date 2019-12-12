$(function() {
	$('#mAddress1').on('click', mAddress_find);
});

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
			$("#idConfirmMsg").append("<font size=\"2\" color=\"red\"> *영문자, 숫자를 혼합하여 6-12자리 </font>");
		}
	} else {
		document.joinfrm.idButton.disabled = true;
		$("#idConfirmMsg").text("");
		$("#idConfirmMsg").append("<font size=\"2\" color=\"red\"> *영문자, 숫자를 혼합하여 6-12자리 </font>");
	}
}

//필요한 정보를 다 넣었는지 확인
var conPw = 0;
var chPw = 0;
function checkForm() {
	var form = document.joinfrm;

	if (form.joinId.value == "") {
		alert("아이디를 입력하세요.");
		form.joinId.focus();
		return false;
	}

	if (form.joinId.readOnly != true) {
		alert("아이디 중복체크를 해 주세요.");
		form.joinId.focus();
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
	
	if (form.nick.value == "") {
		alert("닉네임을 입력하세요.");
		form.nick.focus();
		return false;
	}
	
	if (form.age.value == "") {
		alert("나이를 입력하세요.");
		form.age.focus();
		return false;
	}
	
	if (isNaN(form.age.value) == true
			|| isNaN(form.age.value) == true) {
		alert("나이는 숫자만 입력해 주세요.");
		form.age.focus();
		return false;
	}
	
	if (form.email1.value == "") {
		alert("이메일을 입력하세요.");
		form.email1.focus();
		return false;
	}

	if (form.address.value == "") {
		alert("주소를 입력하세요.");
		form.address.focus();
		return false;
	}

	// 이메일 한 컬럼에 넣기 위해 합침
	var m = form.email1.value + "@" + form.email2.value;
	form.mEmail.value = m;

	form.submit();
}

// 중복되는 아이디인지 체크
function idCheck() {
	var chkId = document.joinfrm.joinId;
	if (chkId.value == "") {
		alert("아이디를 입력하세요.");
		chkId.focus();
		return false;
	}

	$.ajax({
		url : 'ajax/checkId',
		data : {
			id : document.joinfrm.joinId.value
		},
		dataType : 'json',
		success : function(result) {
			if (result == 0) { // 아이디 사용 가능할 때
				alert(document.joinfrm.joinId.value + "는 사용 가능한 ID입니다.");
				document.joinfrm.joinId.readOnly = true;
				document.joinfrm.password1.focus();
			} else { // 아이디 사용 불가능 할 때
				alert("사용할 수 없는 ID입니다.");
			}
		}
	});
}

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

//체크박스 하나만 선택 되게 하기 (복수 선택 방지)
function oneCheckbox(a){
    var obj = document.getElementsByName("checkbox1");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != a){
            obj[i].checked = false;
        }
    }
}


function mAddress_find() {
	
	//카카오맵 API로 좌표 형성
	var geo = new kakao.maps.services.Geocoder();
	
	//다음 주소 API로 주소 받아 주소 입력
	new daum.Postcode({
		oncomplete : function(data) {
			var addr = data.address;
			document.getElementById("address").value = addr;
			geo.addressSearch(data.address, function(results, status) {
				if (status === daum.maps.services.Status.OK) {
					var result = results[0];
					var coords = new daum.maps.LatLng(result.y, result.x); //좌표값 받음
					$('#xy').val(coords.Ha + ", " + coords.Ga);
				}
			});
		}
	}).open();
}