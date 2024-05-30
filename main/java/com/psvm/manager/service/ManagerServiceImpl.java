package com.psvm.manager.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.manager.dao.ManagerDao;
import com.psvm.manager.vo.SellerNewApplication;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManagerDao managerDao;
	
	
	
	
	// 판매자 신규신청 리스트 조회
	public ArrayList<SellerNewApplication> sellerNewApplicationList(){
		return managerDao.sellerNewApplicationList(sqlSession);
	}
	
	// 판매자 신규신청 승인
	public int sellerNewApplicationApprove(int userNo) {
		return managerDao.sellerNewApplicationApprove(sqlSession, userNo);
	}
	
}
