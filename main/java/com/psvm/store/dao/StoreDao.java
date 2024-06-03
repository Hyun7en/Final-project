package com.psvm.store.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.store.vo.StoreInfo;
@Repository
public class StoreDao {

	public StoreInfo selectSellersStore(SqlSessionTemplate sqlSession, int sellerPageNo) {
		return sqlSession.selectOne("storeMapper.selectSellersStore", sellerPageNo);
	}
	
	public ArrayList<StoreInfo> getCategory(SqlSessionTemplate sqlSession, int sellerPageNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.getCategory", sellerPageNo);
	}
}
