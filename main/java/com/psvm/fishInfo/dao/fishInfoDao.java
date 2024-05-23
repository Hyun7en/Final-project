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
}
