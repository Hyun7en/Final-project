package com.psvm.fishInfo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.fishInfo.dao.FishInfoDao;
import com.psvm.fishInfo.vo.Fish;

@Service
public class FishInfoServiceImpl implements FishInfoService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FishInfoDao fishInfoDao;
	
	
	@Override
	public int selectListCount() {
		int count = fishInfoDao.selectListCount(sqlSession);
		return count;
	}

	@Override
	public ArrayList<Fish> selectList(PageInfo pi) {
		
		return fishInfoDao.selectList(sqlSession, pi);
	}
	

	@Override
	public int selectAjaxCount(String fishName) {
		int count = fishInfoDao.selectAjaxCount(sqlSession, fishName);
		return count;
	}

	@Override
	public ArrayList<Fish> ajaxSearchFish(PageInfo pi, String fishName) {
		
		return fishInfoDao.ajaxSearchFish(sqlSession, pi, fishName);
	}

	@Override
	public ArrayList<Fish> ajaxCategorySearch(PageInfo pi, String cate) {
		
		return fishInfoDao.ajaxCategorySearch(sqlSession, pi, cate);
	}

	@Override
	public int selectcateCount(String cate) {
		int count = fishInfoDao.selectcateCount(sqlSession, cate);
		return count;
	}

	@Override
	public Fish fishDetail(String fishName) {
		return fishInfoDao.fishDetail(sqlSession, fishName);
	}

	@Override
	public ArrayList<Fish> anotherFishAjax(HashMap<String, String> map) {
		return fishInfoDao.anotherFishAjax(sqlSession, map);
	}

	
}
