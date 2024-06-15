package com.psvm.alarm.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.psvm.alarm.service.AlarmServiceImpl;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmServiceImpl alarmService;
	
	@ResponseBody
	@RequestMapping(value="getAlarmList.al", produces = "application/json; charset=UTF-8")
	public String getAlarmList(@RequestParam("userNo") int userNo) {
		ArrayList<String> list = alarmService.getAlarmList(userNo);

		
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="checkAlarm.al")
	public String checkAlarmUpdate(@RequestParam("userNo") int userNo, @RequestParam("sellerPageNo") int sellerPageNo) {
		
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("userNo", userNo);
		map.put("sellerPageNo", sellerPageNo);
		
		int result = alarmService.checkAlarmUpdate(userNo, map);
		
		if(result == 1) {
			return "redirect:/sellersStore.st?sellerPageNo=" + sellerPageNo + "&order=1&cpage=1";
		} else {
			return null;
		}
		
	}
	
	@RequestMapping(value="loadAlarm.ci")
	public String loadAlarm(@RequestParam("userNo") int userNo, Model model) {
		
		ArrayList<String> list = alarmService.loadAlarm(userNo);
		model.addAttribute("list", list);
		
		return "seller/customerInquerySendAlarm";
	}
}
