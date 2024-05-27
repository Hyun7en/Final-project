package com.psvm.fishInfo.service;

import java.util.ArrayList;

import com.psvm.commons.vo.PageInfo;
import com.psvm.fishInfo.vo.Fish;

public interface FishInfoService {
	//물고기 리스트 카운트 가져오기
	int selectListCount();
	
	//물고기 리스트 조회
	ArrayList<Fish> selectList(PageInfo pi);
	
	//물고기 검색 ajax 카운트 가져오기
	int selectAjaxCount(String fishName);
	
	//물고기 검색 ajax
	ArrayList<Fish> ajaxSearchFish(PageInfo pi, String fishName);
	
	//물고기 카테고리 카운트 가져오기
	int selectcateCount(String cate);
	
	//물고기 카테고리 검색 ajax
	ArrayList<Fish> ajaxCategorySearch(PageInfo pi, String cate);
	
	//물고기 상세 정보 조회
	ArrayList<Fish> fishDetail(String fishName);
}
