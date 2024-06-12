//네이버로그인설정
function NaverLogin(){
    var script = document.createElement('script');
    script.src = "resources/js/memberJS/apikey.js";
    script.onload = function(){
        const clientId = config.APIclientId;
        
        //리다이렉트 URI를 utf-8로 인코딩해서 저장
        const redirectURI = encodeURIComponent("http://localhost:8888/psvm/naverLogin.me");

        const state = Math.random().toString(36).substring(2);
        
        //로그인 api url
        const apiURL = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&'
            + 'client_id=' + clientId + "&redirect_uri=" + redirectURI + '&state=' + state;
        
        location.href = apiURL;
    };
    document.head.appendChild(script);
}