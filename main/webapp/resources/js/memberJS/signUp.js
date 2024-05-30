
$(function(){
    const idInput = document.querySelector("#signup-id");
    document.getElementById("checkResult");
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
            //
            document.getElementById("checkResult").style.color = "#0089FF"
            document.getElementById("checkResult").innerHTML = "5자 이상 입력해야 합니다.";
        }
    }    
})