package com.psvm.myPage.service;

import java.util.ArrayList;

import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;

public interface MyPageService {
	
	int modifyInfo(Member m);
	
	Member loginUser(Member m);
	
//	int deleteMember(int userNo);
	
//	ArrayList<InterestProduct> selectInterestProduct(int userNo);

	ArrayList<Community> wirtePostList(int userNo);
	
}
