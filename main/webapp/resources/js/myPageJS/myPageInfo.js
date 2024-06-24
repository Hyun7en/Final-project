function change_profileImage(){ // 이미지 변경하러고 "프로필변경" 버튼 눌렀으 때
    document.getElementById("modify-btn").disabled = false;     // 정보수정 버튼 활성화
    document.getElementById("modify-btn").style.backgroundColor = "#000";   // 정보수정 버튼 활성화된 색으로 변경(검정색)
}

function change_nickname() {    // 닉네임 변경하려고 닉네임 입력란 옆에 "변경" 버튼 눌렀을 때
    document.getElementById("modify-btn").disabled = true;      // 정보수정 버튼 비활성화(변경하는 도중 정보수정 버튼 못누르게 하려고)
    document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 비활성화된 색으로 변경(회색)
    document.getElementById("nickname").value = "";     // 닉네임 입력란 공백 처리
    document.getElementById("nickname").placeholder = "닉네임을 입력해주세요."; // 공백 처리하고 placeholder 넣기
    document.getElementById("nickname").readOnly = false;   // 변경할 닉네임 입력할 수 있게 readOnly 비활성화
    document.getElementById("nickname").style.backgroundColor = "white";    // 입력할 수 있다는걸 알려주기 위해 입력란 흰색으로 변경
    document.getElementById("nickname-btn").innerText = "확정"; // 변경할 닉네임 확정할 수 있게 하기위해 버튼 이름 "확정"으로 변경
    document.getElementById("nickname-btn").style.backgroundColor = "#96E6FF";  // "확정" 버튼 색 변경
    document.getElementById("nickname-btn").setAttribute("onclick", "confirm_nickname()");  // 확정 버튼에 다른 onclick속성 부여 
}

function confirm_nickname() {   // 닉네임 변경하려고 "확정" 버튼 눌렀을 때
    if(document.getElementById("nickname").value !== "") {  // 닉네임 입력란이 공백이 아닐 때(공백이면 기능 수행 안되게)
        document.getElementById("nickname-btn-cancel").style.display = "block"; // 취소 버튼 활성화(숨겨진거 보이기)
        document.getElementById("nickname-btn-cancel").style.backgroundColor = "pink";  // 취소버튼 색 변경
        document.getElementById("modify-btn").disabled = false; // 정보수정 버튼 활성화
        document.getElementById("modify-btn").style.backgroundColor = "#000";   // 정보수정 버튼 색 변경
        document.getElementById("nickname").readOnly = true;    // 변경할 닉네임 확정 되었으니 다시 readOnly 활성화
        document.getElementById("nickname").style.backgroundColor = "#96E6FF";  // 확정되었다는 것을 알려주기 위한 색 변경
        document.getElementById("nickname-btn").readOnly = true;    // 확정 되었으니 버튼 readOnly 활성화
        document.getElementById("nickname-btn").innerText = "확정됨";   // 버튼 이름 "확정됨"으로 변경
    } 
}

function change_userIntro() {   // 한줄소개 변경하려고 한줄소개 입력란 옆에 "변경" 버튼 눌렀을 때 (한줄소개는 값이 없어도 되서 if문 없음)
    document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
    document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 비활성화된 색으로 변경(회색)
    document.getElementById("userIntro").value = "";    // 한줄소개 입력란 공백 처리
    document.getElementById("userIntro").placeholder = "한줄소개를 입력해주세요.";  // 공백 처리하고 placeholder 넣기
    document.getElementById("userIntro").readOnly = false;  // 변경할 한줄소개 입력할 수 있게 readOnly 비활성화
    document.getElementById("userIntro").style.backgroundColor = "white";   // 입력할 수 있다는걸 알려주기 위해 입력란 흰색으로 변경
    document.getElementById("userIntro-btn").innerText = "확정";    // 변경할 한줄소개 확정할 수 있게 하기위해 버튼 이름 "확정"으로 변경
    document.getElementById("userIntro-btn").style.backgroundColor = "#96E6FF"; // "확정" 버튼 색 변경
    document.getElementById("userIntro-btn").setAttribute("onclick", "confirm_userIntro()");    // 확정 버튼에 다른 onclick속성 부여
}

