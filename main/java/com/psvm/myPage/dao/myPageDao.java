package com.psvm.myPage.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.myPage.vo.MyInfo;

@Repository
public class MyPageDao {
	
	public ArrayList<MyInfo> selectMyInfo(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("myPageMapper.selectMyInfo", userNo);
	}
	
}
