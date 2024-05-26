package com.psvm.seller.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
		
		int userNo = 5;
		SellerInfo sr = sellerService.selectSeller(userNo);
		
        log.info("Seller info: {}", sr);
        
		
        model.addAttribute("sr", sr);
        
        return "seller/sellerInfo";
	}
	
	
	@RequestMapping("enroll.srh")
	 public String insertSellerHome(
	            @RequestParam("storeDescription") String storeDescription,
	            @RequestParam("storeHomeImage") MultipartFile storeHomeImage,
	            @RequestParam(value = "categories", required = false) ArrayList<String> categories,
	            HttpServletRequest request) {

	        // 로그로 요청 파라미터를 출력하여 디버깅에 도움
	        log.info("Store Description: {}", storeDescription);
	        log.info("Store Home Image: {}", storeHomeImage.getOriginalFilename());
	        log.info("Categories: {}", categories);

	        // 객체 생성 및 데이터 설정
	        
	        SellerPage
	        sellerHome.setStoreDescription(storeDescription);
	        
	        // 파일 처리
	        if (!storeHomeImage.isEmpty()) {
	            // 파일 저장 로직 (예: 파일 시스템, 데이터베이스 등)
	            String fileName = storeHomeImage.getOriginalFilename();
	            // 파일 저장 후 파일 경로를 SellerHome 객체에 설정
	            sellerHome.setStoreHomeImage(fileName);
	            // 실제 파일 저장 로직 구현 필요
	        }

	        // 카테고리 설정
	        if (categories != null) {
	            sellerHome.setCategories(categories);
	        }

	        // 서비스 호출하여 데이터 저장
	        sellerService.insertSellerHomeData(sellerHome);

	        return "redirect:/seller/home";  // 판매자 홈 페이지로 리다이렉트
	    }
	
}
