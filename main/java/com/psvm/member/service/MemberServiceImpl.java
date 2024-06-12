package com.psvm.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.member.dao.MemberDao;
import com.psvm.member.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	
	@Override
	public int signupMember(Member m) {
		return memberDao.signupMember(sqlSession, m);
	}
	
	@Override
	public Member kakaoLogin(String email) {
		return memberDao.kakaoLogin(sqlSession, email);
	}
}
