package com.psvm.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.psvm.mail.Email;
import com.psvm.member.service.MemberService;
import com.psvm.member.vo.Member;


@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginForm.me") //로그인 페이지 이동
	public String loginFormMember(@RequestParam(value="recentLink") String recentLink, HttpSession session) {
		if (recentLink != "") {
			session.setAttribute("recentLink", recentLink);
		}
		return "member/login";
	}
	
	@RequestMapping("login.me") //로그인
	public ModelAndView loginMember(Member m, @RequestParam(value="recentLink", defaultValue="/") String recentLink, ModelAndView mv, HttpSession session, String saveId, HttpServletResponse response) {
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
	        session.setAttribute("successMessage", "로그인에 성공했습니다!");
	        session.setAttribute("loginUser", loginUser);
	        mv.setViewName("redirect:" + recentLink);
	    }
	    
	    return mv;
	}

	
	@RequestMapping("logout.me") //로그아웃
	public String logoutMember(HttpSession session, HttpServletResponse response) {
		session.removeAttribute("loginUser");
		
		Cookie ck = new Cookie("saveId", null);
	    ck.setMaxAge(0); // 쿠키 즉시 만료
	    ck.setPath("/"); // 쿠키의 유효 경로 설정
	    response.addCookie(ck);
		
	    session.setAttribute("successMessage", "로그아웃되었습니다.");
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
	
	@ResponseBody
	@RequestMapping("nicknameCheck.me") //아이디 중복 확인
	public String nicknameCheck(String checkNickname) {
		
		return memberService.nicknameCheck(checkNickname) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@RequestMapping("emailCheck.me") //아이디 중복 확인
	public String emailCheck(String checkEmail) {
		
		return memberService.emailCheck(checkEmail) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("signUp.me") //회원가입
	public ModelAndView signupMember(Member m, HttpSession session, ModelAndView mv) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.signupMember(m);
		
		if(result > 0) {
			session.setAttribute("successMessage", "회원가입에 성공했습니다!");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMessage", "오류가 발생했습니다.");
	        mv.setViewName("member/signUp");
		}
		
		return mv;
	}
	
	@RequestMapping("findAccount.me") //아이디, 비밀번호 찾기
	public String findAccount() {
		return "member/findAccount";
	}
	
	@RequestMapping("findId.me") // 아이디 찾기
	public ModelAndView findId(Member m, HttpSession session, ModelAndView mv){
		Member findId = memberService.findId(m);
		if(findId != null) {
			session.setAttribute("successMessage", "당신이 찾으시는 아이디는 " + findId.getUserId() + "입니다.");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMessage", "찾으시는 아이디가 없습니다.");
	        mv.setViewName("member/findAccount");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("sendVcode.me") //인증코드 전송
	public String sendVcode(Member m, HttpSession session) {
		System.out.println(m);
		int result = memberService.findUser(m);
		if (result > 0) {
			//인증번호 생성 후 세션에 저장
			session.setAttribute("findUser", m);
			String Vcode = new java.math.BigInteger(48, new java.security.SecureRandom()).toString(32).substring(0, 8);
			System.out.println(Vcode);
			session.setAttribute("Vcode", Vcode);
			Email.sendEmail(m, Vcode);
			return "NNNNN";
		} else {
			return "NNNNY";
		}
	}	
	
	@RequestMapping("findPwd.me") // 인증코드 대조
	public ModelAndView findPwd(String Vcode, HttpSession session, ModelAndView mv) {
		System.out.println(Vcode);
		String KeyCode = (String)session.getAttribute("Vcode");
		if (Vcode.equals(KeyCode)) {
			session.removeAttribute("Vcode");
			mv.setViewName("redirect:/changePwdForm.me");
		} else {
			session.removeAttribute("Vcode");
			mv.addObject("errorMessage", "인증코드가 올바르지 않습니다.");
			mv.setViewName("member/findAccount");
		}
		return mv;
	}
		
	// 비밀번호 변경창 이동 메서드
	@RequestMapping("changePwdForm.me")
	public String changePwdForm() {
		return "member/changePwd";
	}
	
	// 비밀번호 변경 메서드
	@RequestMapping("changePwd.me")
	public ModelAndView changePwd(String newPwd, Model model, HttpSession session, ModelAndView mv) {
		
		Member m = (Member)session.getAttribute("findUser");
		System.out.println(m);
		// 비밀번호 변경
		String encPwd = bcryptPasswordEncoder.encode(newPwd);
		
		m.setUserPwd(encPwd);
		
		int result = memberService.changePwd(m);
		
		if (result > 0) {
			session.removeAttribute("findUser");
			session.setAttribute("successMessage", "새로 입력한 비밀번호로 로그인해주세요.");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMessage", "비밀번호 변경에 실패하였습니다.");
			mv.setViewName("member/changePwd");
		}
		return mv;
	}
}
