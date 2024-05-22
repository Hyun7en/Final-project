package com.psvm.myPage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.psvm.myPage.service.myPageServiceImpl;
import com.psvm.myPage.vo.MyInfo;

public class myPageController {
	
	@Autowired
	private myPageServiceImpl myPageService;
	
	@RequestMapping("myInfo.my")
	public String selectMyInfo(int userNo, Model model) {
		
		ArrayList<MyInfo> myInfo = myPageService.selectMyInfo(userNo);
		
		model.addAttribute("myInfo", myInfo);
		
		return "myPage/myPageInfo";
		
	}
	
//	@RequestMapping("deleteMember.my")
//	public String deleteMember(int userNo, Model model) {
//		
//		int result = myPageService.deleteMember(userNo);
//		
//		if(result > 0) {
//			model.addAttribute("alertMsg", "회원탈퇴 성공");
//			return "myPage/myPageInfo";
//		} else {
//			model.addAttribute("errorMsg", "회원탈퇴 실패");
//			return "common/errorPage";
//		}
//		
//	}
//	
//	public String interestProduct(int userNo, Model model) {
//		
//		ArrayList<InterestProduct> InterestProduct = myPageService.selectInterestProduct(userNo);
//		
//		model.addAttribute("interestProduct", InterestProduct);
//		
//		return "myPage/myPageInterest";
//		
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	public String selctListView(@RequestParam(value="cpag", defaultValue="1") int currentPage, Model model){
//		int boardCount = myPageService.selectListCount();
//		
//		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 5);
//		ArrayList<Board> list = boardService.selectList(pi);
//		
//		model.addAllAttributes("list", list);
//		model.addAllAttributes("pi", pi);
//		
//		return "myPage/myPagePost";
//	}
	
}
