package com.psvm.cs.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CsDao {

	
	public int selectListCount(SqlSessionTemplate sqlSession, int boardLevel) {
		return sqlSession.selectOne("csMapper.selectCs", boardLevel);
	}
	
}
