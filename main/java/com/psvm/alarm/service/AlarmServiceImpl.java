package com.psvm.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.alarm.dao.AlarmDao;
import com.psvm.seller.dao.SellerDao;

@Service
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AlarmDao alarmDao;
	
	//알람 ajax
	@Override
	public ArrayList<String> getAlarmList(int userNo) {
		return alarmDao.getAlarmList(sqlSession, userNo);
	}

	@Override
	public int checkAlarmUpdate(int userNo, HashMap<String, Integer> map) {
		return alarmDao.checkAlarmUpdate(sqlSession, map);
	}

	@Override
	public ArrayList<String> loadAlarm(int userNo) {
		return alarmDao.loadAlarm(sqlSession, userNo);
	}
}
