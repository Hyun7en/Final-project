package com.psvm.myPage.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.myPage.vo.Inquiry;

@Repository
public class MyPageDao {
	
	public int modifyInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myPageMapper.modifyInfo", m);
	}
	
	public Member loginUser(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("myPageMapper.loginUser", m);
	}
	
	
	
	
	
	
	
	
	
	public ArrayList<Community> writePostList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("myPageMapper.writePostList", userNo);
	}
	
	public ArrayList<Inquiry> inquiryList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("myPageMapper.inquiryList", userNo);
	}
}
