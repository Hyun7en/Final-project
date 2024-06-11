package com.psvm.store.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.store.dao.StoreDao;
import com.psvm.store.vo.StoreInfo;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StoreDao storeDao;
	
	@Override
	public StoreInfo selectSellersStore(int sellerPageNo) {
		return storeDao.selectSellersStore(sqlSession, sellerPageNo);
	}
	
	@Override
	public ArrayList<StoreInfo> getCategory(int sellerPageNo){
		return storeDao.getCategory(sqlSession, sellerPageNo);
	}
	
	@Override
	public int selectProductCount(HashMap<String, String> map) {
		return storeDao.selectProductCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<StoreInfo> selectProductList(PageInfo pi, HashMap<String, String> map){
		return storeDao.selectProductList(sqlSession, pi, map);
	}
	
	@Override
	public int selectCategoryCount(HashMap<String, String> map) {
		return storeDao.selectCategoryCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<StoreInfo> selectProductCategory(PageInfo pi, HashMap<String, String> map){
		return storeDao.selectProductCategory(sqlSession, pi, map);
	}
	
	@Override
	public int ajaxAlarmCheck(StoreInfo checker) {
		return storeDao.ajaxAlarmCheck(sqlSession, checker);
	}
	
	@Override
	public int ajaxAlarmOn(StoreInfo checker) {
		return storeDao.ajaxAlarmOn(sqlSession, checker);
	}
	
	@Override
	public int ajaxAlarmOff(StoreInfo checker) {
		return storeDao.ajaxAlarmOff(sqlSession, checker);
	}
}
