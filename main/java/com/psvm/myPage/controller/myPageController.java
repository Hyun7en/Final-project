package com.psvm.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.psvm.myPage.service.MyPageServiceImpl;
import com.psvm.myPage.vo.ModifyInfo;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageServiceImpl myPageService;
	
	@RequestMapping("myPage.me")
	public String selectMyInfo() {
		return "myPage/myPageInfo";
		
	}
	
	@RequestMapping("modifyInfo.me")
	public String modifyInfo(ModifyInfo m) {
		System.out.println(m);
		
		
		int result = myPageService.modifyInfo(m);
		
		
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
	
	@RequestMapping("interestProduct.my")
	public String interestProduct() {
		
//		ArrayList<InterestProduct> InterestProduct = myPageService.selectInterestProduct(userNo);
//		
//		model.addAttribute("interestProduct", InterestProduct);
		
		return "myPage/myPageInterest";
		
	}
	
	@RequestMapping("orderHistory.my")
	public String orderHistory() {
		
		return "myPage/myPageOrderHistory";
	}
	
	@RequestMapping("writePost.my")
	public String writePost() {
		
		return "myPage/myPageWritePost";
	}
	
	@RequestMapping("cart.my")
	public String cart() {
		
		return "myPage/myPageCart";
	}
	
	@RequestMapping("inquiry.my")
	public String inquiry() {
		
		return "myPage/myPageInquiry";
	}
	
	@RequestMapping("sellerConversion.my")
	public String sellerConversion() {
		
		return "myPage/myPageSellerConversion";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
