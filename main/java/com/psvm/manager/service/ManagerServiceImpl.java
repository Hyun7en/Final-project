package com.psvm.manager.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.manager.dao.ManagerDao;
import com.psvm.manager.vo.Seller;
import com.psvm.manager.vo.SellerSearch;
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
	public ArrayList<Member> memberList(PageInfo pi){
		return managerDao.memberList(sqlSession, pi);
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
	public ArrayList<Seller> sellerList(PageInfo pi) {
		return managerDao.sellerList(sqlSession, pi);
	}
	
	// 검색된 판매자 수 조회
	public int sellerSearchCount(SellerSearch ss) {
		return managerDao.sellerSearchCount(sqlSession, ss);
	}
	
	// 검색된 판매자 조회
	public ArrayList<Seller> sellerSearchList(SellerSearch ss){
		return managerDao.sellerSearchList(sqlSession, ss);
	}
	
	// 판매자 신규 신청한 회원 수 조회
	public int sellerNewApplicationCount() {
		return managerDao.sellerNewApplicationCount(sqlSession);
	}
	
	// 판매자 신규 신청한 회원 조회
	public ArrayList<Seller> sellerNewApplicationList(PageInfo pi){
		return managerDao.sellerNewApplicationList(sqlSession, pi);
	}
	
	// 판매자 신규신청 승인
	public int sellerNewApplicationApprove(int userNo) {
		return managerDao.sellerNewApplicationApprove(sqlSession, userNo);
	}
	
}
