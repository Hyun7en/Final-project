//카카오로그인
function KakaoLogin() {
    var script = document.createElement('script');
    script.src = "resources/js/memberJS/apikey.js";
    script.onload = function(){
        const javaKey = config2.APIjavaKey;
        console.log(javaKey);
        Kakao.init(javaKey); 
        console.log(Kakao.isInitialized()); 
        
        Kakao.Auth.authorize({
            redirectUri: 'http://localhost:8888/psvm/kakaoRedirect.me'
        });
    }
    document.head.appendChild(script);
}