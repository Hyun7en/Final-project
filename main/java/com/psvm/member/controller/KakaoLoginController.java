package com.psvm.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.psvm.member.service.MemberService;
import com.psvm.member.vo.Member;

@Controller
public class KakaoLoginController {
	
	@Autowired
	private MemberService memberService;
	
	@Value("${kakao.clientId}")
	private String clientId;
	
	private String redirectUri = "http://localhost:8888/psvm/kakaoRedirect.me";

    @RequestMapping(value = "/kakaoRedirect.me", method = RequestMethod.GET)
    public String kakaoRedirect(@RequestParam("code") String code, HttpSession session) {
        String accessToken = getAccessToken(code);
        String email = getUserEmail(accessToken);

        session.setAttribute("email", email);

        // 로그인 후 원하는 페이지로 리디렉션
        return "redirect:/kakaoLogin.me";
    }

    private String getAccessToken(String code) {
        RestTemplate restTemplate = new RestTemplate();
        String tokenUrl = UriComponentsBuilder.fromHttpUrl("https://kauth.kakao.com/oauth/token")
                .queryParam("grant_type", "authorization_code")
                .queryParam("client_id", clientId)
                .queryParam("redirect_uri", redirectUri)
                .queryParam("code", code)
                .toUriString();

        @SuppressWarnings("unchecked")
        Map<String, String> response = restTemplate.postForObject(tokenUrl, null, Map.class);
        return response.get("access_token");
    }

    private String getUserEmail(String accessToken) {
        RestTemplate restTemplate = new RestTemplate();
        String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);

        HttpEntity<String> entity = new HttpEntity<>(headers);
        @SuppressWarnings("unchecked")
        Map<String, Object> response = restTemplate.postForObject(userInfoUrl, entity, Map.class);
        Map<String, Object> kakaoAccount = (Map<String, Object>) response.get("kakao_account");
        return (String) kakaoAccount.get("email");
    }

    @RequestMapping(value = "/kakaoLogin.me", method = RequestMethod.GET)
    public ModelAndView kakaoLoginCallback(@RequestParam(name="recentLink", defaultValue="/") String recentLink, ModelAndView mv, HttpSession session, String saveId, HttpServletResponse response) {
        String email = (String)session.getAttribute("email");
    	
        Member loginUser = memberService.kakaoLogin(email);
        
        if (loginUser == null) { // 요청한 이메일에 해당하는 계정이 없는 경우
	        mv.addObject("errorMessage", "해당 서비스는 기존에 가입하신 회원만 이용이 가능합니다.");
	        mv.setViewName("member/login");
        } else { // 성공
	        Cookie ck = new Cookie("saveId", loginUser.getUserId());
	        if (saveId == null) {
	            ck.setMaxAge(0);
	        }
	        response.addCookie(ck);
	        session.setAttribute("successMessage", "로그인에 성공했습니다!");
	        session.setAttribute("loginUser", loginUser);
	        mv.setViewName("redirect:" + recentLink);
	    }
        
	        mv.setViewName("redirect:" + recentLink); // 응답할 뷰의 이름을 반환합니다.
        return mv;
    }
	
}
