package com.psvm.manager.service;

import java.util.ArrayList;
import java.util.Map;

import com.psvm.commons.vo.PageInfo;
import com.psvm.manager.vo.ApplicationProduct;
import com.psvm.manager.vo.Search;
import com.psvm.manager.vo.Seller;
import com.psvm.member.vo.Member;

public interface ManagerService {

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
	
	// 판매자가 신청한 상품 수 조회
	int reportProductListCount();
	
	// 판매자가 신청한 상품 조회
	ArrayList<ApplicationProduct> reportProductList(PageInfo pi);
	
	// 검색한 판매자 상품신청 수 조회
	int searchSellerProductApplicationCount(Search s);
	
	// 검색한 판매자 상품신청 조회
	ArrayList<ApplicationProduct> searchSellerProductApplicationList(Search s, PageInfo pi);
	
	// 판매자 상품신청 승인
	int sellerProductApplicationApprove(int pdOptionNo);
	
}
