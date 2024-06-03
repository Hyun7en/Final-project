package com.psvm.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	public String sellersStore(HttpSession session, int sellerPageNo) {
		StoreInfo si = storeService.selectSellersStore(sellerPageNo); //판매자 홈페이지 기본 정보 가져오기
		
		ArrayList<StoreInfo> siList = storeService.getCategory(sellerPageNo); //카테고리 가져오기
		System.out.println(siList);
		
		session.setAttribute("si", si);
		session.setAttribute("siList", siList);
		//사업자 정보 → 상호명
		//판매상품카테고리 → 전체
		//판매자 홈페이지 → 홈 소개, 이미지 파일(배너)
		//페이지네이션
		//상품 → 상품번호, 판매카테고리, 상품명, 판매가액, 별점, 이미지 파일, 판매중
		//판매자 알람 → 알람
		//관심상품 → 상품 별 관심 등록
		return "store/stroreSellersHome";
	}
	
}
