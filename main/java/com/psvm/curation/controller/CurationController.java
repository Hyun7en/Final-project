package com.psvm.curation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.psvm.curation.service.CurationService;
import com.psvm.curation.vo.Curation;

@Controller
public class CurationController {
	
	@Autowired
	private CurationService curationService;
	
	
	
	@RequestMapping(value="gotoCuration.cu")
	public String gotoCuration() {
		return "curation/curation" ; 
	}
	
	@RequestMapping(value="go-curation")
	public String goCuration(){
		return "curation/detailCuration";
	}
	
	@ResponseBody
	@PostMapping(value="getQuestionList.cu", produces = "application/json; charset=UTF-8")
	public String getQuestionList() {
		System.out.println("실행됨");
		ArrayList<Curation> list = curationService.getQuestionList();
		
		System.out.println(list);
		
		return new Gson().toJson(list);
	}
}
 