function confirm_userIntro() {  // 한줄소개 변경하려고 "확정" 버튼 눌렀을 때
        document.getElementById("intro-btn-cancel").style.display = "block";    // 취소 버튼 활성화(숨겨진거 보이기)
        document.getElementById("intro-btn-cancel").style.backgroundColor = "pink"; // 취소버튼 색 변경
        document.getElementById("modify-btn").disabled = false; // 정보수정 버튼 활성화
        document.getElementById("modify-btn").style.backgroundColor = "#000";   // 정보수정 버튼 색 변경
        document.getElementById("userIntro").readOnly = true;   // 변경할 한줄소개 확정 되었으니 다시 readOnly 활성화
        document.getElementById("userIntro").style.backgroundColor = "#96E6FF"; // 확정되었다는 것을 알려주기 위한 색 변경
        document.getElementById("userIntro-btn").readOnly = true;   // 확정 되었으니 버튼 readOnly 활성화
        document.getElementById("userIntro-btn").innerText = "확정됨";  // 버튼 이름 "확정됨"으로 변경
}

function change_gender() {  // 성별 변경하려고 성별 입력란 옆에 "변경" 버튼 눌렀을 때
    document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
    document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 비활성화된 색으로 변경(회색)

    document.querySelector("#gender-area").innerHTML = "";  // 성별 입력란 공백 처리

    let radios = ('<input type="radio" class="gender" id="gender1" name="gender" checked value="M"> 남' // text타입이 아닌 radios타입으로 성별 '남', '여' 중에 고르게 하는 구조 만듦
                 + '<input type="radio" class="gender" id="gender2" name="gender" value="F"> 여'
                 + '<button type="button" class="change-btn" id="gender-confirm-btn" onclick="confirm_gender()">확정</button>');    // 성별 확정할 수 있는 버튼 
    document.querySelector("#gender-area").innerHTML = radios;  // 공백 처리된 곳에 대입

    document.getElementById("gender-confirm-btn").style.backgroundColor = "#96E6FF";    // "확정" 버튼 색 변경
}

function confirm_gender() { // 성별 변경하려고 "확정" 버튼 눌렀을 때
    document.getElementById("modify-btn").disabled = false; // 정보수정 버튼 비활성화
    document.getElementById("modify-btn").style.backgroundColor = "#000";   // 정보수정 버튼 비활성화된 색으로 변경(회색)


    const selectedGender = document.querySelector('input[name="gender"]:checked').value;    // 체크된 성별 값 가져오기
    document.querySelector("#gender-area").innerHTML = "";  // 성별 선택란 공백 처리

    if(selectedGender === 'M'){ // 선택한 성별이 '남' 일 때
        let text = ('<input type="text" id="gender-display" name="gender-display" value="남">'  // 다시 text타입으로 변경하고 고른 성별 보이게 함
                 + '<input type="hidden" id="gender" name="gender" value="M">'  // 컨트롤러에 보낼 성별 값
                 + '<button type="button" class="change-btn" id="gender-confirmed-btn">확정됨</button>' // 확정됬다는것을 보여주기 위한 "확정됨" 버튼
                 + '<button type="button" class="change-btn" id="gender-btn-cancel" style="display: none;" onclick="cancel_btn(this)">취소</button>');  // 다시 성별 바꿀 수 있는 취소버튼 
        document.querySelector("#gender-area").innerHTML = text;    // 공백 처리된 곳에 대입
    } else if(selectedGender === 'F'){  // 선택한 성별이 '여' 일 때
        let text = ('<input type="text" id="gender-display" name="gender-display" value="여">'  // 다시 text타입으로 변경하고 고른 성별 보이게 함
                 + '<input type="hidden" id="gender" name="gender" value="F">'  // 컨트롤러에 보낼 성별 값
                 + '<button type="button" class="change-btn" id="gender-confirmed-btn">확정됨</button>' // 확정됬다는것을 보여주기 위한 "확정됨" 버튼
                 + ' <button type="button" class="change-btn" id="gender-btn-cancel" style="display: none;" onclick="cancel_btn(this)">취소</button>'); // 다시 성별 바꿀 수 있는 취소버튼 
        document.querySelector("#gender-area").innerHTML = text;    // 공백 처리된 곳에 대입
    }

    document.getElementById("gender-display").disabled= true;   // 보여지는 값('남', '여')은 컨트롤러로 보내지면 안되서 disabled 처리 / ('M', 'F' 값이 넘어가야 함)
    document.getElementById("gender-display").style.backgroundColor = "#96E6FF";    // 확정되었다는 것을 알려주기 위한 색 변경
    document.getElementById("gender-confirmed-btn").style.backgroundColor = "#96E6FF";  // 확정되었다는 것을 알려주기 위한 버튼 색 변경
    document.getElementById("gender-btn-cancel").style.display = "block";   // 취소 버튼 활성화(숨겨진거 보이기)
    document.getElementById("gender-btn-cancel").style.backgroundColor = "pink";    // 취소 버튼 색 변경

}

