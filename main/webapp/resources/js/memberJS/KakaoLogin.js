//카카오로그인
function KakaoLogin() {
    var script = document.createElement('script');
    script.src = "resources/js/memberJS/apikey.js";
    script.onload = function(){
        const javaKey = config2.APIjavaKey;
        console.log(javaKey);
        Kakao.init(javaKey); 
        console.log(Kakao.isInitialized()); 

        Kakao.Auth.login({
            success: function(authObj) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function(response) {
                        const email = response.kakao_account.email;
                        console.log(email); // 이메일 출력

                        // 이메일을 문자열 형태로 전달하여 Controller에 보냄
                        sendEmailToServer(email);
                    },
                    fail: function(error) {
                        console.error(error);
                    }
                });
            },
            fail: function(err) {
                console.error(err);
            }
        });
    }
    document.head.appendChild(script);
}

function sendEmailToServer(email) {
    fetch('/psvm/sendEmailToServer', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email: email })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
        }
        return response.json();
    })
    .then(data => {
        console.log('Success:', data);
        // 이메일 전송 후 /kakaoLogin.me로 리디렉션
        window.location.href = '/psvm/kakaoLogin.me';
    })
    .catch((error) => {
        console.error('Error:', error);
    });
}