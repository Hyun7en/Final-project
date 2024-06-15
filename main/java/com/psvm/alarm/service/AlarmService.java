package com.psvm.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface AlarmService {
	//알람 ajax
	ArrayList<String> getAlarmList(int userNo);
	
	int checkAlarmUpdate(int userNo, HashMap<String, Integer> map);
	
	ArrayList<String> loadAlarm(int userNo);
}
