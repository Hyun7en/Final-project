package com.psvm.manager.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.commons.vo.PageInfo;
import com.psvm.manager.vo.RecentOrderHistory;
import com.psvm.manager.vo.ReportProduct;
import com.psvm.manager.vo.Search;
import com.psvm.manager.vo.Seller;
import com.psvm.member.vo.Member;

@Repository
public class ManagerDao {
	
	// 탈퇴되어있지 않은 회원 수
	public int currentMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.currentMemberCount");
	}
	
	// 탈퇴되어있는 회원 수 조회
	public int deleteMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.deleteMemberCount");
	}
	
	// 최근 회원가입한 회원 3명 조회
	public ArrayList<Member> recentMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("managerMapper.recentMemberList");
	}
	
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
	
	// 검색한 회원 수 조회
	public int searchMemberCount(SqlSessionTemplate sqlSession, Search s) {
		return sqlSession.selectOne("managerMapper.searchMemberCount", s);
	}
	
	// 검색한 회원 조회
	public ArrayList<Member> searchMemberList(SqlSessionTemplate sqlSession,Search s, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("managerMapper.searchMemberList", s, rowBounds);
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
	
	// 검색한 판매자 수 조회
	public int searchSellerCount(SqlSessionTemplate sqlSession, Search s) {
		return sqlSession.selectOne("managerMapper.searchSellerCount", s);
	}
	
	// 검색한 판매자 조회
	public ArrayList<Seller> searchSellerList(SqlSessionTemplate sqlSession, Search s, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("managerMapper.searchSellerList", s, rowBounds);

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
	
	// 검색한 판매자 신규 신청 회원 수 조회
	public int searchSellerNewApplicationCount(SqlSessionTemplate sqlSession, Search s) {
		return sqlSession.selectOne("managerMapper.searchSellerNewApplicationCount", s);
	}
	
	// 검색한 판매자 신규 신청 회원 조회
	public ArrayList<Seller> searchSellerNewApplicationList(SqlSessionTemplate sqlSession, Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("managerMapper.searchSellerNewApplicationList", s, rowBounds);
	}
	
	// 판매자 신규신청 승인
	public int sellerNewApplicationApprove(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("managerMapper.sellerNewApplicationApprove", userNo);
	}
	
	// 판매자 신규신청 거부
	public int sellerNewApplicationReject(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("managerMapper.sellerNewApplicationReject", userNo);
	}
	
	// 신고상품 수 조회
	public int reportProductListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.reportProductListCount");
	}
	
	// 신고상품 조회
	public ArrayList<ReportProduct> reportProductList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("managerMapper.reportProductList", null, rowBounds);
	}
	
	// 검색한 신고상품 수 조회
	public int searchReportProductListCount(SqlSessionTemplate sqlSession, Search s) {
		return sqlSession.selectOne("managerMapper.searchReportProductListCount", s);
	}
	
	// 검색한 신고상품 조회
	public ArrayList<ReportProduct> searchReportProductList(SqlSessionTemplate sqlSession, Search s, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("managerMapper.searchReportProductList", s, rowBounds);
	}
	
	// 신고상품 삭제
	public int reportProductRemove(SqlSessionTemplate sqlSession, int pdNo) {
		return sqlSession.update("managerMapper.reportProductRemove", pdNo);
		
	}
	
	// 신고상품 무시
	public int reportProductIgnore(SqlSessionTemplate sqlSession, int pdNo) {
		return sqlSession.update("managerMapper.reportProductNoProblem", pdNo);
	}
	
	// 탈퇴 회원 수 조회
	public int customerOutCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.customerOutCount");
	}
	
	// 탈퇴 회원 조회
	public ArrayList<Member> customerOutList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managerMapper.customerOutList", null, rowBounds);
	}
	
	// 탈퇴 회원 수 조회
	public int searchedOutCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("managerMapper.searchedOutCount", map);
	}
	
	// 탈퇴 회원 조회
	public ArrayList<Member> searchedOutlist(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managerMapper.searchedOutlist", map, rowBounds);
	}
	// 최근 주문내역 3개 조회
	public ArrayList<RecentOrderHistory> recentOrderHistory(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("managerMapper.recentOrderHistory");
	}
}
