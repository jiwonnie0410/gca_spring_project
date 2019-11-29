<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>BLOCKS - Bootstrap Dashboard Theme</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap/bootstrap.min.css" />

    <!-- DATA TABLE CSS -->
    <link href="${pageContext.request.contextPath }/css/table.css" rel="stylesheet">

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>    
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/admin.js"></script>

    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>
        
  	<!-- Google Fonts call. Font Used Open Sans -->
  	<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">

  	<!-- DataTables Initialization -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/datatables/jquery.dataTables.js"></script>
  	<script type="text/javascript" charset="utf-8">
  			    $(document).ready(function () {
  			        $('#dt1').dataTable();
  			    });
	</script>

    
  </head>
  <body>
  
    <div class="container">
<h4><strong>회원목록</strong></h4>

		<table class="display" id="dt1">
        <thead>
          <tr>
            <th>Rendering engine</th>
            <th>Browser</th>
            <th>Platform(s)</th>
            <th>Engine version</th>
            <th>CSS grade</th>
          </tr>
        </thead>
        <tbody>
          <tr class="odd gradeX">
            <td>Trident</td>
            <td>Internet Explorer 4.0</td>
            <td>Win 95+</td>
            <td class="center"> 4</td>
            <td class="center">X</td>
          </tr>
          <tr class="even gradeC">
            <td>Trident</td>
            <td>Internet Explorer 5.0</td>
            <td>Win 95+</td>
            <td class="center">5</td>
            <td class="center">C</td>
          </tr>
          <tr class="odd gradeA">
            <td>Trident</td>
            <td>Internet Explorer 5.5</td>
            <td>Win 95+</td>
            <td class="center">5.5</td>
            <td class="center">A</td>
          </tr>
          <tr class="even gradeA">
            <td>Trident</td>
            <td>Internet Explorer 6</td>
            <td>Win 98+</td>
            <td class="center">6</td>
            <td class="center">A</td>
          </tr>
          <tr class="odd gradeA">
            <td>Trident</td>
            <td>Internet Explorer 7</td>
            <td>Win XP SP2+</td>
            <td class="center">7</td>
            <td class="center">A</td>
          </tr>
          <tr class="even gradeA">
            <td>Trident</td>
            <td>AOL browser (AOL desktop)</td>
            <td>Win XP</td>
            <td class="center">6</td>
            <td class="center">A</td>
          </tr>
          <tr class="gradeA">
            <td>Gecko</td>
            <td>Firefox 1.0</td>
            <td>Win 98+ / OSX.2+</td>
            <td class="center">1.7</td>
            <td class="center">A</td>
          </tr>
          <tr class="gradeA">
            <td>Gecko</td>
            <td>Firefox 1.5</td>
            <td>Win 98+ / OSX.2+</td>
            <td class="center">1.8</td>
            <td class="center">A</td>
          </tr>
          <tr class="gradeA">
            <td>Gecko</td>
            <td>Firefox 2.0</td>
            <td>Win 98+ / OSX.2+</td>
            <td class="center">1.8</td>
            <td class="center">A</td>
          </tr>
          <tr class="gradeA">
            <td>Gecko</td>
            <td>Firefox 3.0</td>
            <td>Win 2k+ / OSX.3+</td>
            <td class="center">1.9</td>
            <td class="center">A</td>
          </tr>
        </tbody>
      </table><!--/END SECOND TABLE -->
		</div><!--/span12 -->
		
      <!-- CONTENT -->
     <div class="container"> 
	<div class="row">
		<div class="col-sm-12 col-lg-12">
			<h4><strong>회원신고</strong></h4>
			  <table class="display">
	          <thead>
	            <tr>
	              <th>Band or Group</th>
	              <th>Name</th>
	              <th>Instrument</th>
	              <th>Influence</th>
	              <th>Awesome</th>
	            </tr>
	          </thead>
	          <tbody>
	            <tr class="odd">
	              <td>Queen</td>
	              <td>Brian May</td>
	              <td>Guitar</td>
	              <td class="center"> 7</td>
	              <td class="center">9</td>
	            </tr>
	            <tr class="even">
	              <td>Queen</td>
	              <td>Roger Taylor</td>
	              <td>Drums</td>
	              <td class="center">5</td>
	              <td class="center">7</td>
	            </tr>
	            <tr class="odd">
	              <td>Beatles</td>
	              <td>Paul McCartney</td>
	              <td>Guitar &amp; Piano</td>
	              <td class="center">8</td>
	              <td class="center">9</td>
	            </tr>
	            <tr class="even">
	              <td>Adele</td>
	              <td>Adele</td>
	              <td>None</td>
	              <td class="center">8</td>
	              <td class="center">8</td>
	            </tr>
	            <tr class="odd">
	              <td>Britney Spears</td>
	              <td>Britney Spears</td>
	              <td>None</td>
	              <td class="center">7</td>
	              <td class="center">-5</td>
	            </tr>
	          </tbody>
	         </table><!--/END First Table -->
			 <br>
			 <!--SECOND Table -->
		</div>	 
      </div><!-- /row -->
     </div> <!-- /container -->
    	<br>	

      
      	<br>


</body></html>