function change_phone() {   // 연락처 변경하려고 연락처 입력란 옆에 "변경" 버튼 눌렀을 때
    document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
    document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 비활성화된 색으로 변경(회색)
    document.getElementById("phone").value = "";    // 연락처 입력란 공백 처리
    document.getElementById("phone").placeholder = "전화번호를 입력해주세요.";  // 공백 처리하고 placeholder 넣기
    document.getElementById("phone").readOnly = false;  // 변경할 연락처 입력할 수 있게 readOnly 비활성화
    document.getElementById("phone").style.backgroundColor = "white";   // 입력할 수 있다는걸 알려주기 위해 입력란 흰색으로 변경
    document.getElementById("phone-btn").innerText = "확정";    // 변경할 연락처 확정할 수 있게 하기위해 버튼 이름 "확정"으로 변경
    document.getElementById("phone-btn").style.backgroundColor = "#96E6FF"; // "확정" 버튼 색 변경
    document.getElementById("phone-btn").setAttribute("onclick", "confirm_phone()");    // 확정 버튼에 다른 onclick속성 부여 
}

function confirm_phone() {  // 연락처 변경하려고 "확정" 버튼 눌렀을 때
    if(document.getElementById("phone").value !== ""){
        document.getElementById("phone-btn-cancel").style.display = "block";    // 취소 버튼 활성화(숨겨진거 보이기)
        document.getElementById("phone-btn-cancel").style.backgroundColor = "pink"; // 취소버튼 색 변경
        document.getElementById("modify-btn").disabled = false; // 정보수정 버튼 활성화
        document.getElementById("modify-btn").style.backgroundColor = "#000";   // 정보수정 버튼 색 변경
        document.getElementById("phone").readOnly = true;   // 변경할 연락처 확정 되었으니 다시 readOnly 활성화
        document.getElementById("phone").style.backgroundColor = "#96E6FF"; // 확정되었다는 것을 알려주기 위한 색 변경
        document.getElementById("phone-btn").readOnly = true;   // 확정 되었으니 버튼 readOnly 활성화
        document.getElementById("phone-btn").innerText = "확정됨";  // 버튼 이름 "확정됨"으로 변경
    }
}

function change_email() {   // 이메일 변경하려고 이메일 입력란 옆에 "변경" 버튼 눌렀을 때
    document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
    document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 비활성화된 색으로 변경(회색)
    document.getElementById("email").value = "";    // 이메일 입력란 공백 처리
    document.getElementById("email").placeholder = "이메일을 입력해주세요.";    // 공백 처리하고 placeholder 넣기
    document.getElementById("email").readOnly = false;  // 변경할 이메일 입력할 수 있게 readOnly 비활성화
    document.getElementById("email").style.backgroundColor = "white";   // 입력할 수 있다는걸 알려주기 위해 입력란 흰색으로 변경
    document.getElementById("email-btn").innerText = "확정";    // 변경할 이메일 확정할 수 있게 하기위해 버튼 이름 "확정"으로 변경
    document.getElementById("email-btn").style.backgroundColor = "#96E6FF"; // "확정" 버튼 색 변경
    document.getElementById("email-btn").setAttribute("onclick", "confirm_email()");    // 확정 버튼에 다른 onclick속성 부여 
}

