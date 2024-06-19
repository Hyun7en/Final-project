package com.psvm.manager.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.manager.dao.ManagerDao;
import com.psvm.manager.vo.ReportProduct;
import com.psvm.manager.vo.Search;
import com.psvm.manager.vo.Seller;
import com.psvm.member.vo.Member;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManagerDao managerDao;
	
	// 탈퇴되어있지 않은 회원 수
	@Override
	public int currentMemberCount() {
		return managerDao.currentMemberCount(sqlSession);
	}
	
	// 탈퇴되어있는 회원 수 조회
	@Override
	public int deleteMemberCount() {
		return managerDao.deleteMemberCount(sqlSession);
	}
	
	// 최근 회원가입한 회원 3명 조회
	@Override
	public ArrayList<Member> recentMemberList() {
		return managerDao.recentMemberList(sqlSession);
	}
	
	// 관리자를 제외한 모든 회원 수 조회
	@Override
	public int memberListCount() {
		return managerDao.memberListCount(sqlSession);
	}
	
	// 관리자를 제외한 모든 회원 조회
	@Override
	public ArrayList<Member> memberList(PageInfo pi){
		return managerDao.memberList(sqlSession, pi);
	}
	
	// 검색한 회원 수 조회
	@Override
	public int searchMemberCount(Search s) {
		return managerDao.searchMemberCount(sqlSession, s);
	}
	
	// 검색한 회원 조회
	@Override
	public 	ArrayList<Member> searchMemberList(Search s, PageInfo Pi) {
		return managerDao.searchMemberList(sqlSession, s, Pi);
	}
	
	
	
	// 관리자가 회원 강제 탈퇴
	@Override
	public int deleteMember(int userNo) {
		return managerDao.deleteMember(sqlSession, userNo);
	}
	
	
	
	
	// 판매자 수 조회
	@Override
	public int sellerListCount() {
		return managerDao.sellerListCount(sqlSession);
	}
	
	// 판매자 조회
	@Override
	public ArrayList<Seller> sellerList(PageInfo pi) {
		return managerDao.sellerList(sqlSession, pi);
	}
	
	// 검색한 판매자 수 조회
	@Override
	public int searchSellerCount(Search s) {
		return managerDao.searchSellerCount(sqlSession, s);
	}
	
	// 검색한 판매자 조회
	@Override
	public ArrayList<Seller> searchSellerList(Search s, PageInfo pi){
		return managerDao.searchSellerList(sqlSession, s, pi);
	}
	
	// 판매자 신규신청 회원 수 조회
	@Override
	public int sellerNewApplicationCount() {
		return managerDao.sellerNewApplicationCount(sqlSession);
	}
	
	// 판매자 신규신청 회원 조회
	@Override
	public ArrayList<Seller> sellerNewApplicationList(PageInfo pi){
		return managerDao.sellerNewApplicationList(sqlSession, pi);
	}
	
	// 검색한 판매자 신규신청 회원 수 조회
	@Override
	public int searchSellerNewApplicationCount(Search s) {
		return managerDao.searchSellerNewApplicationCount(sqlSession, s);
	}
	
	// 검색한 판매자 신규신청 회원 조회
	@Override
	public ArrayList<Seller> searchSellerNewApplicationList(Search s, PageInfo pi){
		return managerDao.searchSellerNewApplicationList(sqlSession, s, pi);
	}
	
	// 판매자 신규신청 승인
	@Override
	public int sellerNewApplicationApprove(int userNo) {
		return managerDao.sellerNewApplicationApprove(sqlSession, userNo);
	}
	
	// 판매자 신규신청 거부
	@Override
	public int sellerNewApplicationReject(int userNo) {
		return managerDao.sellerNewApplicationReject(sqlSession, userNo);
	}
	
	// 신고상품 수 조회
	@Override
	public int reportProductListCount() {
		return managerDao.reportProductListCount(sqlSession);
	}
	
	// 신고상품 조회
	@Override
	public ArrayList<ReportProduct> reportProductList(PageInfo pi){
		return managerDao.reportProductList(sqlSession, pi);
	}
	
	// 검색한 신고상품 수 조회
	@Override
	public int searchReportProductListCount(Search s) {
		return managerDao.searchReportProductListCount(sqlSession, s);
	}
	
	// 검색한 신고상품 조회
	@Override
	public ArrayList<ReportProduct> searchReportProductList(Search s, PageInfo pi){
		return managerDao.searchReportProductList(sqlSession, s, pi);
	}
	
	// 신고상품 삭제
	@Override
	public int reportProductRemove(int pdNo) {
		return managerDao.reportProductRemove(sqlSession, pdNo);
	}
	
	// 신고상품 무시
	@Override
	public int reportProductIgnore(int pdNo) {
		return managerDao.reportProductIgnore(sqlSession, pdNo);
	}
	
	// 탈퇴 회원 수 조회
	@Override
	public int customerOutCount() {
		return managerDao.customerOutCount(sqlSession);
	}
	
	// 탈퇴 회원 조회
	@Override
	public ArrayList<Member> customerOutList(PageInfo pi){
		return managerDao.customerOutList(sqlSession, pi);
	}
	// 탈퇴 회원 수 조회(검색)
	@Override
	public int searchedOutCount(HashMap<String, String> map) {
		return managerDao.searchedOutCount(sqlSession, map);
	}
	
	// 탈퇴 회원 조회(검색)
	@Override
	public ArrayList<Member> searchedOutlist(PageInfo pi, HashMap<String, String> map){
		return managerDao.searchedOutlist(sqlSession, pi, map);
	}
}
