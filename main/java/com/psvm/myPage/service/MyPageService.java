package com.psvm.myPage.service;

import java.util.ArrayList;
import java.util.List;

import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.member.vo.MemberAttachment;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.seller.vo.SellerInfo;

public interface MyPageService {
	
	// 내 정보로 보낼 때 이미지파일을 첨부하고 있는지 체크하기 위한 select
	MemberAttachment selectMemberAttachment(int userNo);
	
	// 내 정보에서 이미지파일 제외한 정보 수정
	int modifyInfo(Member m);
	
	// 내 정보 프로필 이미지 새로 추가할 때
	int insertImageModifyInfo(MemberAttachment ma);
	
	// 내 정보 프로필 이미지 변경할 때
	int updateImageModifyInfo(MemberAttachment ma);
	
	// 내 정보로 변경한 값 보내기 위한 select
	Member loginUser(Member m);
	
//	int deleteMember(int userNo);
	
//	ArrayList<InterestProduct> selectInterestProduct(int userNo);

	ArrayList<Community> wirtePostList(int userNo);
	
	ArrayList<Integer> wirtePostListCount(int userNo);
	
	ArrayList<Inquiry> inquiryList(int userNo);
	
	int selectSellerConversionAuthority(int userNo);
	
	String selectSellerConversionStatus(int userNo);
	
	int sellerInfoInsert(SellerInfo s);
	
}
