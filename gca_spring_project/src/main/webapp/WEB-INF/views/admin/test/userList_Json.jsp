<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자</title>
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./resources/scripts/json.min.js"></script>
<script type="text/javascript" >
	$(function(){
		userList();

		userSelect();
		
		userDelete();
		
		userInsert();
	
		userUpdate();
		
		init();
	});
	
	
	//사용자 삭제 요청
	function userDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var m_id = $(this).closest('tr').find('#hidden_m_id').val();
			var result = confirm(m_id +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'members/'+m_id,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						userList();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	//사용자 조회 요청
	function userSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var m_id = $(this).closest('tr').find('#hidden_m_id').val();
			//특정 사용자 조회
			$.ajax({
				url:'members/'+m_id,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:userSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect
	
	//사용자 조회 응답
	function userSelectResult(user) {
		$('input:text[name="m_id"]').val(user.m_id);
		$('input:text[name="m_name"]').val(user.m_name);
		$('input:text[name="m_password"]').val(user.m_password);
		$('select[name="role"]').val(user.role).attr("selected", "selected");
	}//userSelectResult
	
	
	//사용자 목록 조회 요청
	function userList() {
		$.ajax({
			url:'members',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:userListResult
		});
	}//userList
	
	
	
	//사용자 목록 조회 응답
	function userListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.m_id))
			.append($('<td>').html(item.m_name))
			.append($('<td>').html(item.m_password))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_m_id\'>').val(item.m_id))
			.appendTo('tbody');
		});//each
	}//userListResult
</script>
</head>
<body>
	
<hr/>		
<div class="container">	
	<h2>사용자 목록</h2>
	<table class="table text-center">
		<thead>
		<tr>
			<th class="text-center">아이디</th>
			<th class="text-center">이름</th>
			<th class="text-center">성별</th>
			<th class="text-center">거주지</th>
		</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>	
</body>
</html>