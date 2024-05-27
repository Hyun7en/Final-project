package com.psvm.myPage.service;

import java.util.ArrayList;
import java.util.List;

import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.seller.vo.SellerInfo;

public interface MyPageService {
	
	int modifyInfo(Member m);
	
	Member loginUser(Member m);
	
//	int deleteMember(int userNo);
	
//	ArrayList<InterestProduct> selectInterestProduct(int userNo);

	ArrayList<Community> wirtePostList(int userNo);
	
	ArrayList<Integer> wirtePostListCount(int userNo);
	
	ArrayList<Inquiry> inquiryList(int userNo);
	
	String sellerConversionStatus(int userNo);
	
	int sellerInfoList(SellerInfo s);
	
}
