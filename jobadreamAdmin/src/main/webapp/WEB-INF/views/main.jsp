<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자메인</title>
    <!--부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    
    <!-- 제이쿼리주소 -->
    <script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- 나눔스퀘어 폰트적용 -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
    
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css" type="text/css"/>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
    <div class="container">
        <section class="login" >
            <img src="${contextPath}/resources/images/main/logo.png" alt"">

            <form action="">
                <div class="input-fidle">
                    <input type="text" placeholder=" 아이디를 입력해주세요."  style="height: 25px;margin:10px 0px 10px 0px;"/>
                </div>
                <div class="input-fidle">
                    <input type="password" placeholder=" 비밀번호를 입력해주세요."style="height: 25px;margin:0px 0px 5px 0px;"/>
                </div>
                <div class="button-field">
                    <input type="submit" value="로그인" />
                </div>
            </form>
        </section>
    </div>
</body>
</html>