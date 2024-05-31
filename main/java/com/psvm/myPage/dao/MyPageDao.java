package com.psvm.myPage.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.member.vo.MemberAttachment;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.seller.vo.SellerInfo;

@Repository
public class MyPageDao {
	
	public MemberAttachment selectMemberAttachment(SqlSessionTemplate sqlSession, int userNo){
		return (MemberAttachment)sqlSession.selectOne("myPageMapper.selectMemberAttachment", userNo);
	}
	
	public int modifyInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myPageMapper.modifyInfo", m);
	}
	
	public int insertImageModifyInfo(SqlSessionTemplate sqlSession, MemberAttachment ma) {
		return sqlSession.update("myPageMapper.insertImageModifyInfo", ma);
	}
	
	public int updateImageModifyInfo(SqlSessionTemplate sqlSession, MemberAttachment ma) {
		return sqlSession.update("myPageMapper.updateImageModifyInfo", ma);
	}
	
	public Member loginUser(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("myPageMapper.loginUser", m);
	}
	
	
	
	
	
	
	
	
	
	public ArrayList<Community> writePostList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("myPageMapper.writePostList", userNo);
	}
	
	public ArrayList<Integer> writePostListCount(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.writePostListCount", userNo);
	}
	
	public ArrayList<Inquiry> inquiryList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("myPageMapper.inquiryList", userNo);
	}
	
	public int selectSellerConversionAuthority(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("myPageMapper.selectSellerConversionAuthority", userNo);
	}
	
	public String selectSellerConversionStatus(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("myPageMapper.selectSellerConversionStatus", userNo);
	}
	
	public int sellerInfoInsert(SqlSessionTemplate sqlSession, SellerInfo s){
		return sqlSession.insert("myPageMapper.sellerInfoInsert", s);
	}
}
