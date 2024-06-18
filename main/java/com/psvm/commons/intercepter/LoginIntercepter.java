package com.psvm.commons.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginIntercepter implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//return : true => 기존요청흐름대로 진행(Controller로 이동)
		//return : false => 요청 중단 후 반환
		String recentUrl = request.getRequestURL().toString();
		String recentQuery = request.getQueryString();
		String recentLink;
		if (recentQuery != null) {
			recentLink = recentUrl + "?" + recentQuery;
		} else {
			recentLink = recentUrl;
		}

		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") != null) {
			System.out.println("로그인 확인");
			return true;
		} else {
			System.out.println("로그인 필요");
			session.setAttribute("recentLink", recentLink);
			session.setAttribute("warningMessage", "로그인이 필요한 페이지입니다.");
			response.sendRedirect("loginForm.me?recentLink=" + recentLink);
			return false;
		}

	}
}