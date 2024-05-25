package com.psvm.community.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;

@Repository
public class CommunityDao {
	public int selectListCount(SqlSessionTemplate sqlSession, int boardLevel) {
		return sqlSession.selectOne("communityMapper.selectListCount", boardLevel);
	}
	
	public ArrayList<Community> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("communityMapper.selectList", null, rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("communityMapper.increaseCount", boardNo);
	}
	
	public Community selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("communityMapper.selectBoard", boardNo);
	}
	
	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("communityMapper.selectReply", bno);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Community c) {
		return sqlSession.insert("communityMapper.insertBoard", c);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Community c) {
		return sqlSession.update("communityMapper.updateBoard", c);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("communityMapper.insertReply", r);
	}
	
	public ArrayList<Community> selectTopBoardList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("communityMapper.selectTopBoardList");
	}
}

