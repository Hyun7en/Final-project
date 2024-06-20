<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberCSS/login.css">
    <script src="${pageContext.request.contextPath}/resources/js/memberJS/login.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>

    <!-- naver login -->
    <script src="${pageContext.request.contextPath}/resources/js/memberJS/NaverLogin.js"></script>

    <!-- kakao login -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/memberJS/KakaoLogin.js"></script>

   
</head>
<body>
	<!-- 에러메세지 -->
	<c:if test="${ not empty errorMessage}">
		<script>
			var errorMessage = "${errorMessage}";
		    if (errorMessage) {
		        Swal.fire({
		            icon: 'error',
		            title: 'Error!',
		            html: errorMessage
		        });
		    }
		</script>
		<c:remove var="errorMessage" scope="session"/>
	</c:if>
    <c:if test="${ not empty warningMessage}">
		<script>
			var warningMessage = "${warningMessage}";
		    if (warningMessage) {
		        Swal.fire({
		            icon: 'warning',
		            title: '로그인',
		            html: warningMessage
		        });
		    }
		</script>
		<c:remove var="warningMessage" scope="session"/>
	</c:if>
    <div id="wrap">
        <div id="login-logo">Aquaqu</div>
        <form action="login.me" id="login-input" method="POST">
            <input type="hidden" name="recentLink" value="${recentLink}">
            <input type="text" id="login-id" name="userId" placeholder="아이디" required>
            <input type="password" id="login-pwd" name="userPwd" placeholder="비밀번호" required> 
            <div id="login-staying"><input type="checkbox" name="staying" value="on"> 로그인 상태 유지</div>
            <button type="submit">로그인</button>
        </form>
        <div id="login-help">
            <a href="" id="login-help-find">아이디 · 비밀번호 찾기</a>
            <a href="signUpForm.me" id="login-help-signup">회원가입</a>
        </div>
        <div id="login-naver">
            <p>네이버 아이디로 로그인/회원가입</p>
            <button onclick="NaverLogin()"><img src="${pageContext.request.contextPath}/resources/image/btnG_rectangle.png" alt="네이버 로그인"></button>
        </div>
        <div id="login-kakao">
            <p>카카오 아이디로 로그인(기존의 회원만 가능)</p>
            <button onclick="KakaoLogin()"><img src="${pageContext.request.contextPath}/resources/image/kakao_login_medium_narrow.png" alt="카카오 로그인" ></button>
        </div>
    </div>
</body>
</html>