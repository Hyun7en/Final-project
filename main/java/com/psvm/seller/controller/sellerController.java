package com.psvm.seller.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.psvm.seller.service.SellerService;
import com.psvm.seller.vo.SellerInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SellerController {
	
	
	private SellerService sellerService;

	public String selectList(Model model) {
		
		ArrayList<SellerInfo> list = sellerService.selectList();
		
		model.addAttribute(list);
		
		
		
	}
}
