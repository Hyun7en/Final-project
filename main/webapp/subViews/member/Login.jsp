<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberCSS/login.css">
</head>
<body>
    <div id="wrap">
        <div id="login-logo">Aquaqu</div>
        <form id="login-input" method="POST">
            <input type="text" id="login-id" name="id" placeholder="아이디">
            <input type="password" id="login-pwd" name="pwd" placeholder="비밀번호">
            <div id="login-staying"><input type="checkbox"  name="staying" value="on"> 로그인 상태 유지</div>
            <button type="submit">로그인</button>
        </form>
        <div id="login-help">
            <a href="#" id="login-help-find">아이디 · 비밀번호 찾기</a>
            <a href="#" id="login-help-signup">회원가입</a>
        </div>
        <div id="login-easy">
            <p>간편 로그인/회원가입</p>
            <button><img src="${pageContext.request.contextPath}/resources/image/kakao_login_large.png" alt="카카오 로그인" ></button>
            <button><img src="${pageContext.request.contextPath}/resources/image/btnG_roundicon.png" alt="네이버 로그인"></button>
        </div>
        <div id="login-notmember">
            <button type="button">비회원 주문배송 조회</button>
        </div>
    </div>
</body>
</html>