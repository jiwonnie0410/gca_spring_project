<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
    <head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
        <title>게시판</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script src="//cdn.ckeditor.com/4.7.1/basic/ckeditor.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                 
                CKEDITOR.replace( 'content' );
                CKEDITOR.config.height = 500;
                 
                $("#list").click(function(){
                    location.href = "/board/list";
                });
                 
                $("#save").click(function(){
                     
                    //에디터 내용 가져옴
                    var content = CKEDITOR.instances.content.getData();
                     
                    //널 검사
                    if($("#subject").val().trim() == ""){
                        alert("제목을 입력하세요.");
                        $("#subject").focus();
                        return false;
                    }
                     
                    if($("#writer").val().trim() == ""){
                        alert("작성자를 입력하세요.");
                        $("#writer").focus();
                        return false;
                    }
                     
                });
            });
       
        </script>
        
 
    </head>
    <body>
        <input type="hidden" id="board_id" name="board_id" value="${boardView.id}" />
        <div align="center">
        <h1>홍보게시판 작성</h1>
            </br>
            </br>
            <div class=”table-responsive“>
            <table class="table" style="padding-left: 10%; padding-right: 10%">
                <tr>
                    <td> 제목: 
                     <input type="text" id="subject" name="subject" style="width:90%;" placeholder="제목" value="${boardView.subject}"/>
                     <td> 작성자:
                    <input type="text" id="writer" name="writer"  maxlength="10" placeholder="작성자" value="${boardView.writer}"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="content" id="content" rows="10" cols="80">${boardView.content}</textarea>
                    </td>
                </tr>
                </table>
                </div>
                <div align="center">
                    
                     <button class="btn btn-primary px-5 py-3" id="save" name="save">저장</button>
                        <button class="btn btn-primary px-5 py-3" id="list" name="list">게시판</button>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
</html>