function confirm_email() {  // 이메일 변경하려고 "확정" 버튼 눌렀을 때
    if(document.getElementById("email").value !== ""){  // 이메일 입력란이 공백이 아닐 때(공백이면 기능 수행 안되게)
        document.getElementById("email-btn-cancel").style.display = "block";    // 취소 버튼 활성화(숨겨진거 보이기)
        document.getElementById("email-btn-cancel").style.backgroundColor = "pink"; // 취소버튼 색 변경
        document.getElementById("modify-btn").disabled = false; // 정보수정 버튼 활성화
        document.getElementById("modify-btn").style.backgroundColor = "#000";   // 정보수정 버튼 색 변경
        document.getElementById("email").readOnly = true;   // 변경할 이메일 확정 되었으니 다시 readOnly 활성화
        document.getElementById("email").style.backgroundColor = "#96E6FF"; // 확정되었다는 것을 알려주기 위한 색 변경
        document.getElementById("email-btn").readOnly = true;   // 확정 되었으니 버튼 readOnly 활성화
        document.getElementById("email-btn").innerText = "확정됨";  // 버튼 이름 "확정됨"으로 변경
    }
}

function change_address() { // 주소 변경하려고 주소 입력란 옆에 "변경" 버튼 눌렀을 때
    document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
    document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 비활성화된 색으로 변경(회색)
    document.getElementById("address").value = "";  // 주소 입력란 공백 처리
    document.getElementById("address").placeholder = "주소를 입력해주세요.";    // 공백 처리하고 placeholder 넣기
    document.getElementById("address").readOnly = false;    // 변경할 주소 입력할 수 있게 readOnly 비활성화
    document.getElementById("address").style.backgroundColor = "white"; // 입력할 수 있다는걸 알려주기 위해 입력란 흰색으로 변경

    const address2 = ('<td id="address-area2">'
                    + '<input type="text" id="address2" name="address2" style="background-color: white" placeholder="상세주소 입력">'
                    + '</td>');
    document.querySelector("#address-area").innerHTML += address2;

    document.getElementById("address-btn").innerText = "확정";  // 변경할 주소 확정할 수 있게 하기위해 버튼 이름 "확정"으로 변경
    document.getElementById("address-btn").style.backgroundColor = "#96E6FF";   // "확정" 버튼 색 변경
    document.getElementById("address-btn").setAttribute("onclick", "confirm_address()");    // 확정 버튼에 다른 onclick속성 부여 
}

function confirm_address() {    // 주소 변경하려고 "확정" 버튼 눌렀을 때
    if(document.getElementById("address").value !== ""){    // 주소 입력란이 공백이 아닐 때(공백이면 버튼이 안눌려짐)
        document.getElementById("address-btn-cancel").style.display = "block";  // 취소 버튼 활성화(숨겨진거 보이기)
        document.getElementById("address-btn-cancel").style.backgroundColor = "pink";   // 취소버튼 색 변경
        document.getElementById("modify-btn").disabled = false; // 정보수정 버튼 활성화
        document.getElementById("modify-btn").style.backgroundColor = "#000";   // 정보수정 버튼 색 변경

        const address2 = document.getElementById("address2").value;
        document.getElementById("address").value += (" " + address2);
        let address2Element = document.getElementById("address-area2");
        if (address2Element) {
            address2Element.parentNode.removeChild(address2Element);
        }
       
        document.getElementById("address").readOnly = true; // 변경할 주소 확정 되었으니 다시 readOnly 활성화
        document.getElementById("address").style.backgroundColor = "#96E6FF";   // 확정되었다는 것을 알려주기 위한 색 변경
        document.getElementById("address-btn").readOnly = true; // 확정 되었으니 버튼 readOnly 활성화
        document.getElementById("address-btn").innerText = "확정됨";    // 버튼 이름 "확정됨"으로 변경
    }
}

// 프로필 이미지 변경했을 때
function loadImg(imgInputFile){
    console.log(imgInputFile.files.length)

    if(imgInputFile.files.length == 1){
        //파일을 읽어들일 FileReader객체생성
        const reader = new FileReader();

        //파일을 읽어들이는 메소드
        //해당파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
        reader.readAsDataURL(imgInputFile.files[0]);

        //파일 읽어들이기 완료했을 때 실행할 함수 정의
        reader.onload = function(ev){
            document.getElementById("myPage-profile-img").src = ev.target.result;
            console.log(ev.target.result)
        }
    } else{
        document.getElementById("myPage-profile-img").src = null;
    }
}

