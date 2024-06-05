package com.psvm.community.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.dao.CommunityDao;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;
import com.psvm.community.vo.ThumbUp;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommunityDao communityDao;
	
	@Override
	public int selectListCount(int boardLevel) {
		return communityDao.selectListCount(sqlSession, boardLevel);
	}

	@Override
	public ArrayList<Community> selectList(PageInfo pi, int boardLevel) {
		return communityDao.selectList(sqlSession, pi, boardLevel);
	}
	
	@Override
	public int searchListCount(HashMap<String, String> map) {
		return communityDao.searchListCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<Community> searchList(PageInfo pi, HashMap<String, String> map) {
		return communityDao.searchList(sqlSession, pi, map);
	}

	@Override
	public int increaseCount(int boardNo) {
		return communityDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Community selectBoard(int boardNo) {
		return communityDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Reply> selectReply(int bno) {
		return communityDao.selectReply(sqlSession, bno);
	}

	@Override
	public int insertBoard(Community c) {
		return communityDao.insertBoard(sqlSession, c);
	}

	@Override
	public int updateBoard(Community c) {
		return communityDao.updateBoard(sqlSession, c);
	}
	
	@Override
	public int deleteBoard(int boardNo) {
		return communityDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply r) {
		return communityDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Community> selectTopBoardList() {
		return communityDao.selectTopBoardList(sqlSession);
	}
	
	@Override
	public int deleteReply(int boardReplyNo) {
		return communityDao.deleteReply(sqlSession, boardReplyNo);
	}
	
	@Override
	public int thumbUpCount(int boardNo) {
		return communityDao.thumbUpCount(sqlSession, boardNo);
	}
	
	@Override
	public int thumbUpCheck(ThumbUp t) {
		return communityDao.thumbUpCheck(sqlSession, t);
	}
	
	@Override
	public int thumbUpOn(ThumbUp t) {
		return communityDao.thumbUpOn(sqlSession, t);
	}
	
	@Override
	public int thumbUpOff(ThumbUp t) {
		return communityDao.thumbUpOff(sqlSession, t);
	}
}
