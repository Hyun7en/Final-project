package com.psvm.seller.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psvm.seller.service.SellerService;
import com.psvm.seller.vo.SellerInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SellerController {
	
	@Autowired
	private SellerService sellerService;

	
//	마이페이지에서 적은 판매자 정보 불러오기
	
	@RequestMapping("info.sr")
	public String selectSeller( Model model) {
		
		int userNo = 7;
		SellerInfo sr = sellerService.selectSeller(userNo);
	
        log.info("Seller info: {}", sr);
        
		
        model.addAttribute("sr", sr);
        
        return "seller/sellerInfo";
	}
}
