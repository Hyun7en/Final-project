package com.psvm.myPage.service;

import java.util.ArrayList;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.member.vo.MemberAttachment;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.seller.vo.SellerInfo;

public interface MyPageService {
	
	// 내 정보로 이동할 때 이미지파일을 첨부하고 있는지 확인(select)
	MemberAttachment selectMemberAttachment(int userNo);
	
	// 내 정보에서 이미지파일 제외한 정보 수정(update)
	int modifyInfo(Member m);
	
	// 내 정보 프로필 이미지 새로 추가할 때(insert)
	int insertImageModifyInfo(MemberAttachment ma);
	
	// 내 정보 프로필 이미지 변경할 때(update)
	int updateImageModifyInfo(MemberAttachment ma);
	
	// 내 정보로 변경한 값 보내기(select)
	Member loginUser(Member m);
	
	// 비밀번호 체크 후에 회원탈퇴 할 때(update)
	int deleteMember(int userNo);
	
//	ArrayList<InterestProduct> selectInterestProduct(int userNo);
	
	// 회원이 작성한 게시글 수 조회
	int writePostListCount(int userNo);

	// 회원이 작성한 게시글 조회
	ArrayList<Community> wirtePostList(int userNo, PageInfo pi);
	
	// 회원이 작성한 게시글 타입별 수 조회
	ArrayList<Integer> wirtePostTypeListCount(int userNo);
	
	ArrayList<Inquiry> inquiryList(int userNo);
	
	int selectSellerConversionAuthority(int userNo);
	
	String selectSellerConversionStatus(int userNo);
	
	int sellerInfoInsert(SellerInfo s);
	
}
