<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberCSS/findAccount.css">
    <script src="${pageContext.request.contextPath}/resources/js/memberJS/findAccount.js"></script>
</head>
<body>
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
    <div id="wrap">
        <h1>아이디 / 비밀번호 찾기</h1>
        <div id="find-area">
            <div id="find-id-area">
                <form action="findId.me" method="post">
                    <input id="idNameInput" type="text" name="userName" placeholder="이름">
                    <input id="idBirthdayInput" type="text" name="birthday" placeholder="생년월일 8자리">
                    <input id="idEmailInput" type="text" name="email" placeholder="이메일">

                    <button id="findId" type="submit">아이디 찾기</button>
                </form>
            </div>
            <div id="find-pwd-area">
                
                    <input id="pwdNameInput" type="text" name="userName" placeholder="이름" required>
                    <input id="pwdIdInput" type="text" name="userId" placeholder="아이디" required>
                    <input id="pwdEmailInput" type="text" name="email" placeholder="이메일" required>

                    <button type="button" onclick="sendVcode()">인증번호 받기</button>
                <form action="findPwd.me" id="findPwd" method="post">
                    <input id="vcodeInput" type="text" name="Vcode" placeholder="인증번호" required>
                    
                    <button type="button" id="findPwd-submit" onclick="findPwd()" disabled>비밀번호 찾기</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>