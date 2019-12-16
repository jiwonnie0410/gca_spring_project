$(document)
			.ready(
					function() {
						$("#btnUpdate")
								.click(
										function() {
											// 확인 대화상자    
											if (confirm("수정하시겠습니까?")) {
												document.form1.action = "${pageContext.request.contextPath}/member/update.do";
												document.form1.submit();
											}
										});

						$("#btnDelete")
								.click(
										function() {
											// 확인 대화상자 
											if (confirm("삭제하시겠습니까?")) {
												document.form1.action = "${pageContext.request.contextPath}/member/delete.do";
												document.form1.submit();
											}
										});
						
						
						
						$("#MyModal").on('show.bs.modal', function() {
							var qb_id = $(event.target).closest("tr").find("td").eq(0).html();// closest
							$("#MyModal .modal-body").load("member_view?m_id="+m_id)
							console.log(qb_id);
						});
						
						
					});