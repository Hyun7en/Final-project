package com.psvm.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.member.vo.Member;

@Repository
public class MemberDao {
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public Member cookieLogin(SqlSessionTemplate sqlSession, String savedUserId) {
		return sqlSession.selectOne("memberMapper.cookieLogin", savedUserId);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public int nicknameCheck(SqlSessionTemplate sqlSession, String checkNickname) {
		return sqlSession.selectOne("memberMapper.nicknameCheck", checkNickname);
	}
	
	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		return sqlSession.selectOne("memberMapper.emailCheck", checkEmail);
	}
	
	public int signupMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.signupMember", m);
	}
	
	public Member kakaoLogin(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.kakaoLogin", email);
	}
	
	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}
	
	public int findUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findUser", m);
	}
	
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.changePwd", m);
	}
}
