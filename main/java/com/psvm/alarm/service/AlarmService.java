package com.psvm.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface AlarmService {
	//알람 ajax
	ArrayList<String> getAlarmList(int userNo);
	
	int checkAlarmUpdate(int userNo, HashMap<String, Integer> map);
	
	ArrayList<String> loadAlarm(int userNo);
	
	List<Integer> getuserNos(int sellerNo);
	
	int insertAlarm(HashMap<String, Object> map);
}
