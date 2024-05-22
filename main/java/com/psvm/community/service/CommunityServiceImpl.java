package com.psvm.community.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.attachment.CommunityAttachment;
import com.psvm.commons.vo.PageInfo;
import com.psvm.community.dao.CommunityDao;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommunityDao communityDao;
	
	@Override
	public int selectListCount() {
		int count = communityDao.selectListCount(sqlSession);
		return count;
	}

	@Override
	public ArrayList<Community> selectList(PageInfo pi) {
		return communityDao.selectList(sqlSession, pi);
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
	public ArrayList<Reply> selectReply(int boardNo) {
		return communityDao.selectReply(sqlSession, boardNo);
	}

	@Override
	public int insertBoard(Community c, CommunityAttachment ca) {
		return communityDao.insertBoard(sqlSession, c, ca);
	}

	@Override
	public int updateBoard(Community c, CommunityAttachment ca) {
		return communityDao.updateBoard(sqlSession, c, ca);
	}

	@Override
	public int insertReply(Reply r) {
		return communityDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Community> selectTopBoardList() {
		return communityDao.selectTopBoardList(sqlSession);
	}
}
