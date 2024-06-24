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
	public String home() {
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
