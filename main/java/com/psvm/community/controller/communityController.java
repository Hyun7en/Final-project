//package com.psvm.community.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.psvm.community.service.CommunityService;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@Controller
//public class CommunityController {
//	
//	@Autowired
//	private CommunityService communityService;
//	
//	@RequestMapping("list.co")//게시판 기본
//	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
//		int boardCount = communityService.selectListCount();
//		
//		Page
//	}
//}
