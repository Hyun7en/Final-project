package com.psvm.example.Dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.example.vo.test;

@Repository
public class testDao {
	public ArrayList<test> getTest(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("testMapper.selectTest");
	}
}
