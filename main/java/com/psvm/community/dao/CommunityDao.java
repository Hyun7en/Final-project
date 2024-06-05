package com.psvm.community.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;
import com.psvm.community.vo.ThumbUp;

@Repository
public class CommunityDao {
	public int selectListCount(SqlSessionTemplate sqlSession, int boardLevel) {
		return sqlSession.selectOne("communityMapper.selectListCount", boardLevel);
	}
	
	public ArrayList<Community> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int boardLevel) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("communityMapper.selectList", boardLevel, rowBounds);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("communityMapper.searchListCount", map);
	}
	
	public ArrayList<Community> searchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("communityMapper.searchList", map, rowBounds);
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
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("communityMapper.deleteBoard", boardNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("communityMapper.insertReply", r);
	}
	
	public ArrayList<Community> selectTopBoardList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("communityMapper.selectTopBoardList");
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int boardReplyNo) {
		return sqlSession.update("communityMapper.deleteReply", boardReplyNo);
	}
	
	public int thumbUpCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("communityMapper.thumbUpCount", boardNo);
	}
	
	public int thumbUpCheck(SqlSessionTemplate sqlSession, ThumbUp t) {
		return sqlSession.selectOne("communityMapper.thumbUpCheck", t);
	}
	
	public int thumbUpOn(SqlSessionTemplate sqlSession, ThumbUp t) {
		return sqlSession.insert("communityMapper.thumbUpOn", t);
	}
	
	public int thumbUpOff(SqlSessionTemplate sqlSession, ThumbUp t) {
		return sqlSession.insert("communityMapper.thumbUpOff", t);
	}
}

