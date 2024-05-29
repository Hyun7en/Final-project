package com.psvm.manager.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.manager.vo.SellerNewApplication;

@Repository
public class ManagerDao {

	
	
	
	
	
	// 판매자 신규신청 리스트 조회
	public ArrayList<SellerNewApplication> sellerNewApplicationList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("managerMapper.sellerNewApplicationList");
	}
	
	public int sellerNewApplicationApprove(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("managerMapper.sellerNewApplicationApprove", userNo);
	}
}
