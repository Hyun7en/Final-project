package com.psvm.myPage.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.member.vo.MemberAttachment;
import com.psvm.myPage.dao.MyPageDao;
import com.psvm.myPage.vo.Cart;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.myPage.vo.OrderHistory;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.store.vo.StoreInfo;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyPageDao myPageDao;
	
	// 내 정보로 이동할 때 이미지파일을 첨부하고 있는지 확인하기 위한 조회
	@Override
	public MemberAttachment selectMemberAttachment(int userNo){
		return myPageDao.selectMemberAttachment(sqlSession, userNo);
	}
	
	// 내 정보에서 이미지파일을 제외한 정보 수정
	@Override
	public int modifyInfo(Member m) {
		return myPageDao.modifyInfo(sqlSession, m);
	}
	
	// 내 정보 프로필 이미지 새로 등록
	@Override
	public int insertImageModifyInfo(MemberAttachment ma) {
		return myPageDao.insertImageModifyInfo(sqlSession, ma);
	}
	
	// 내 정보 프로필 이미지 변경
	@Override
	public int updateImageModifyInfo(MemberAttachment ma) {
		return myPageDao.updateImageModifyInfo(sqlSession, ma);
	}
	
	// 수정한 회원정보 갱신
	@Override
	public Member loginUser(Member m) {
		return myPageDao.loginUser(sqlSession, m);
	}
	
	// 비밀번호 체크 후 회원탈퇴
	@Override
	public int deleteMember(int userNo) {
		return myPageDao.deleteMember(sqlSession, userNo);
	}
	
	// 비밀번호 변경
	@Override
	public int changePwd(Member m) {
		return myPageDao.changePwd(sqlSession, m);
	}
	
	// 찜 목록 갯수 조회
	@Override
	public int selectInterestCount(int userNo) {
		return myPageDao.selectInterestCount(sqlSession, userNo);
	}

	// 찜 목록 조회
	@Override
	public ArrayList<StoreInfo> selectInterest(PageInfo pi, int userNo){
		return myPageDao.selectInterest(sqlSession, pi, userNo);
	}
	
	// 찜 취소
	@Override
	public int interestCancle(StoreInfo si) {
		return myPageDao.interestCancle(sqlSession, si);
	}
	
	// 장바구니에 담긴 상품 수 조회
	@Override
	public int cartProductListCount(int userNo) {
		return myPageDao.cartProductListCount(sqlSession, userNo);
	}
	
	// 장바구니에 담긴 상품 조회
	@Override
	public ArrayList<Cart> cartProductList(int userNo){
		return myPageDao.cartProductList(sqlSession, userNo);
	}
	
	// 장바구니에 담은 상품 삭제
	public int deleteCartProduct(Map<String, Integer> params) {
		return myPageDao.deleteCartProduct(sqlSession, params);
	}
	
	// 주문내역 수 조회
	public int orderHistoryListCount(int userNo) {
		return myPageDao.orderHistoryListCount(sqlSession, userNo);
	}
	
	// 주문내역 조회
	public ArrayList<OrderHistory> orderHistoryList(int userNo, PageInfo pi){
		return myPageDao.orderHistoryList(sqlSession, userNo, pi);
	}
	
	// 회원이 작성한 게시글 수 조회
	@Override
	public int writePostListCount(int userNo) {
		return myPageDao.writePostListCount(sqlSession, userNo);
	}
	
	// 회원이 작성한 게시글 조회
	@Override
	public ArrayList<Community> wirtePostList(int userNo, PageInfo pi){
		return myPageDao.writePostList(sqlSession, userNo, pi);
	}
	
	// 회원이 작성한 게시글 타입별 수 조회
	@Override
	public ArrayList<Integer> wirtePostTypeListCount(int userNo) {
		return myPageDao.wirtePostTypeListCount(sqlSession, userNo);
	}
	
	// 회원이 작성한 문의글 수 조회
	@Override
	public int inquiryListCount(int userNo) {
		return myPageDao.inquiryListCount(sqlSession, userNo);
	}
	
	// 회원이 작성한 문의글 조회
	@Override
	public ArrayList<Inquiry> inquiryList(int userNo, PageInfo pi){
		return myPageDao.inquiryList(sqlSession, userNo,  pi);
	}
	
	// 판매자 신청할 때 회원등급이 일반회원인지 확인하기 위한 조회
	@Override
	public int selectSellerConversionAuthority(int userNo) {
		return myPageDao.selectSellerConversionAuthority(sqlSession, userNo);
	}
	
	// 판매자 신청할 때 이미 신청한 회원인지 확인하기 위한 조회
	@Override
	public String selectSellerConversionStatus(int userNo) {
		return myPageDao.selectSellerConversionStatus(sqlSession, userNo);
	}
	
	// 판매자 정보 등록
	@Override
	public int sellerInfoInsert(SellerInfo s){
		return myPageDao.sellerInfoInsert(sqlSession, s);
	}
	
}
