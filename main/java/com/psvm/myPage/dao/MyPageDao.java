package com.psvm.myPage.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.member.vo.MemberAttachment;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.seller.vo.SellerInfo;

@Repository
public class MyPageDao {
	
	// 내 정보로 이동할 때 이미지파일을 첨부하고 있는지 확인하기 위한 조회
	public MemberAttachment selectMemberAttachment(SqlSessionTemplate sqlSession, int userNo){
		return (MemberAttachment)sqlSession.selectOne("myPageMapper.selectMemberAttachment", userNo);
	}
	
	// 내 정보에서 이미지파일을 제외한 정보 수정
	public int modifyInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myPageMapper.modifyInfo", m);
	}
	
	// 내 정보 프로필 이미지 새로 등록
	public int insertImageModifyInfo(SqlSessionTemplate sqlSession, MemberAttachment ma) {
		return sqlSession.update("myPageMapper.insertImageModifyInfo", ma);
	}
	
	// 내 정보 프로필 이미지 변경
	public int updateImageModifyInfo(SqlSessionTemplate sqlSession, MemberAttachment ma) {
		return sqlSession.update("myPageMapper.updateImageModifyInfo", ma);
	}
	
	// 수정한 회원정보 갱신
	public Member loginUser(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("myPageMapper.loginUser", m);
	}
	
	// 비밀번호 체크 후 회원탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("myPageMapper.deleteMember", userNo);
	}
	
	
	
	// 회원이 작성한 게시글 수 조회
	public int writePostListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("myPageMapper.writePostListCount", userNo);
	}
	
	// 회원이 작성한 게시글 조회
	public ArrayList<Community> writePostList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("myPageMapper.writePostList", userNo, rowBounds);
	}
	
	// 회원이 작성한 게시글 타입별 수 조회
	public ArrayList<Integer> wirtePostTypeListCount(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.wirtePostTypeListCount", userNo);
	}
	
	// 회원이 작성한 문의글 수 조회
	public int inquiryListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("myPageMapper.inquiryListCount", userNo);
	}
	
	// 회원이 작성한 문의글 조회
	public ArrayList<Inquiry> inquiryList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("myPageMapper.inquiryList", userNo, rowBounds);
	}
	
	// 판매자 신청할 때 회원등급이 일반회원인지 확인하기 위한 조회
	public int selectSellerConversionAuthority(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("myPageMapper.selectSellerConversionAuthority", userNo);
	}
	
	// 판매자 신청할 때 이미 신청한 회원인지 확인하기 위한 조회
	public String selectSellerConversionStatus(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("myPageMapper.selectSellerConversionStatus", userNo);
	}
	
	// 판매자 정보 등록
	public int sellerInfoInsert(SqlSessionTemplate sqlSession, SellerInfo s){
		return sqlSession.insert("myPageMapper.sellerInfoInsert", s);
	}
}
