package com.psvm.community.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;
import com.psvm.community.vo.ThumbUp;

public interface CommunityService {

	//게시글 총 갯수 가져오기
	int selectListCount(int boardLevel);
	
	//게시글 리스트 조회
	ArrayList<Community> selectList(PageInfo pi, int boardLevel);
	
	//게시글 검색 결과 수 가져오기
	int searchListCount(HashMap<String, String> map);
	
	//게시글 검색 결과 조회
	ArrayList<Community> searchList(PageInfo pi, HashMap<String, String> map);
	
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
	
	//게시글 삭제
	int deleteBoard(int boardNo);
	
	//댓글추가
	int insertReply(Reply r);
	
	//top5게시글 조회
	ArrayList<Community> selectTopBoardList();
	
	//댓글삭제
	int deleteReply(int boardReplyNo);
	
	//추천 수 조회
	int thumbUpCount(int boardNo);
	
	//추천 여부 확인
	int thumbUpCheck(ThumbUp t);
	
	//추천 누름
	int thumbUpOn(ThumbUp t);
	
	//추천 취소
	int thumbUpOff(ThumbUp t);
}
