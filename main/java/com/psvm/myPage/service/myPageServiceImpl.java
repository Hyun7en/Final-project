package com.psvm.myPage.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.myPage.dao.MyPageDao;
import com.psvm.myPage.vo.MyInfo;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyPageDao myPageDao;
	

	public ArrayList<MyInfo> selectMyInfo(int userNo){
//		return myPageDao.selectMyInfo(sqlSession, userNo);
		return null;
	}
	
//	public int deleteMember(int userNo) {
//		return myPageDao.deleteMember(sqlSession, userNo);
//	}
	
//	public ArrayList<InterestProduct> selectInterestProduct(int userNo){
//		return myPageDao.selectInterestProduct(sqlSession, userNo);
//	}
	
}
