package com.psvm.store.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.commons.vo.PageInfo;
import com.psvm.store.vo.StoreInfo;
@Repository
public class StoreDao {

	public StoreInfo selectSellersStore(SqlSessionTemplate sqlSession, int sellerPageNo) {
		return sqlSession.selectOne("storeMapper.selectSellersStore", sellerPageNo);
	}
	
	public ArrayList<StoreInfo> getCategory(SqlSessionTemplate sqlSession, int sellerPageNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.getCategory", sellerPageNo);
	}
	
	public int selectProductCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("storeMapper.selectProductCount", map);
	}
	
	public ArrayList<StoreInfo> selectProductList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeMapper.selectProductList", map, rowBounds);
	}
	
	public int selectCategoryCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("storeMapper.selectCategoryCount", map);
	}
	
	public ArrayList<StoreInfo> selectProductCategory(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeMapper.selectProductCategory", map);
	}
	
	public int ajaxAlarmCheck(SqlSessionTemplate sqlSession, StoreInfo checker) {
		return sqlSession.selectOne("storeMapper.ajaxAlarmCheck", checker);
	}
	
	public int ajaxAlarmOn(SqlSessionTemplate sqlSession, StoreInfo checker) {
		return sqlSession.insert("storeMapper.ajaxAlarmOn", checker);
	}
	
	public int ajaxAlarmOff(SqlSessionTemplate sqlSession, StoreInfo checker) {
		return sqlSession.delete("storeMapper.ajaxAlarmOff", checker);
	}
}
