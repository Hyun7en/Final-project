package com.psvm.myPage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.myPage.vo.ModifyInfo;

@Repository
public class MyPageDao {
	
	public int modifyInfo(SqlSessionTemplate sqlSession, ModifyInfo m) {
		
		return sqlSession.selectOne("myPageMapper.modifyInfo", m);
	}
	
	
}
