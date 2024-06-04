package com.psvm.curation.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.curation.dao.CurationDao;
import com.psvm.curation.vo.Curation;

@Service
public class CurationServiceImpl implements CurationService{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CurationDao curationDao;

	@Override
	public ArrayList<Curation> getQuestionList() {
		
		return curationDao.getQuestionList(sqlSession);
	}
	

}
