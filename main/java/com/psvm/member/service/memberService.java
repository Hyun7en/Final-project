package com.psvm.member.service;

import java.util.ArrayList;

import com.psvm.member.vo.Member;

public interface MemberService {
	
	//로그인
	Member loginMember(Member m);
	
	//로그인 유지(쿠키)로 자동 로그인
	Member cookieLogin(String savedUserId);
	
	//아이디 중복확인
	int idCheck(String checkId);
	
	//닉네임 중복확인
	int nicknameCheck(String checkNickname);
	
	//이메일 중복확인
	int emailCheck(String checkEmail);
	
	//회원가입
	int signupMember(Member m);
	
	//카카오 로그인
	Member kakaoLogin(String email);
	
}
