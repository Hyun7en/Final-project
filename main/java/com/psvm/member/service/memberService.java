package com.psvm.member.service;

import java.util.ArrayList;

import com.psvm.member.vo.Member;

public interface MemberService {
	
	//로그인
	Member loginMember(Member m);
	
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
	
	//아이디 찾기
	Member findId(Member m);
	
	//인증번호 전송 전 계정 찾기
	int findUser(Member m);
	
	// 비밀번호 변경
	int changePwd(Member m);
}
