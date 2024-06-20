package com.psvm.curation.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.psvm.curation.service.CurationService;
import com.psvm.curation.vo.Curation;
import com.psvm.fishInfo.vo.Fish;
import com.psvm.seller.vo.Product;

@Controller
public class CurationController {
	
	@Autowired
	private CurationService curationService;
	
	
	
	@RequestMapping(value="gotoCuration.cu")
	public String gotoCuration() {
		return "curation/curation" ; 
	}
	
	@RequestMapping(value="detailCuration.cu")
	public String resultCuration(@RequestParam(value="clickedTexts") String clickedTexts, Model model){
	    // 쉼표로 구분된 문자열을 List로 변환
	    List<String> clickedTextList = Arrays.asList(clickedTexts.split(","));
	    
	   	Fish fish = curationService.resultCuration(clickedTextList);
	    model.addAttribute("fish", fish);
	    return "curation/detailCuration";
	}

	
	@ResponseBody
	@PostMapping(value="getQuestionList.cu", produces = "application/json; charset=UTF-8")
	public String getQuestionList() {
		ArrayList<Curation> list = curationService.getQuestionList();
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@PostMapping(value="getFishProductList.cu", produces = "application/json; charset=UTF-8")
	public String getFishProductList() {
		ArrayList<Product> list = curationService.getFishProductList();
		
		return new Gson().toJson(list);
	}

}
 