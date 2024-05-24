package com.psvm.fishInfo.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.fishInfo.service.FishInfoService;
import com.psvm.fishInfo.vo.Fish;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class FishInfoController {
	@Autowired
	private FishInfoService fishService;
	
	@GetMapping("fishDetail.fi")
	public String fishDetail() {
		return "fishInfo/fishInfoDetail";
	}
	
	@RequestMapping(value="fishInfo.ma", produces="application/json; charset=UTF-8")
	public String fishInfoList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int boardCount = fishService.selectListCount();
		
		
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 15);
		ArrayList<Fish> list = fishService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		System.out.println(list);
		return "fishInfo/fishInfo";
	}
	
	
}
