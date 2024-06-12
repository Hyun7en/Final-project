package com.psvm.myPage.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.member.vo.MemberAttachment;
import com.psvm.myPage.dao.MyPageDao;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.store.vo.StoreInfo;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyPageDao myPageDao;
	
	// 내 정보로 이동할 때 이미지파일을 첨부하고 있는지 확인하기 위한 조회
	public MemberAttachment selectMemberAttachment(int userNo){
		return myPageDao.selectMemberAttachment(sqlSession, userNo);
	}
	
	// 내 정보에서 이미지파일을 제외한 정보 수정
	public int modifyInfo(Member m) {
		return myPageDao.modifyInfo(sqlSession, m);
	}
	
	// 내 정보 프로필 이미지 새로 등록
	public int insertImageModifyInfo(MemberAttachment ma) {
		return myPageDao.insertImageModifyInfo(sqlSession, ma);
	}
	
	// 내 정보 프로필 이미지 변경
	public int updateImageModifyInfo(MemberAttachment ma) {
		return myPageDao.updateImageModifyInfo(sqlSession, ma);
	}
	
	// 수정한 회원정보 갱신
	public Member loginUser(Member m) {
		return myPageDao.loginUser(sqlSession, m);
	}
	
	// 비밀번호 체크 후 회원탈퇴
	public int deleteMember(int userNo) {
		return myPageDao.deleteMember(sqlSession, userNo);
	}
	
	// 찜 목록 갯수 조회
	public int selectInterestCount(int userNo) {
		return myPageDao.selectInterestCount(sqlSession, userNo);
	}

	// 찜 목록 조회
	public ArrayList<StoreInfo> selectInterest(PageInfo pi, int userNo){
		return myPageDao.selectInterest(sqlSession, pi, userNo);
	}
	
	// 회원이 작성한 게시글 수 조회
	public int writePostListCount(int userNo) {
		return myPageDao.writePostListCount(sqlSession, userNo);
	}
	
	// 회원이 작성한 게시글 조회
	public ArrayList<Community> wirtePostList(int userNo, PageInfo pi){
		return myPageDao.writePostList(sqlSession, userNo, pi);
	}
	
	// 회원이 작성한 게시글 타입별 수 조회
	public ArrayList<Integer> wirtePostTypeListCount(int userNo) {
		return myPageDao.wirtePostTypeListCount(sqlSession, userNo);
	}
	
	// 회원이 작성한 문의글 수 조회
	public int inquiryListCount(int userNo) {
		return myPageDao.inquiryListCount(sqlSession, userNo);
	}
	
	// 회원이 작성한 문의글 조회
	public ArrayList<Inquiry> inquiryList(int userNo, PageInfo pi){
		return myPageDao.inquiryList(sqlSession, userNo,  pi);
	}
	
	// 판매자 신청할 때 회원등급이 일반회원인지 확인하기 위한 조회
	public int selectSellerConversionAuthority(int userNo) {
		return myPageDao.selectSellerConversionAuthority(sqlSession, userNo);
	}
	
	// 판매자 신청할 때 이미 신청한 회원인지 확인하기 위한 조회
	public String selectSellerConversionStatus(int userNo) {
		return myPageDao.selectSellerConversionStatus(sqlSession, userNo);
	}
	
	// 판매자 정보 등록
	public int sellerInfoInsert(SellerInfo s){
		return myPageDao.sellerInfoInsert(sqlSession, s);
	}
	
}
