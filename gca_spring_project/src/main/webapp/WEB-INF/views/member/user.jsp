<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html><head>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	</head>
  <body>
    <div class="container">
        	<div class="col-md-4">
        			<div class="thumbnail" >
        				<div  align="center">
								<%-- <img src="${pageContext.request.contextPath}/images/face1.jpg" alt="Marcel Newman" class="img-circle"> --%>
							<h2>{m_id}회원의 프로필</h2>
        							<p><strong>Username:</strong> {m_name}</p>
        							<p><strong>Mail:</strong> {m_email)</p>
        							<p><strong>Location</strong>:{m_location}</p>
        							<p><strong>Address:</strong> Blahblah Ave. 879</p>
        					</div>
        					<hr>
						<div  align="center">
							<h2>Choose Your Option</h2>
						</div>
						<br>
							<div class="info-user2">
								<span aria-hidden="true" class="li_settings fs1"></span>
								<span aria-hidden="true" class="li_lock fs1"></span>
								<span aria-hidden="true" class="li_pen fs1"></span>
							</div>
        				</div><!-- /inner row -->
						
        			</div>
        		</div>
</body>
</html>