// 취소 버튼 눌렀을 때
function cancel_btn(cancelBtn){
    if(cancelBtn.id === "nickname-btn-cancel") { // 확정된 닉네임 취소 버튼 눌렀을 때(다시 변경하려고)
        document.getElementById("nickname").readOnly = false;   // 닉네임 입력란 readOnly 비활성화
        document.getElementById("nickname").style.backgroundColor = "white";    // 닉네임 입력란 색 변경 
        document.getElementById("nickname-btn").innerText = "확정"; // 버튼 이름 변경
        document.getElementById("nickname-btn").readOnly = false;   // 버튼 readOnly 비활성화
        // document.getElementById("nickname-btn").setAttribute("onclick", "confirm_nickname()");  // 버튼에 다른 onclick속성 부여
        document.getElementById("nickname-btn-cancel").style.display = "none"   // 취소 버튼 숨기기
        document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
        document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 색 변경

    } else if(cancelBtn.id === "intro-btn-cancel"){ // 확정된 한줄소개 취소 버튼 눌렀을 때(다시 변경하려고)
        document.getElementById("userIntro").readOnly = false;  // 한줄소개 입력란 readOnly 비활성화
        document.getElementById("userIntro").style.backgroundColor = "white";   // 한줄소개 입력란 색 변경 
        document.getElementById("userIntro-btn").innerText = "확정";    // 버튼 이름 변경
        document.getElementById("userIntro-btn").readOnly = false;  // 버튼 readOnly 비활성화
        // document.getElementById("userIntro-btn").setAttribute("onclick", "confirm_userIntro()");
        document.getElementById("intro-btn-cancel").style.display = "none"  // 취소 버튼 숨기기
        document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
        document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 색 변경

    } else if(cancelBtn.id === "gender-btn-cancel"){  // 확정된 성별 취소 버튼 눌렀을 때(다시 변경하려고)
        document.querySelector("#gender-area").innerHTML = "";  // 성별 입력란 공백 처리
        let radios = ('<input type="radio" class="gender" id="gender1" name="gender" checked value="M"> 남' // text타입이 아닌 radios타입으로 성별 '남', '여' 중에 고르게 하는 구조 만듦
                     + '<input type="radio" class="gender" id="gender2" name="gender" value="F"> 여'
                     + '<button type="button" class="change-btn" id="gender-confirm-btn" onclick="confirm_gender()">확정</button>');    // 성별 확정할 수 있는 버튼 
        document.querySelector("#gender-area").innerHTML = radios;  // 공백 처리된 곳에 대입
        document.getElementById("gender-confirm-btn").style.backgroundColor = "#96E6FF";    // "확정" 버튼 색 변경
        document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
        document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 색 변경

    } else if(cancelBtn.id === "phone-btn-cancel"){ // 연락처 변경하려고 "확정" 버튼 눌렀을 때
        document.getElementById("phone").readOnly = false;  // 연락처 입력란 readOnly 비활성화
        document.getElementById("phone").style.backgroundColor = "white";   // 연락처 입력란 색 변경 
        document.getElementById("phone-btn").innerText = "확정";    // 버튼 이름 변경
        document.getElementById("phone-btn").readOnly = false;  // 버튼 readOnly 비활성화
        // document.getElementById("phone-btn").setAttribute("onclick", "confirm_phone()");    
        document.getElementById("phone-btn-cancel").style.display = "none"  // 취소 버튼 숨기기
        document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
        document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 색 변경

    } else if(cancelBtn.id === "email-btn-cancel"){ // 확정된 이메일 취소 버튼 눌렀을 때(다시 변경하려고)
        document.getElementById("email").readOnly = false;  // 이메일 입력란 readOnly 비활성화
        document.getElementById("email").style.backgroundColor = "white";   // 이메일 입력란 색 변경 
        document.getElementById("email-btn").innerText = "확정";    // 버튼 이름 변경
        document.getElementById("email-btn").readOnly = false;  // 버튼 readOnly 비활성화
        // document.getElementById("email-btn").setAttribute("onclick", "confirm_email()");
        document.getElementById("email-btn-cancel").style.display = "none"  // 취소 버튼 숨기기
        document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
        document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 색 변경

    } else if(cancelBtn.id === "address-btn-cancel"){   // 확정된 닉네임 취소 버튼 눌렀을 때(다시 변경하려고)
        const address2 = ('<td id="address-area2">'
            + '<input type="text" id="address2" name="address2" style="background-color: white" placeholder="상세주소 입력">'
            + '</td>');
        document.querySelector("#address-area").innerHTML += address2;

        document.getElementById("address").readOnly = false;    // 닉네임 입력란 readOnly 비활성화
        document.getElementById("address").style.backgroundColor = "white"; // 닉네임 입력란 색 변경 
        document.getElementById("address-btn").innerText = "확정";  // 버튼 이름 변경
        document.getElementById("address-btn").readOnly = false;    // 버튼 readOnly 비활성화



        // document.getElementById("address-btn").setAttribute("onclick", "confirm_address()");
        document.getElementById("address-btn-cancel").style.display = "none"    // 취소 버튼 숨기기
        document.getElementById("modify-btn").disabled = true;  // 정보수정 버튼 비활성화
        document.getElementById("modify-btn").style.backgroundColor = "#eee";   // 정보수정 버튼 색 변경
    }
    
}

