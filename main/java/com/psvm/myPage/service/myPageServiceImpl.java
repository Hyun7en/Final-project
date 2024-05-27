package com.psvm.myPage.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.myPage.dao.MyPageDao;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.seller.vo.SellerInfo;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyPageDao myPageDao;
	
	public int modifyInfo(Member m) {
		return myPageDao.modifyInfo(sqlSession, m);
	}
	
	public Member loginUser(Member m) {
		return myPageDao.loginUser(sqlSession, m);
	}
	
//	public int deleteMember(int userNo) {
//		return myPageDao.deleteMember(sqlSession, userNo);
//	}
	
//	public ArrayList<InterestProduct> selectInterestProduct(int userNo){
//		return myPageDao.selectInterestProduct(sqlSession, userNo);
//	}
	
	public ArrayList<Community> wirtePostList(int userNo){
		return myPageDao.writePostList(sqlSession, userNo);
	}
	
	public ArrayList<Integer> wirtePostListCount(int userNo) {
		return myPageDao.writePostListCount(sqlSession, userNo);
	}
	
	public ArrayList<Inquiry> inquiryList(int userNo){
		return myPageDao.inquiryList(sqlSession, userNo);
	}
	
	public String sellerConversionStatus(int userNo) {
		return myPageDao.sellerConversionStatus(sqlSession, userNo);
	}
	
	public int sellerInfoList(SellerInfo s){
		return myPageDao.sellerInfoList(sqlSession, s);
	}
	
}
