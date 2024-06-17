package com.psvm.manager.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.psvm.commons.vo.PageInfo;
import com.psvm.manager.vo.ReportProduct;
import com.psvm.manager.vo.Search;
import com.psvm.manager.vo.Seller;
import com.psvm.member.vo.Member;

public interface ManagerService {
	
	// 탈퇴되어있지 않은 회원 수
	int currentMemberCount();
	
	// 탈퇴되어있는 회원 수 조회
	int deleteMemberCount();
	
	// 최근 회원가입한 회원 3명 조회
	ArrayList<Member> recentMemberList();
	
	// 관리자를 제외한 모든 회원 수 조회
	int memberListCount();
	
	// 관리자를 제외한 모든 회원 조회
	ArrayList<Member> memberList(PageInfo pi);
	
	// 검색한 회원 수 조회
	int searchMemberCount(Search s);
	
	// 검색한 회원 조회
	ArrayList<Member> searchMemberList(Search s, PageInfo Pi);
	
	// 관리자가 회원 강제 탈퇴
	int deleteMember(int userNo);
	
	// 판매자 수 조회
	int sellerListCount();
	
	// 판매자 조회
	ArrayList<Seller> sellerList(PageInfo pi);
	
	// 검색한 판매자 수 조회
	int searchSellerCount(Search s);
	
	// 검색한 판매자 조회
	ArrayList<Seller> searchSellerList(Search s, PageInfo pi);
	
	// 판매자 신규 신청한 회원 수 조회
	int sellerNewApplicationCount();
	
	//판매자 신규 신청한 회원 조회
	ArrayList<Seller> sellerNewApplicationList(PageInfo pi);
	
	// 검색한 판매자 신규신청 회원 수 조회
	int searchSellerNewApplicationCount(Search s);
	
	// 검색한 판매자 신규신청 회원 조회
	ArrayList<Seller> searchSellerNewApplicationList(Search s, PageInfo pi);
	
	// 판매자 신규신청 승인
	int sellerNewApplicationApprove(int userNo);
	
	// 판매자 신규신청 거부
	int sellerNewApplicationReject(int userNo);
	
	// 신고상품 수 조회
	int reportProductListCount();
	
	// 신고상품 조회
	ArrayList<ReportProduct> reportProductList(PageInfo pi);
	
	// 검색한 신고상품 수 조회
	int searchReportProductListCount(Search s);
	
	// 검색한 신고 상품 조회
	ArrayList<ReportProduct> searchReportProductList(Search s, PageInfo pi);
	
	// 신고상품 삭제
	int reportProductRemove(int pdNo);
	
	// 신고상품 무시
	int reportProductIgnore(int pdNo);
	
	// 탈퇴 회원 수 조회
	int customerOutCount();
	
	// 탈퇴 회원 조회
	ArrayList<Member> customerOutList(PageInfo pi);
	
	// 탈퇴 회원 수 조회(검색)
	int searchedOutCount(HashMap<String, String> map);
	
	// 탈퇴 회원 조회(검색)
	ArrayList<Member> searchedOutlist(PageInfo pi, HashMap<String, String> map);
}
