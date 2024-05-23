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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberCSS/signup.css">

</head>
<body>
    <div id="wrap">
        <div id="signup-logo">Aquaqu</div>
        <form action="signup.me" id="signup-input" method="POST">
            * : 필수 입력
            <input type="text" id="signup-id" name="userId" placeholder="아이디"> *
            <input type="password" id="signup-pwd" name="userPwd" placeholder="비밀번호"> *
            <input type="text" id="signup-email" name="email" placeholder="이메일"> *

            <input type="text" id="signup-name" name="name" placeholder="이름"> *
            <input type="text" id="signup-nickname" name="nickname" placeholder="닉네임"> *
            <input type="text" id="signup-birthday" name="birthday" placeholder="생년월일 8자리"> *
            <select name="gender" id="signup-gender">
                <option value="M">남성</option>
                <option value="F">여성</option>
            </select> *
            <input type="text" id="signup-address" name="address" placeholder="주소지"> *
            <input type="text" id="signup-phone" name="phone" placeholder="전화 번호"> *

            <input type="text" id="signup-likeFish" name="likeFish" placeholder="좋아하는 물고기">
            <input type="text" id="signup-tailFish" name="tailFish" placeholder="키우는 물고기">
            <button type="submit">가입하기</button>
        </form>
        
    </div>
</body>
</html>