<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린지 히스토리</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- <style>

div.card.bg-warning{
	border-color: #FE9191;
}

div.card.bg-warning div.card-body.text-center{
	background-color:#fff;
	color:#FE9191;
}
</style>

<div class="card bg-warning"> 위 스타일 적용하였던 html 코드.
		<div class="card-body text-center">
			<p class="card-text">Some text inside the second card</p>
		</div>
</div>

-->
<style>

.container > div{
	border: 3px double;
	border-color: #FE9191;
	border-radius: 10px;
	margin-left:8px;
	margin-top:8px;
	padding:10px;
	width: 95%;
	height: 100px;

	background-color: #fff;
}
.container > div:nth-child(2n+1) {
	background-color: white;
}

</style>

</head>
<body>
<div class="container">	
	<div>
		챌린지1s
	</div>
	
	<div>
		챌린지2
	</div>
	
	<div>
		챌린지3
	</div>
</div>
	
</body>
</html>