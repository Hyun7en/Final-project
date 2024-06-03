package com.psvm.cs.service;

import java.util.ArrayList;

import com.psvm.commons.vo.PageInfo;
import com.psvm.cs.vo.Cs;

public interface CsService {
	
	int selectListCount(int boardLevel);
	ArrayList<Cs> selectList(PageInfo pi, int boardLevel);
	
	

}
