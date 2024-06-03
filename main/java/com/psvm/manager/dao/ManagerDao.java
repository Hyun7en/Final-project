package com.psvm.manager.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.manager.vo.SellerNewApplication;
import com.psvm.member.vo.Member;

@Repository
public class ManagerDao {

	//관리자를 제외한 모든 회원 조회
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("managerMapper.memberList");
	}
	
	// 관리자를 제외한 모든 회원 수 조회
	public int memberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.memberListCount");
	}
	

	
	
	// 판매자 신규신청 리스트 조회
	public ArrayList<SellerNewApplication> sellerNewApplicationList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("managerMapper.sellerNewApplicationList");
	}
	
	// 판매자 신규신청 승인
	public int sellerNewApplicationApprove(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("managerMapper.sellerNewApplicationApprove", userNo);
	}
}
