package com.psvm.fishInfo.service;

import java.util.ArrayList;

import com.psvm.commons.vo.PageInfo;
import com.psvm.fishInfo.vo.Fish;

public interface FishInfoService {
	//물고기 리스트 카운트 가져오기
	int selectListCount();
	
	//물고기 리스트 조회회
	ArrayList<Fish> selectList(PageInfo pi);
}
