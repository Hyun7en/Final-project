package com.psvm.fishInfo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.commons.vo.PageInfo;
import com.psvm.fishInfo.vo.Fish;

@Repository
public class FishInfoDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("fishMapper.selectListCount");
	}
	
	public ArrayList<Fish> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fishMapper.selectList", null, rowBounds);
	}
	
	public int selectAjaxCount(SqlSessionTemplate sqlSession, String fishName) {
		return sqlSession.selectOne("fishMapper.selectAjaxCount",fishName);
	}
	
	public ArrayList<Fish> ajaxSearchFish(SqlSessionTemplate sqlSession, PageInfo pi, String fishName){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fishMapper.ajaxSearchFish", fishName, rowBounds);
	}
	
	public int selectcateCount(SqlSessionTemplate sqlSession, String cate) {
		return sqlSession.selectOne("fishMapper.selectcateCount",cate);
	}
	
	public ArrayList<Fish> ajaxCategorySearch(SqlSessionTemplate sqlSession, PageInfo pi, String cate){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fishMapper.ajaxCategorySearch", cate, rowBounds);
	}
	
	public Fish fishDetail(SqlSessionTemplate sqlSession, String fishName){
		return sqlSession.selectOne("fishMapper.fishDetail", fishName);
	}
	
}
