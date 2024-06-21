function change_profileImage(){
    document.getElementById("modify-btn").disabled = false;
    document.getElementById("modify-btn").style.backgroundColor = "#000";
}

function change_nickname() {
    document.getElementById("nickname").readOnly = false;
    document.getElementById("nickname").style.backgroundColor = "white";
    document.getElementById("nickname-btn").innerText = "확정";
    document.getElementById("nickname-btn").style.backgroundColor = "#96E6FF";
    document.getElementById("nickname-btn").setAttribute("onclick", "confirm_nickname()");
}

function confirm_nickname() {
    document.getElementById("modify-btn").disabled = false;
    document.getElementById("modify-btn").style.backgroundColor = "#000";
    document.getElementById("nickname").readOnly = true;
    document.getElementById("nickname").style.backgroundColor = "#96E6FF";
    document.getElementById("nickname-btn").disabled = true;
    document.getElementById("nickname-btn").innerText = "확정됨";
    document.getElementById("nickname-btn").style.color = "#000";
}

function change_userIntro() {
    document.getElementById("userIntro").readOnly = false;
    document.getElementById("userIntro").style.backgroundColor = "white";
    document.getElementById("userIntro-btn").innerText = "확정";
    document.getElementById("userIntro-btn").style.backgroundColor = "#96E6FF";
    document.getElementById("userIntro-btn").setAttribute("onclick", "confirm_userIntro()");
}

function confirm_userIntro() {
    document.getElementById("modify-btn").disabled = false;
    document.getElementById("modify-btn").style.backgroundColor = "#000";
    document.getElementById("userIntro").readOnly = true;
    document.getElementById("userIntro").style.backgroundColor = "#96E6FF";
    document.getElementById("userIntro-btn").disabled = true;
    document.getElementById("userIntro-btn").innerText = "확정됨";
    document.getElementById("userIntro-btn").style.color = "#000";
}

function change_gender() {
    document.getElementById("gender-display").style.display = "none";
    document.getElementById("gender-change-btn").style.display = "none";
    document.getElementById("gender").disabled = true;

    document.querySelector("#gender-area").innerHTML = "";

    let radios = ('<input type="radio" class="gender" id="gender1" name="gender" checked value="M"> 남'
                 + '<input type="radio" class="gender" id="gender2" name="gender" value="F"> 여'
                 + '<button type="button" class="change-btn" id="gender-confirm-btn" onclick="confirm_gender()">확정</button>');
    document.querySelector("#gender-area").innerHTML = radios;

    document.getElementById("gender-confirm-btn").style.backgroundColor = "#96E6FF";
}

function confirm_gender() {
    document.getElementById("modify-btn").disabled = false;
    document.getElementById("modify-btn").style.backgroundColor = "#000";

    const selectedGender = document.querySelector('input[name="gender"]:checked').value;
    document.querySelector("#gender-area").innerHTML = "";

    if(selectedGender === 'M'){
        let text = ('<input type="text" id="gender-display" name="gender-display" value="남">'
                 + '<input type="hidden" id="gender" name="gender" value="M">'
                 + '<button type="button" class="change-btn" id="gender-confirmed-btn">확정됨</button>');
        document.querySelector("#gender-area").innerHTML = text;
    } else if(selectedGender === 'F'){
        let text = ('<input type="text" id="gender-display" name="gender-display" value="여">'
                 + '<input type="hidden" id="gender" name="gender" value="F">'
                 + '<button type="button" class="change-btn" id="gender-confirmed-btn">확정됨</button>');
        document.querySelector("#gender-area").innerHTML = text;
    }

    document.getElementById("gender-display").readOnly= true;
    document.getElementById("gender-display").style.backgroundColor = "#96E6FF";
    document.getElementById("gender-confirmed-btn").style.backgroundColor = "#96E6FF";
}

