package com.psvm.manager.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.manager.dao.ManagerDao;
import com.psvm.manager.vo.Seller;
import com.psvm.member.vo.Member;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManagerDao managerDao;
	
	// 관리자를 제외한 모든 회원 수 조회
	public int memberListCount() {
		return managerDao.memberListCount(sqlSession);
	}
	
	// 관리자를 제외한 모든 회원 조회
	public ArrayList<Member> memberList(){
		return managerDao.memberList(sqlSession);
	}
	
	// 관리자가 회원 강제 탈퇴
	public int deleteMember(int userNo) {
		return managerDao.deleteMember(sqlSession, userNo);
	}
	
	
	
	
	// 판매자 수 조회
	public int sellerListCount() {
		return managerDao.sellerListCount(sqlSession);
	}
	
	// 판매자 조회
	public ArrayList<Member> sellerList() {
		return managerDao.sellerList(sqlSession);
	}
	
	
	// 판매자 신규신청 리스트 조회
	public ArrayList<Seller> sellerNewApplicationList(){
		return managerDao.sellerNewApplicationList(sqlSession);
	}
	
	// 판매자 신규신청 승인
	public int sellerNewApplicationApprove(int userNo) {
		return managerDao.sellerNewApplicationApprove(sqlSession, userNo);
	}
	
}
