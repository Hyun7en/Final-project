package com.psvm.member.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.psvm.member.service.MemberService;
import com.psvm.member.vo.Member;

@Controller
public class KakaoLoginController {
	
	@Autowired
	private MemberService memberService;
	
	private String userEmail;
	
	@RequestMapping(value = "/psvm/kakaoLogin.me", method = RequestMethod.GET)
	public ModelAndView kakaoLoginCallback(@RequestParam(name="recentLink", defaultValue="/") String recentLink, ModelAndView mv, HttpSession session, String saveId, HttpServletResponse response) {
		Member loginUser = memberService.kakaoLogin(userEmail);
		
		if (loginUser == null) { // 이메일이 없는 경우
	        mv.addObject("errorMessage", "해당 서비스는 회원가입을 한 고객만 이용이 가능합니다.");
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
	    
	    return mv;
	}
	
	@RequestMapping(value = "/psvm/sendEmailToServer", method = RequestMethod.POST)
    public void receiveEmail(@RequestBody Map<String, String> requestBody) {
        userEmail = requestBody.get("email");
    }
	
}
