package com.psvm.myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.myPage.service.MyPageServiceImpl;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageServiceImpl myPageService;
	
	// 내 정보 보여주는 컨트롤러
	@RequestMapping("myPage.me")
	public String selectMyInfo() {
		return "myPage/myPageInfo";
	}
	
	@RequestMapping("modifyInfo.my")
	public ModelAndView modifyInfo(HttpSession session, Member m, Model model, ModelAndView mv) {
		
		int result = myPageService.modifyInfo(m);
		
		if(result > 0) {
			session.setAttribute("loginUser", myPageService.loginUser(m));
			
			mv.addObject("successMessage", "회원정보 수정 성공");
			mv.setViewName("myPage/myPageInfo");
		} else {
			mv.addObject("errorMessage", "회원정보 수정 실패");
			mv.setViewName("myPage/myPageInfo");
		}
		
		return mv;
		
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
	public String wirtePostList(HttpSession session, int userNo) {
		System.out.println(userNo);
		
		ArrayList<Community> list = myPageService.wirtePostList(userNo);
		
		session.setAttribute("list", list);
		
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
