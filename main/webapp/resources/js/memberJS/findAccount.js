function sendVcode(){
    const userName = document.querySelector('#pwdNameInput').value;
    const userId = document.querySelector('#pwdIdInput').value;
    const email = document.querySelector('#pwdEmailInput').value;

    console.log("스크립트 테스트");
    console.log(email);
    
    $.ajax({
        url: "sendVcode.me",
        data: {userName: userName, userId: userId, email: email},
        success: function(result){ // 컨트롤러에서 인증번호 전송 받음
            console.log(result);
            if(result == "NNNNN"){ //이메일 있음
                alert("입력하신 이메일로 인증코드를 전송하였습니다. 10분 이내로 인증코드를 입력하여주세요.");
                document.querySelector('#findPwd-submit').disabled = false;
            } else { //이메일 없음
                alert("해당 정보로 가입된 계정이 없습니다.");
            }
        },
        error: function(){
            console.log("테스트 실패");
        }
    })

}

function findPwd(){
    document.querySelector('#findPwd').submit();
}