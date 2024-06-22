function sendVcode(){
    const userName = document.querySelector('#pwdNameInput');
    const userId = document.querySelector('#pwdIdInput');
    const email = document.querySelector('#pwdEmailInput');
    
    alert("입력하신 정보에 해당하는 계정을 조회하는 중입니다. 잠시만 기다려주십시오.");

    $.ajax({
        url: "sendVcode.me",
        data: {userName: userName.value, userId: userId.value, email: email.value},
        success: function(result){ // 컨트롤러에서 인증번호 전송 받음
            console.log(result);
            if(result == "NNNNN"){ //이메일 있음
                userName.readOnly = true;
                userId.readOnly = true;
                email.readOnly = true;
                alert("입력하신 이메일로 인증코드를 전송하였습니다. 인증코드를 확인하신 뒤, 입력하십시오.");
                document.querySelector('#findPwd-submit').disabled = false;
            } else { //이메일 없음
                alert("해당 정보로 가입된 계정이 없습니다.");
            }
        },
        error: function(){
            alert("이메일, 아이디, 이름을 모두 입력하셔야 합니다.");
        }
    })

}

function findPwd(){
    document.querySelector('#findPwd').submit();
}