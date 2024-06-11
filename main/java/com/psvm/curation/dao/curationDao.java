package com.psvm.curation.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.curation.vo.Curation;
import com.psvm.fishInfo.vo.Fish;

@Repository
public class CurationDao {
	public ArrayList<Curation> getQuestionList(SqlSessionTemplate sqlSession){		
		return (ArrayList)sqlSession.selectList("curationMapper.getQuestionList");
	}
	
	public ArrayList<Fish> resultCuration(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("fishMapper.resultCuration", map);
	}
}
