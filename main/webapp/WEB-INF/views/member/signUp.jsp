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
        <form action="signUp.me" id="signup-input" method="POST">
            <div class="signup-essential">
                <p>필수 입력 항목</p>
                <input type="text" id="signup-id" name="userId" placeholder="아이디(5자 이상)" style="border-top: 2px solid #0089FF; border-bottom: 2px solid #0089FF;" required>
                <div id="checkResult" style="display:none;"></div>
                <input type="password" id="signup-pwd" name="userPwd" placeholder="비밀번호" required>
                <input type="text" id="signup-email" name="email" placeholder="이메일" required>
                <input type="text" id="signup-name" name="userName" placeholder="이름" required>
                <input type="text" id="signup-nickname" name="nickname" placeholder="닉네임" required>
                <input type="text" id="signup-birthday" name="birthday" placeholder="생년월일 8자리" required>
                <select name="gender" id="signup-gender" required>
                    <option value="M">남성</option>
                    <option value="F">여성</option>
                </select>
                <input type="text" id="signup-address" name="address" placeholder="주소지" required>
                <input type="text" id="signup-phone" name="phone" placeholder="전화 번호" required>
            </div>
            <div class="signup-additional">
                <p>선택 입력 항목</p>
                <input type="text" id="signup-likeFish" name="likeFish" placeholder="좋아하는 물고기">
                <input type="text" id="signup-tailFish" name="tailFish" placeholder="키우는 물고기">
            </div>
            <button type="submit" id="signup-submit">가입하기</button>
        </form>
    </div>
    <script>
        $(function(){
            const idInput = document.querySelector("#signup-id");
            let eventFlag;
            idInput.onkeyup = function(ev){
                clearTimeout(eventFlag);
                //키가 눌릴때마다 해당 아이디가 중복이되는지 검사
                //서버에 데이터를 보내서 응답을 받아야한다 -> ajax
                const str = ev.target.value;
                if(str.trim().length >= 5) { // 5글자이상
                    eventFlag = setTimeout(function(){ // 1.5초후에 서버로 check요청 전송
                                    $.ajax({
                                        url: "idCheck.me",
                                        data: {checkId : ev.target.value}, // 체크하고싶은 사용자가 입력한 아이디
                                        success: function(result){
                                            const checkResult = document.getElementById("checkResult");
                                            checkResult.style.display = "block";
                                            
                                            if(result === "NNNNN"){ //사용이 불가한경우
                                                //회원가입버튼 비활성화
                                                document.querySelector("#signup-submit").disabled = true;
                                                
                                                checkResult.style.color = "red";
                                                checkResult.innerText = "이미 사용중인 아이디입니다.";
                                            } else { //사용이 가능한 경우
                                                //회원가입버튼 활성화
                                                document.querySelector("#signup-submit").disabled = false;

                                                checkResult.style.color = "green";
                                                checkResult.innerText = "사용가능한 아이디입니다.";
                                            }
                                        },
                                        error: function(){
                                            console.log("아이디 중복체크 ajax 실패");
                                        }
                                    })
                                }, 300)
                } else { // 5글자이하
                    //disabled상태 유지
                    document.querySelector("#signup-submit").disabled = true;
                    //checkResult 안보이는 상태
                    document.getElementById("checkResult").style.display = "none";
                }
            }    
        })
    </script>
</body>
</html>