package com.psvm.myPage.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.psvm.myPage.dao.myPageDao;
import com.psvm.myPage.vo.MyInfo;

public class myPageServiceImpl implements myPageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private myPageDao myPageDao;
	

	public ArrayList<MyInfo> selectMyInfo(int userNo){
		return myPageDao.selectMyInfo(sqlSession, userNo);
	}
	
//	public int deleteMember(int userNo) {
//		return myPageDao.deleteMember(sqlSession, userNo);
//	}
	
//	public ArrayList<InterestProduct> selectInterestProduct(int userNo){
//		return myPageDao.selectInterestProduct(sqlSession, userNo);
//	}
	
}
