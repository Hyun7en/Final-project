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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageChangePwd.css">
    <script src="${pageContext.request.contextPath}/resources/js/myPageJS/myPageChangePwd.js"></script>

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
        <h3>비밀번호 변경</h3>
        <form action="changePwd.my" id="changePwd-input" method="POST">
            <div id="pwdArea">
                <input type="password" id="changePwd-pwd" name="newPwd" placeholder="비밀번호">
                <span>8자 이상, 영어 대소문자와 숫자를 하나씩 사용해야 합니다.</span>
            </div>
            <input type="password" id="check-pwd" placeholder="비밀번호 확인">
            <button type="button" id="changePwd-submit" onclick="changepwdSubmit()">비밀번호 변경</button>
        </form>
    </div>
</body>
</html>