package com.psvm.manager.service;

import java.util.ArrayList;

import com.psvm.manager.vo.Seller;
import com.psvm.member.vo.Member;

public interface ManagerService {

	// 관리자를 제외한 모든 회원 수 조회
	int memberListCount();
	
	// 관리자를 제외한 모든 회원 조회
	ArrayList<Member> memberList();
	
	// 관리자가 회원 강제 탈퇴
	int deleteMember(int userNo);
	
	
	
	
	// 판매자 수 조회
	int sellerListCount();
	
	// 판매자 조회
	ArrayList<Member> sellerList();
	
	//판매자 신규 신청 리스트 조회
	ArrayList<Seller> sellerNewApplicationList();
	
	
	int sellerNewApplicationApprove(int userNo);
	
}
