package com.psvm.example.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.example.Dao.testDao;
import com.psvm.example.vo.test;

@Service
public class psvmService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private testDao testdao;
	
	public ArrayList<test> testService() {
		return testdao.getTest(sqlSession);
	}
}
