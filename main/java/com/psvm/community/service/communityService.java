package com.psvm.community.service;

import java.util.ArrayList;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;

public interface CommunityService {

	//게시글 총 갯수 가져오기
	int selectListCount(int boardLevel);
	
	//게시글 리스트 조회
	ArrayList<Community> selectList(PageInfo pi, int boardLevel);
	
	//게시글 조회수 증가
	int increaseCount(int boardNo);
	
	//게시글정보 조회
	Community selectBoard(int boardNo);
	
	//댓글목록 조회
	ArrayList<Reply> selectReply(int bno);
	
	//게시글 추가
	int insertBoard(Community c);
	
	//게시글 수정
	int updateBoard(Community c);
	
	//댓글추가
	int insertReply(Reply r);
	
	//top5게시글 조회
	ArrayList<Community> selectTopBoardList();
}