// 회원탈퇴 버튼 눌렀을 때 나타나는 모달창
function delete_member_modal(){
    document.getElementById("delete-member-modal").style.display = "flex";
}

// 회원탈퇴 하기 전 비밀번호 확인(ajax)
function password_check(){
    const inputPwd = document.getElementById("inputPwd").value; // 비밀번호 확인에 입력된 값 가져오기
    const loginUserPwd = document.getElementById("loginUserPwd").value; // 회원의 비밀번호 가져오기

    $.ajax({
        url: 'passwordCheck.my',
        type: 'POST',
        data: {
            inputPwd : inputPwd,
            loginUserPwd : loginUserPwd
        },
        success: function(res){
            console.log(res);
            if(res === true){
                document.getElementById("delete-btn").disabled = false; // 탈퇴하기 버튼 활성화
                document.getElementById("delete-btn").style.color = "black";    // 탈퇴하기 버튼 텍스트 색 변경
        
                document.getElementById("warning-text").style.color = "green";  // 텍스트 색 변경
                document.getElementById("warning-text").innerText = "비밀번호가 일치합니다.";  // 텍스트 변경
            } else{
                document.getElementById("warning-text").style.color = "red";    // 텍스트 색 변경
                document.getElementById("warning-text").innerText = "비밀번호가 일치하지 않습니다.";  // 텍스트 변경
            }
        }
    });
}

// 회원탈퇴 모달창에서 탈퇴하기 버튼 눌렀을 때
function delete_member(userNo){
    document.getElementById("delete-member-modal").style.display = "none";  // 모달창 숨기기
    location.href="deleteMember.my?userNo=" + userNo;   // 회원번호 컨트롤러로 넘기기
}

// 회원탈퇴 모달창에서 닫기 버튼 눌렀을때
function close_modal(){
    document.getElementById("inputPwd").value = ""; // 비밀번호 확인 입력란 공백 처리
    document.getElementById("delete-member-modal").style.display = "none";  // 모달창 숨기기
    document.getElementById("warning-text").style.color = "red";    // 텍스트 색 변경
    document.getElementById("warning-text").innerText = "* 회원 탈퇴 시, 복구가 불가능합니다."; // 텍스트 변경
    document.getElementById("delete-btn").disabled = true;  // 회원탈퇴 버튼 비활성화
    document.getElementById("delete-btn").style.color = "#d0d0d0";  // 회원탈퇴 버튼 텍스트 색 변경
}

