package com.psvm.manager.service;

import java.util.ArrayList;

import com.psvm.commons.vo.PageInfo;
import com.psvm.manager.vo.Seller;
import com.psvm.manager.vo.SellerSearch;
import com.psvm.member.vo.Member;

public interface ManagerService {

	// 관리자를 제외한 모든 회원 수 조회
	int memberListCount();
	
	// 관리자를 제외한 모든 회원 조회
	ArrayList<Member> memberList(PageInfo pi);
	
	// 관리자가 회원 강제 탈퇴
	int deleteMember(int userNo);
	
	
	
	
	// 판매자 수 조회
	int sellerListCount();
	
	// 판매자 조회
	ArrayList<Seller> sellerList(PageInfo pi);
	
	// 검색된 판매자 수 조회
	int sellerSearchCount(SellerSearch ss);
	
	// 검색된 판매자 조회
	ArrayList<Seller> sellerSearchList(SellerSearch ss);
	
	// 판매자 신규 신청한 회원 수 조회
	int sellerNewApplicationCount();
	
	//판매자 신규 신청한 회원 조회
	ArrayList<Seller> sellerNewApplicationList(PageInfo pi);
	
	
	int sellerNewApplicationApprove(int userNo);
	
}
