function changepwdSubmit(){
    const userPwd = document.querySelector('#changePwd-pwd').value;
    const checkPwd = document.querySelector('#check-pwd').value;
    const changePwd = document.querySelector('#changePwd-input');

    if(isValidPwd(userPwd) == false){ //비밀번호 정규식
        callErrorMsg("올바른 형식의 비밀번호가 아닙니다.")
        return false;
    } else if(userPwd != checkPwd){ //비밀번호 확인 불일치
        callErrorMsg("비밀번호가 일치하지 않습니다.")
        return false;
    } else{
        changePwd.submit();
    }
}

//비밀번호 정규식: 8자리 이상의 영어 대소문자 및 숫자 조합
function isValidPwd(userPwd) {
    // 정규 표현식 생성: 
    const pwdPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
    // 정규 표현식을 사용하여 생년월일 형식 검사
    if (!pwdPattern.test(userPwd)) {
        console.log("비밀번호 정규식 오류");
        return false;
    }
}

//오류 메시지
function callErrorMsg(errMsg){
    var errorMessage = errMsg;
    if (errorMessage) {
        Swal.fire({
            icon: 'error',
            title: 'Error!',
            html: errorMessage
        });
    }
}