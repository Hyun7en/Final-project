package com.psvm.myPage.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.myPage.dao.MyPageDao;
import com.psvm.myPage.vo.ModifyInfo;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyPageDao myPageDao;
	
	public int modifyInfo(ModifyInfo m) {
		return myPageDao.modifyInfo(sqlSession, m);
	}
	
//	public int deleteMember(int userNo) {
//		return myPageDao.deleteMember(sqlSession, userNo);
//	}
	
//	public ArrayList<InterestProduct> selectInterestProduct(int userNo){
//		return myPageDao.selectInterestProduct(sqlSession, userNo);
//	}
	
}
