package com.psvm.cs.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.cs.dao.CsDao;
import com.psvm.cs.vo.Cs;

@Service
public class CsServiceImpl implements CsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CsDao csDao;
	
	public int selectListCount(int boardLevel) {
		return 0;
	}

	@Override
	public ArrayList<Cs> selectList(PageInfo pi, int boardLevel) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
