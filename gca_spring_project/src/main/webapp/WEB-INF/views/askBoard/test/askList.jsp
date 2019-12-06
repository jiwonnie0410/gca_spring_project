<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
    <head>
        <title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath} /css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">

<%-- jQuery CDN --%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 <!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
   <style>
    table{
     table-layout:fixed;
}
    .autocut{
     text-overflow:ellipsis;
     overflow:hidden;
     white-space: nowrap;
     align="center"
}
    </style>
</head>
    
    <body>
        <!-- <form class="form-inline" id="frmSearch" action="/board/list"> -->
        <form  id="frmSearch" action="/board/list">
            <input type="hidden" id="startPage" name="startPage" value=""><!-- 페이징을 위한 hidden타입 추가 -->
            <input type="hidden" id="visiblePages" name="visiblePages" value=""><!-- 페이징을 위한 hidden타입 추가 -->
            <div align="center">
              <div class="jumbotron" s>
				<h2>문의 사항</h2>
				<p>* 문의 사항.</p>
			 </div>
                <div align="center" style="padding-right:3%;padding-left:3%;">
				 <div align="right"> 
					<button class="btn btn-primary px-4 py-3" type="button"   data-toggle="modal" data-target="#myModal" >Write</button><!-- data-target="#myModal" -->
				</div>
				<br>
				<div class=”table-responsive“>
                <table class="table" >
                	<thead>
	                   <tr>
							<th ><center>#</center></th>
							<th ><center>ID</center></th>
							<th ><center>Title</center></th>
					 </tr>
			       </thead>	
			      <%--  <tbody>		
			       		 <c:choose>
                        <c:when test="${fn:length(boardList) == 0}"> 
                            <tr>
                                <td colspan="4" align="center">
                                    	조회결과가 없습니다.
                                </td>
                            </tr>
                       </c:when>
                        <c:otherwise>
                            <c:forEach var="boardList" items="${boardList}" varStatus="status">  --%>
                                <tr>
                                    <td align="center">1</td>
                                    <td align="center">진뇽</td>
                                    <td class="autocut" >진뇽이다</td>
                                </tr>
                </table>
                </div>
                </div>
                <br>
            </div>
        </form>
    <!-- Modal -->
  	<div class="modal fade" id="myModal" role="dialog" >
    	<div class="modal-dialog modal-lg">
    
      	<!-- Modal content-->
      	<div class="modal-content">
        <div class="modal-body">
			<div class="panel-group">
			<div class="panel panel-success" style="margin-top: 10px;">
				<div class="panel-heading">문의   <button type="button" class="close" data-dismiss="modal">&times;</button></div>
				<div class="panel-body">
					<%-- form --%>
					<form class="form-horizontal" role="form" action="${review_write}" method="post">
						<div class="form-group">
							<label class="control-label col-sm-2">작성자(ID):</label>
							<div class="col-sm-10">
								<input type="hidden" id="board_id" name="board_id" value="${boardView.writer}" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">제목:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="review_title" name="review_title" placeholder="Title">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">내용:</label>
							<div class="col-sm-10">
								 <textarea name="content" id="content" rows="10" cols="40">${boardView.content}</textarea>
							</div>
						</div>
				
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-success px-3 py-2">작 성</button>
								<button type="reset" class="btn btn-danger px-3 py-2">초기화</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info px-3 py-2" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
<!--   <!-- Modal2 _ read review -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">문의 사항 읽기</h4>
        </div>
        <div class="modal-body">
          <textarea rows="10" class="form-control" readonly="readonly" id="content"></textarea>	
        </div>
        <div class="modal-footer">
        						
          <button type="button" class="btn btn-danger" onclick="review_delete()">Delete</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	
        </div>
      </div>
      
    </div>
  </div>
	
</body>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath }/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath }/js/aos.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath }/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="${pageContext.request.contextPath }/js/google-map.js"></script>
<script src="${pageContext.request.contextPath }/js/main.js"></script>
</html>
