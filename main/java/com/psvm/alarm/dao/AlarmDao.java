package com.psvm.alarm.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AlarmDao {
	//알람 ajax
	public ArrayList<String> getAlarmList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("alarmMapper.getAlarmList", userNo);
	}
	
	public int checkAlarmUpdate(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("alarmMapper.checkAlarmUpdate", map);
	}
	
	public ArrayList<String> loadAlarm(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("alarmMapper.loadAlarm", userNo);
	}
}
