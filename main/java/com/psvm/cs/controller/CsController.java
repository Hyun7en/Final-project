package com.psvm.cs.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.cs.service.CsService;
import com.psvm.cs.vo.Cs;

@Controller
public class CsController {
	
	@Autowired
	private CsService csService;
	
	//list.cs
	
	@RequestMapping("list.cs")
	public String selectListCs(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="category", defaultValue="0") int boardLevel, Model model) {
		
		int boardCount = csService.selectListCount(boardLevel);
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 10);
		ArrayList<Cs> list = csService.selectList(pi, boardLevel);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("boardLevel", boardLevel);
		return "cs/CsList";
	}

	@RequestMapping("detail.cs")
	public String selectBoard(int boardNo, @RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="category", defaultValue="0") int boardLevel, @RequestParam(value="condition", defaultValue="title") String condition, @RequestParam(value="keyword", defaultValue="") String keyword, Model model) {
		
		PageInfo pi = new PageInfo();
		
		return "cs/csDetail";
	}
	
}
