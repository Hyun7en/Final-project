package com.psvm.manager.service;

import java.util.ArrayList;

import com.psvm.manager.vo.SellerNewApplication;

public interface ManagerService {

	
	
	
	
	
	
	//판매자 신규 신청 리스트 조회
	ArrayList<SellerNewApplication> sellerNewApplicationList();
	
	int sellerNewApplicationApprove(int userNo);
	
}
