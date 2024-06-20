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
    <script src="${pageContext.request.contextPath}/resources/js/memberJS/signUp.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberCSS/signup.css">

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
        <div id="signup-logo">Aquaqu</div>
        <form action="signUp.me" id="signup-input" method="POST">
            <div class="signup-essential">
                <p>필수 입력 항목</p>
                <input type="text" id="signup-id" name="userId" placeholder="아이디" style="border-top: 2px solid #0089FF; border-bottom: 2px solid #0089FF;" maxlength="20">
                <div id="checkResult" style="color: #0089FF; height: 25px;">5자 이상 입력해야 합니다.</div>
                
                <input type="password" id="signup-pwd" name="userPwd" placeholder="비밀번호(8자 이상 입력, 영어 대소문자와 숫자 조합만 가능)">
                <input type="password" id="check-pwd" placeholder="비밀번호 확인">
                <div id="emailArea">
                    <input type="text" id="signup-email" name="email" placeholder="이메일">
                    <span>이메일 형식은 아래의 8가지만 허용됩니다.<br>'@naver.com', '@gmail.com', '@hanmail.net', '@daum.net', '@nate.com', '@hotmail.com', '@icloud.com', '@outlook.com'</span>
                </div>
                <div style="height: 50px; display: flex;">
                    <input type="text" id="signup-name" name="userName" placeholder="이름" maxlength="21">
                    <input type="text" id="signup-nickname" name="nickname" placeholder="닉네임" maxlength="18">
                    
                </div>
                <div style="height: 50px; display: flex">
                    <input type="text" id="signup-birthday" name="birthday" placeholder="생년월일 8자리" maxlength="8" title="YYYYMMDD">
                    <select name="gender" id="signup-gender">
                        <option value="M">성별 : 남성</option>
                        <option value="F">성별 : 여성</option>
                    </select>
                </div>
                <div id="callDaumService" onclick="callDaumService()">
                    <input type="text" placeholder="우편번호 및 주소" id="signup-address" name="address" maxlength="50">
                </div>
                <input type="text" id="signup-address3" name="detail_address" placeholder="상세 주소(선택사항)" maxlength="200">
                <input type="text" id="signup-phone" name="phone" placeholder="전화 번호('-' 없이 입력)" maxlength="11">
            </div>
            <div class="signup-additional">
                <p>선택 입력 항목</p>
                <input type="text" id="signup-likeFish" name="likeFish" placeholder="좋아하는 물고기" maxlength="30">
                <input type="text" id="signup-tailFish" name="tailFish" placeholder="키우는 물고기" maxlength="30">
            </div>
            <button type="button" id="signup-submit" onclick="signUpSubmit()" disabled>가입하기</button>
            <input type="checkbox" style="display: none;" id="checkId">
            <input type="checkbox" style="display: none;" id="checkNickname">
            <input type="checkbox" style="display: none;" id="checkEmail">
        </form>
    </div>
</body>
</html>