function change_phone() {
    document.getElementById("phone").readOnly = false;
    document.getElementById("phone").style.backgroundColor = "white";
    document.getElementById("phone-btn").innerText = "확정";
    document.getElementById("phone-btn").style.backgroundColor = "#96E6FF";
    document.getElementById("phone-btn").setAttribute("onclick", "confirm_phone()");
}

function confirm_phone() {
    document.getElementById("modify-btn").disabled = false;
    document.getElementById("modify-btn").style.backgroundColor = "#000";
    document.getElementById("phone").readOnly = true;
    document.getElementById("phone").style.backgroundColor = "#96E6FF";
    document.getElementById("phone-btn").disabled = true;
    document.getElementById("phone-btn").innerText = "확정됨";
    document.getElementById("phone-btn").style.color = "#000";
}

function change_email() {
    document.getElementById("email").readOnly = false;
    document.getElementById("email").style.backgroundColor = "white";
    document.getElementById("email-btn").innerText = "확정";
    document.getElementById("email-btn").style.backgroundColor = "#96E6FF";
    document.getElementById("email-btn").setAttribute("onclick", "confirm_email()");
}

function confirm_email() {
    document.getElementById("modify-btn").disabled = false;
    document.getElementById("modify-btn").style.backgroundColor = "#000";
    document.getElementById("email").readOnly = true;
    document.getElementById("email").style.backgroundColor = "#96E6FF";
    document.getElementById("email-btn").disabled = true;
    document.getElementById("email-btn").innerText = "확정됨";
    document.getElementById("email-btn").style.color = "#000";
}

function change_address() {
    document.getElementById("address").readOnly = false;
    document.getElementById("address").style.backgroundColor = "white";
    document.getElementById("address-btn").innerText = "확정";
    document.getElementById("address-btn").style.backgroundColor = "#96E6FF";
    document.getElementById("address-btn").setAttribute("onclick", "confirm_address()");
}

function confirm_address() {
    document.getElementById("modify-btn").disabled = false;
    document.getElementById("modify-btn").style.backgroundColor = "#000";
    document.getElementById("address").readOnly = true;
    document.getElementById("address").style.backgroundColor = "#96E6FF";
    document.getElementById("address-btn").disabled = true;
    document.getElementById("address-btn").innerText = "확정됨";
    document.getElementById("address-btn").style.color = "#000";
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

// 회원탈퇴 버튼 눌렀을 때 나타나는 모달창
function delete_member_modal(){
    document.getElementById("delete-member-modal").style.display = "flex";
}

// 회원탈퇴 하기 전 비밀번호 확인(ajax)
function password_check(){
    const inputPwd = document.getElementById("inputPwd").value;
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
                document.getElementById("delete-btn").disabled = false;
                document.getElementById("delete-btn").style.color = "black";
        
                document.getElementById("warning-text").style.color = "green";
                document.getElementById("warning-text").innerText = "비밀번호가 일치합니다.";
            } else{
                document.getElementById("warning-text").style.color = "red";
                document.getElementById("warning-text").innerText = "비밀번호가 일치하지 않습니다.";
            }
        }
    });
}

// 회원탈퇴 모달창에서 탈퇴하기 버튼 눌렀을 때
function delete_member(userNo){
    document.getElementById("delete-member-modal").style.display = "none";
    location.href="deleteMember.my?userNo=" + userNo;
}
// 회원탈퇴 모달창에서 닫기 버튼 눌렀을때
function close_modal(){
    document.getElementById("inputPwd").value = "";
    document.getElementById("delete-member-modal").style.display = "none";
    document.getElementById("warning-text").style.color = "red";
    document.getElementById("warning-text").innerText = "* 회원 탈퇴 시, 복구가 불가능합니다.";
    document.getElementById("delete-btn").disabled = true;
    document.getElementById("delete-btn").style.color = "#d0d0d0";
}

//비밀번호 변경창 이동용 버튼
function passwordCheck(){
    const inputPwd = document.getElementById("userPwd").value;
    location.href = "passwordCheck.my?inputPwd=" + inputPwd;
}