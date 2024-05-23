package com.psvm.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.psvm.member.service.MemberService;
import com.psvm.member.vo.Member;


@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginForm.me") //로그인 페이지 이동
	public String loginFormMember() {
		return "member/login";
	}
	
	@RequestMapping("login.me") //로그인
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session, String saveId, HttpServletResponse response) {
	    
	    Member loginUser = memberService.loginMember(m);
	     
	    if (loginUser == null) { // 아이디가 없는 경우
	        mv.addObject("errorMessage", "일치하는 아이디를 찾을 수 없습니다.");
	        mv.setViewName("member/login");
	        
	    } else if (!bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())){ 
	        mv.addObject("errorMessage", "비밀번호가 일치하지 않습니다.");
	        mv.setViewName("member/login");
	    } else { // 성공
	        Cookie ck = new Cookie("saveId", loginUser.getUserId());
	        if (saveId == null) {
	            ck.setMaxAge(0);
	        }
	        response.addCookie(ck);
	        
	        session.setAttribute("loginUser", loginUser);
	        mv.setViewName("main/main");
	    }
	    
	    return mv;
	}

	
	@RequestMapping("logout.me") //로그아웃
	public String logoutMember(HttpSession session) {
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	@RequestMapping("signUpForm.me") //회원가입 페이지 이동
	public String signUpFormMember() {
		return "member/signUp";
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me") //아이디 중복 확인
	public String idCheck(String checkId) {
		
		return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("signUp.me") //회원가입
	public String signupMember(Member m, HttpSession session, Model model) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.signupMember(m);
		
		return "redirect:/";
		
//		if(result > 0) {
//			
//		} else {
//			
//		}
	}
	
	@RequestMapping("update.me") //회원정보 수정
	public String updateMember(Member m, HttpSession session, Model model) {
		
		int result =  memberService.updateMember(m);
		
		return "redirect:/";
		
//		if (result > 0){
//			session.setAttribute("loginUser", memberService.loginMember(m));
//			return "redirect:"; //회원정보 수정 후 이동할 페이지 주소 입력
//		}else {
//			
//		}
	}
	
	@RequestMapping("delete.me") //회원 탈퇴
	public String deleteMember(Member m, HttpSession session) {
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		return "redirect:/";
		
//		if (bcryptPasswordEncoder.matches(m.getUserPwd(), encPwd)) {//암호 일치
//			int result = memberService.deleteMember(m.getUserId());
//			
//			if(result > 0) { //탈퇴 성공
//				session.removeAttribute("loginUser");
//				return "redirect";
//			} else {
//				
//			}
//		} else { //암호 불일치
//			
//		}
	}
	
	
}
