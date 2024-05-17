package com.psvm.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.psvm.example.service.psvmService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class testController {
	
	@Autowired
	private psvmService psvmservice;
	
	@ResponseBody
	@RequestMapping(value="test.bo", produces="application/json; charset=UTF-8" )
	public String ajaxtest() {	
		return new Gson().toJson(psvmservice.testService());
	}

}
