package com.psvm.myPage.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;

@Repository
public class MyPageDao {
	
	public int modifyInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myPageMapper.modifyInfo", m);
	}
	
	public Member loginUser(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("myPageMapper.loginUser", m);
	}
	
	
	
	
	
	
	
	
	
	public ArrayList<Community> writePostList(SqlSessionTemplate sqlSession, int userNo){
		System.out.println(userNo);
		
		ArrayList result = (ArrayList)sqlSession.selectList("myPageMapper.writePostList", userNo);
		System.out.println(result);
		
		return result;
	}
}
