package com.psvm.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.member.vo.Member;

@Repository
public class MemberDao {
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public int signupMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.signupMember", m);
	}
	
	public Member kakaoLogin(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.kakaoLogin", email);
	}
	
}
