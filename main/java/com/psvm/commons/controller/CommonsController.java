package com.psvm.commons.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.psvm.member.service.MemberService;
import com.psvm.member.vo.Member;

@Controller
public class CommonsController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("home.ma")
	public String home(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			Cookie[] cookies = request.getCookies();
			System.out.println("쿠키 탐색");
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookie.getName().equals("saveId")) {
		                String savedUserId = cookie.getValue();
		                System.out.println("쿠키 발견 : " + savedUserId);
		                // 데이터베이스에서 사용자 정보를 조회
		                Member loginUser = memberService.cookieLogin(savedUserId);
		                
		                if (loginUser != null) {
		                    session.setAttribute("loginUser", loginUser);
		                    System.out.println("쿠키로 로그인 성공");
		                }
		                break;
		            }
		        }
		    }
		}
		return "redirect:/";
	}

	
	@GetMapping("quration.ma")
	public String quration() {
		return "curation/curation";
	}
	
	@GetMapping("community.ma")
	public String community() {
		return "community/community";
	}
	
}
