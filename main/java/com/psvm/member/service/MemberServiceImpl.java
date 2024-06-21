package com.psvm.member.service;

import java.util.ArrayList;

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
	public int nicknameCheck(String checkNickname) {
		return memberDao.nicknameCheck(sqlSession, checkNickname);
	}
	
	@Override
	public int emailCheck(String checkEmail) {
		return memberDao.emailCheck(sqlSession, checkEmail);
	}
	
	@Override
	public int signupMember(Member m) {
		return memberDao.signupMember(sqlSession, m);
	}
	
	@Override
	public Member kakaoLogin(String email) {
		return memberDao.kakaoLogin(sqlSession, email);
	}

	@Override
	public Member findId(Member m) {
		return memberDao.findId(sqlSession, m);
	}
	
	@Override
	public int findUser(Member m) {
		return memberDao.findUser(sqlSession, m);
	}
	
	@Override
	public int changePwd(Member m) {
		return memberDao.changePwd(sqlSession, m);
	}
}