//비밀번호 변경창 이동용 버튼
function passwordCheck(){
    const inputPwd = document.getElementById("userPwd").value;
    const loginUserPwd = document.getElementById("loginUserPwd").value;

    $.ajax({
        url: 'passwordCheck.my',
        type: 'POST',
        data: {
            inputPwd : inputPwd,
            loginUserPwd : loginUserPwd
        },
        success: function(res){
            console.log(res);
            if(res === true){
                document.getElementById("change-pwd-modal").style.display = "flex";
            } else{
                callErrorMsg("비밀번호가 일치하지 않습니다.");
            }
        }  
    });
}

// 비밀번호 변경 모달창에서 결정 버튼 누름
function new_password_check(){
    const inputNewPwd = document.getElementById('inputNewPwd');
    const inputChkPwd = document.getElementById('inputChkPwd');
    if(inputNewPwd.value == ""){ //비밀번호 누락
        document.getElementById("notice-text").style.color = "red";
        document.getElementById("notice-text").innerText = "비밀번호를 입력하세요.";
    } else if (inputNewPwd.value != inputChkPwd.value){
        document.getElementById("notice-text").style.color = "red";
        document.getElementById("notice-text").innerText = "비밀번호가 일치하지 않습니다.";
    } else{
        inputNewPwd.readOnly = true;
        inputChkPwd.readOnly = true;
        document.getElementById("confirm-btn").innerText = "취소"
        document.getElementById("confirm-btn").setAttribute("onclick", "password_reset()");

        document.getElementById("changePwd-btn").disabled = false;
        document.getElementById("changePwd-btn").style.color = "black";

        document.getElementById("notice-text").style.color = "green";
        document.getElementById("notice-text").innerText = "다시 입력하고 싶으시면 취소 버튼을 눌러주세요.";
    }
}

// 비밀번호 변경 모달창에서 새 비밀번호 재입력
function password_reset(){
    document.getElementById('inputNewPwd').value = "";
    document.getElementById('inputNewPwd').readOnly = false;

    document.getElementById('inputChkPwd').value = "";
    document.getElementById('inputChkPwd').readOnly = false;

    document.getElementById("confirm-btn").innerHTML = "결정"
    document.getElementById("confirm-btn").setAttribute("onclick", "new_password_check()");

    document.getElementById("notice-text").style.color = "black";
    document.getElementById("notice-text").innerText = "";

    document.getElementById("changePwd-btn").disabled = true;
    document.getElementById("changePwd-btn").style.color = "#d0d0d0";
}

// 비밀번호 변경 모달창에서 변경하기 버튼 눌렀을 때
function change_pwd(userNo){
    const userPwd = document.getElementById('inputNewPwd').value;
    document.getElementById("change-pwd-modal").style.display = "none";
    location.href="changePwd.my?userNo=" + userNo + "&userPwd=" + userPwd;
}

// 비밀번호 변경에서 닫기 버튼 눌렀을때
function close_pwd_modal(){
    document.getElementById("change-pwd-modal").style.display = "none";
    
    document.getElementById("inputNewPwd").value = "";
    document.getElementById("inputNewPwd").readOnly = false;

    document.getElementById('inputChkPwd').value = "";
    document.getElementById('inputChkPwd').readOnly = false;

    document.getElementById("confirm-btn").innerHTML = "결정"
    document.getElementById("confirm-btn").setAttribute("onclick", "new_password_check()");

    document.getElementById("notice-text").style.color = "black";
    document.getElementById("notice-text").innerText = "";

    document.getElementById("changePwd-btn").disabled = true;
    document.getElementById("changePwd-btn").style.color = "#d0d0d0";
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

function callDaumService() { //다음 주소 API
    new daum.Postcode({
        theme: themeObj,
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address').value = data.zonecode + ' ' + addr;
            document.getElementById("address").value += extraAddr;
        }
    }).open();
}
var themeObj = { //다음 주소 API 테마
    bgColor: "#E0F1FF", //바탕 배경색
    //searchBgColor: "", //검색창 배경색
    //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
    pageBgColor: "#E0F1FF", //페이지 배경색
    textColor: "", //기본 글자색
    queryTextColor: "", //검색창 글자색
    postcodeTextColor: "#0089FF", //우편번호 글자색
    emphTextColor: "#008BD3", //강조 글자색
    outlineColor: "#0089FF" //테두리
};

