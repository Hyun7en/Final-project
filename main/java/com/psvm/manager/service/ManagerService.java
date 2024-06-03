package com.psvm.manager.service;

import java.util.ArrayList;

import com.psvm.manager.vo.SellerNewApplication;
import com.psvm.member.vo.Member;

public interface ManagerService {

	// 관리자를 제외한 모든 회원 조회
	ArrayList<Member> memberList();
	
	// 관리자를 제외한 모든 회원 수 조회
	int memberListCount();
	
	
	
	
	//판매자 신규 신청 리스트 조회
	ArrayList<SellerNewApplication> sellerNewApplicationList();
	
	int sellerNewApplicationApprove(int userNo);
	
}
