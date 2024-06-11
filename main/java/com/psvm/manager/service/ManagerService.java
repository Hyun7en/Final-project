package com.psvm.manager.service;

import java.util.ArrayList;

import com.psvm.commons.vo.PageInfo;
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
	
	// 검색한 판매자 신규 신청 회원 수 조회
	int searchSellerNewApplicationCount(Search s);
	
	// 검색한 판매자 신규신청 회원 조회
	ArrayList<Seller> searchSellerNewApplicationList(Search s, PageInfo pi);
	
	
	// 판매자 신규 신청 승인
	int sellerNewApplicationApprove(int userNo);
	
}
