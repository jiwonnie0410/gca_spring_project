<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--json할때 필요  -->
<script src="${pageContext.request.contextPath }/resources/js/json.min.js"></script>

<title>게시글 작성</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnSave").click(function(){
			//var title = document.form1.title.value; ==> name속성으로 처리할 경우
			//var content = document.form1.content.value;
			var ad_title = $("#ad_title").val();
			var ad_content = $("#ad_content").val();
			if(ad_title == ""){
				alert("제목을 입력하세요");
				document.form1.ad_title.focus();
				return;
			}
			else if(ad_content == ""){
				alert("내용을 입력하세요");
				document.form1.ad_content.focus();
				return;
			}
			else if(ad_city == ""){
				alert("도시를 선택해주세요");
				document.form1.ad_city.focus();
				return;
			}
			
			var that = $("#form1");
			var str = "";
			// 태그들.each(함수)
			// id가 uploadedList인 태그 내부에 있는 hidden태그들
			/* $("#uploadedList .file").each(function(i){
				str += "<input type='hidden' name='files["+i+"]' value='"+$(this).val()+"'>";
			}); */
			// form에 hidden태그들을 추가
			$("#form1").append(str);
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
		
	});
	
</script>

</head>
<body>
	<div class="col-20">
          <div class="card">
            <div class="card-header" style="background-color: #FEBABA;">
          		게시물 작성
          	</div>
          	 <div class="card-body">
				<form name="form1" id="form1" method="post" action="${pageContext.request.contextPath }/board/insert.do">
				<input type="hidden" id="m_id" name="m_id" value="${id }">
			<div class="form-group">
				<div > 
				<label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;"> 제목</label>&nbsp;&nbsp;
				<input name="ad_title" id="ad_title"  placeholder="제목을 입력해주세요" style="border: 1px solid #FE9191; border-radius: 10px;"></div>
			</div>
			<div class="form-group">
				<div>
					<label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;"> 동호회 지역</label>&nbsp;&nbsp;
					 <select name="ad_city" id="ad_city" class="btn btn-outline btn-sm dropdown-toggle"  style="border: 1px solid #FE9191; border-radius: 10px;">
						  <option	selected disabled value="도시" >-도시 선택-</option> 
						  <option value="서울" style="border: 1px solid #FE9191;" >서울</option>
						  <option value="수도권" style="border: 1px solid #FE9191;">수도권</option>
						  <option value="대구" style="border: 1px solid #FE9191;" >대구</option>
						  <option value="부산" style="border: 1px solid #FE9191;">부산</option>
						  <option value="기타 지역" style="border: 1px solid #FE9191;">기타 지역</option>
					 </select>
				</div>
			</div>
			<div class="form-group">
				<div>
					<label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;">내용</label>&nbsp;&nbsp;
				&nbsp;<textarea name="ad_content" id="ad_content" rows="4" cols="40" placeholder="내용을 입력해주세요" style="border: 1px solid #FE9191;border-radius: 10px;"></textarea></div>
			</div>
			<div class="form-group">
				<div align="center">
					<button class="btn" type="submit" id="btnSave" style="background-color: #FE9191; color: white;">확인</button>
					<button class="btn " type="reset" style="background-color: #FE9191; color: white;">취소</button>
					<button class="btn " id="list" name="list" style="background-color: #FE9191; color: white;">게시판</button>
			</div>
		</div>	
	</form>
</div>
</body>


</html>