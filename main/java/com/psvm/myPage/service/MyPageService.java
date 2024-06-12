package com.psvm.myPage.service;

import java.util.ArrayList;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.member.vo.MemberAttachment;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.store.vo.StoreInfo;

public interface MyPageService {
	
	// 내 정보로 이동할 때 이미지파일을 첨부하고 있는지 확인하기 위한 조회
	MemberAttachment selectMemberAttachment(int userNo);
	
	// 내 정보에서 이미지파일을 제외한 정보 수정
	int modifyInfo(Member m);
	
	// 내 정보 프로필 이미지 새로 등록
	int insertImageModifyInfo(MemberAttachment ma);
	
	// 내 정보 프로필 이미지 변경
	int updateImageModifyInfo(MemberAttachment ma);
	
	// 수정한 회원정보 갱신
	Member loginUser(Member m);
	
	// 비밀번호 체크 후 회원탈퇴
	int deleteMember(int userNo);
	
	//찜 목록 갯수 조회
	int selectInterestCount(int userNo);
	
	// 찜 목록 조회
	ArrayList<StoreInfo> selectInterest(PageInfo pi, int userNo);
	
	// 회원이 작성한 게시글 수 조회
	int writePostListCount(int userNo);

	// 회원이 작성한 게시글 조회
	ArrayList<Community> wirtePostList(int userNo, PageInfo pi);
	
	// 회원이 작성한 게시글 타입별 수 조회
	ArrayList<Integer> wirtePostTypeListCount(int userNo);
	
	// 회원이 작성한 문의글 수 조회
	int inquiryListCount(int userNo);
	
	// 회원이 작성한 문의글 조회
	ArrayList<Inquiry> inquiryList(int userNo, PageInfo pi);
	
	// 판매자 신청할 때 회원등급이 일반회원인지 확인하기 위한 조회
	int selectSellerConversionAuthority(int userNo);
	
	// 판매자 신청할 때 이미 신청한 회원인지 확인하기 위한 조회
	String selectSellerConversionStatus(int userNo);
	
	// 판매자 정보 등록
	int sellerInfoInsert(SellerInfo s);
	
}
