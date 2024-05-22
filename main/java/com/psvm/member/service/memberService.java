package com.psvm.member.service;

import com.psvm.member.vo.Member;

public interface MemberService {
	
	//로그인
	Member loginMember(Member m);
	
	//아이디 중복확인
	int idCheck(String checkId);
	
	//회원가입
	int signupMember(Member m);
	
	//회원정보 수정
	int updateMember(Member m);
	
	//회원 탈퇴
	int deleteMember(String userId);
}
