package com.psvm.manager.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.commons.vo.PageInfo;
import com.psvm.manager.vo.Seller;
import com.psvm.manager.vo.SellerSearch;
import com.psvm.member.vo.Member;

@Repository
public class ManagerDao {
	
	// 관리자를 제외한 모든 회원 수 조회
	public int memberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.memberListCount");
	}

	//관리자를 제외한 모든 회원 조회
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("managerMapper.memberList", null, rowBounds);
	}
	
	// 관리자가 회원 강제 탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("managerMapper.deleteMember", userNo);
	}
	
	
	
	
	// 판매자 수 조회
	public int sellerListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.sellerListCount");
	}

	// 판매자 조회
	public ArrayList<Seller> sellerList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("managerMapper.sellerList", null ,rowBounds);
	}
	
	// 검색된 판매자 수 조회
	public int sellerSearchCount(SqlSessionTemplate sqlSession, SellerSearch ss) {
		return sqlSession.selectOne("managerMapper.sellerSearchCount", ss);
	}
	
	// 검색된 판매자 조회
	public ArrayList<Seller> sellerSearchList(SqlSessionTemplate sqlSession, SellerSearch ss){
		return (ArrayList)sqlSession.selectList("managerMapper.sellerSearchList", ss);
	}
	
	// 판매자 신규 신청한 회원 수 조회
	public int sellerNewApplicationCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.sellerNewApplicationCount");
	}
	
	// 판매자 신규 신청한 회원 조회
	public ArrayList<Seller> sellerNewApplicationList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("managerMapper.sellerNewApplicationList", null, rowBounds);
	}
	
	// 판매자 신규신청 승인
	public int sellerNewApplicationApprove(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("managerMapper.sellerNewApplicationApprove", userNo);
	}
}
