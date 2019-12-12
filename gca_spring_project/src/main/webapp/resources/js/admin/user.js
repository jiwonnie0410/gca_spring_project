
$(function(){
		userList();

		userSelect();
		
		userDelete();

	});

//사용자 목록 조회 요청
	function userList() {
		$.ajax({
			url:"../ajax/getUserList",
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
	
	
	
	
	
	
	//사용자 삭제 요청
	function userDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var m_id = $(this).closest('tr').find('#hidden_m_id').val();
			var result = confirm(m_id +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:"../ajax/members/"+m_id,    
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
			window.open('${pageContext.request.contextPath }/member/admin_member_view.do?m_id='+m_id , '회원싱세보기' , 'width=500,height=500, menubar=no, status=no, toolbar=no'); 
		}); //조회 버튼 클릭
	}//userSelect