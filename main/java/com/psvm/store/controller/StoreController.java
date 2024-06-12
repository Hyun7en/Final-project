package com.psvm.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.member.vo.Member;
import com.psvm.seller.vo.Product;
import com.psvm.store.service.StoreServiceImpl;
import com.psvm.store.vo.StoreInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	
	@Autowired
	private StoreServiceImpl storeService;
	
	@RequestMapping("sellersStore.st")//판매자 상점 페이지
	public String sellersStore(@RequestParam(value="cpage", defaultValue="1") int currentPage, int sellerPageNo, @RequestParam(value="order", defaultValue = "1") int order, Model model, HttpSession session) {
		StoreInfo si = storeService.selectSellersStore(sellerPageNo); //판매자 홈페이지 기본 정보 가져오기
		ArrayList<StoreInfo> siList = storeService.getCategory(sellerPageNo); //카테고리 가져오기
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("sellerPageNo", Integer.toString(sellerPageNo));
		map.put("order", Integer.toString(order));
		
		Member m = (Member)session.getAttribute("loginUser");
		if(m != null) {
			map.put("userNo", Integer.toString(m.getUserNo()));
		}
		
		int productCount = storeService.selectProductCount(map);
		PageInfo pi = Pagination.getPageInfo(productCount, currentPage, 12, 10);
		ArrayList<StoreInfo> prList = storeService.selectProductList(pi, map);
		
		
		model.addAttribute("si", si);
		model.addAttribute("siList", siList);
		model.addAttribute("prList", prList);
		model.addAttribute("pi", pi);
		model.addAttribute("order", order);
		//사업자 정보 → 상호명
		//판매상품카테고리 → 전체
		//판매자 홈페이지 → 홈 소개, 이미지 파일(배너)
		//페이지네이션
		//상품 → 상품번호, 판매카테고리, 상품명, 판매가액, 별점, 이미지 파일, 판매중
		//판매자 알람 → 알람
		//관심상품 → 상품 별 관심 등록
		return "store/storeSellersHome";
	}
	
	@RequestMapping("sellersCategory.st")//판매자 상점 카테고리별 페이지
	public String sellersCategory(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="pCategory") String prCategory, int sellerPageNo, @RequestParam(value="order", defaultValue = "1") int order, Model model) {
		StoreInfo si = storeService.selectSellersStore(sellerPageNo); //판매자 홈페이지 기본 정보 가져오기
		ArrayList<StoreInfo> siList = storeService.getCategory(sellerPageNo); //카테고리 가져오기
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("sellerPageNo", Integer.toString(sellerPageNo));
		map.put("order", Integer.toString(order));
		map.put("prCategory", prCategory);
		
		int productCount = storeService.selectCategoryCount(map);
		PageInfo pi = Pagination.getPageInfo(productCount, currentPage, 12, 10);
		ArrayList<StoreInfo> prList = storeService.selectProductCategory(pi, map);
		
		model.addAttribute("si", si);
		model.addAttribute("siList", siList);
		model.addAttribute("prList", prList);
		model.addAttribute("pi", pi);
		model.addAttribute("order", order);
		model.addAttribute("prCategory", prCategory);

		return "store/storeSellersCategory";
	}
	
	@ResponseBody
	@RequestMapping("alarmCheck.st") //알람 체크
	public int ajaxAlarmCheck(StoreInfo checker) {
		return storeService.ajaxAlarmCheck(checker);
	}
	
	@ResponseBody
	@RequestMapping("alarmOn.st") //알람 설정
	public String ajaxAlarmOn(StoreInfo checker) {
		return storeService.ajaxAlarmOn(checker) > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping("alarmOff.st") //알람해제
	public String ajaxAlarmOff(StoreInfo checker) {
		return storeService.ajaxAlarmOff(checker) > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping("loveitCheck.st") //알람 체크
	public int ajaxLoveitCheck(StoreInfo checker) {
		return storeService.ajaxLoveitCheck(checker);
	}
	
	@ResponseBody
	@RequestMapping("loveitOn.st") //알람 설정
	public String ajaxLoveitOn(StoreInfo checker) {
		return storeService.ajaxLoveitOn(checker) > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping("loveitOff.st") //알람해제
	public String ajaxLoveitOff(StoreInfo checker) {
		return storeService.ajaxLoveitOff(checker) > 0 ? "success" : "fail";
	}
}
