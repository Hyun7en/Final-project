package com.psvm.store.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
