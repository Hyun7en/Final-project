package com.psvm.alarm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.psvm.alarm.service.AlarmServiceImpl;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmServiceImpl alarmService;
	
	//알람 받기 영역
	@ResponseBody
	@RequestMapping(value="getAlarmList.al", produces = "application/json; charset=UTF-8")
	public String getAlarmList(@RequestParam("userNo") int userNo) {
		ArrayList<String> list = alarmService.getAlarmList(userNo);

		System.out.println(userNo);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="checkAlarm.al")
	public String checkAlarmUpdate(@RequestParam("userNo") int userNo, @RequestParam("sellerPageNo") int sellerPageNo, 
			@RequestParam("alarmNo") int alarmNo) {
		
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("alarmNo", alarmNo);
		map.put("sellerPageNo", sellerPageNo);
		
		int result = alarmService.checkAlarmUpdate(alarmNo, map);

		if(result > 0) {
			
			return "redirect:/sellersStore.st?sellerPageNo=" + sellerPageNo + "&order=1&cpage=1";
		} else {
			return null;
		}
		
	}
	
	
	//알람 보내기 영역
	@RequestMapping(value="loadAlarm.ci")
	public String loadAlarm(@RequestParam("userNo") int userNo, Model model) {
		
		ArrayList<String> list = alarmService.loadAlarm(userNo);
		model.addAttribute("list", list);
		
		return "seller/customerInquerySendAlarm";
	}
	
	@RequestMapping(value="insertAlarm.ci", method = RequestMethod.POST)
	@ResponseBody
	public String insertAlarm(@RequestParam("sellerNo") int sellerNo, @RequestParam("alarmContents") String alarmContents) {
		
		List<Integer> list = alarmService.getuserNos(sellerNo); //임시로 seller넘버 가져오는 함수

		HashMap<String, Object> map = new HashMap<>(); //매퍼로 데이터 담아서 올리기
		
		map.put("list", list);
		map.put("sellerNo", sellerNo);
		map.put("alarmContents", alarmContents);
		int result = alarmService.insertAlarm(map);
		
		HashMap<String, Object> ajaxMap = new HashMap<>(); //매퍼로 데이터 담아서 ajax전송
		ajaxMap.put("list", list);
		
		if(result == 1) {
			String success = "알람보내기에 성공했습니다!";
			ajaxMap.put("success", success);
			return new Gson().toJson(ajaxMap);
		} else {
			String error = "알람 보내기에 실패하였습니다.";
			ajaxMap.put("error", error);
			return new Gson().toJson(ajaxMap);
		}
		
	}	
}
