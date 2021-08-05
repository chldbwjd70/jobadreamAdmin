<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<!--부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">



<!-- 나눔스퀘어 폰트적용 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
div {
	box-sizing: border-box;
}
.container {
	width: 1200px;
	padding: 0%;
}
.header {
	height: 200px;
}
/* 헤더 잡아드림 관리자 페이지 */
.header-1 {
	height: 130px;
	background-color: #4d61c4;
	color: white;
	text-align: center;
	line-height: 130px;
	font-size: 40px;
}
/* 회원관리,게시판관리,1:1문의,신고  박스*/
.header-2 {
	height: 70px;
	line-height: 70px;
	margin: auto;
	background-color: #f3f3f3;
	text-align: center;
}
/* 회원관리,게시판관리,1:1문의,신고  텍스트*/
.header2-text {
	text-align: center;
	color: black;
	font-size: 17px;
	border-style: none;
	text-decoration: none;
	/* 	padding-left: 20px;
	padding-right: 20px; */
}

.header-2 a:hover {
	color: #45aaff;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="header-1" id="hd-1">
				<strong>job아드림 관리자 페이지</strong>
				<a type="button" id="pw" class="btn btn-primary" href="${contextPath}/member/logout">로그아웃</a>
			</div>

			<div class="header-2" id="hd-2">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="row">
							<a href="memberList" class="header2-text col-md-3" id="hd2-1">회원관리</a> 
							<a href="boardList" class="header2-text col-md-3" id="hd2-2">게시판관리</a> 
							<a href="#" class="header2-text col-md-3" id="hd3-3">1:1문의</a>
							<a href="#" class="header2-text col-md-3" id="hd4-4">신고</a>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

<!-- 제이쿼리주소 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>	
</body>
</html>
