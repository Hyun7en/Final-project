package com.psvm.myPage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.myPage.service.MyPageServiceImpl;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.seller.vo.SellerInfo;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageServiceImpl myPageService;
	
	// 내 정보 페이지로 보내는 컨트롤러
	@RequestMapping("myPage.me")
	public String selectMyInfo() {
		return "myPage/myPageInfo";
	}
	
	@RequestMapping("modifyInfo.my")
	public ModelAndView modifyInfo(HttpSession session, Member m, ModelAndView mv) {
		
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
		
		ArrayList<Community> list = myPageService.wirtePostList(userNo);
		
		ArrayList<Integer> listCount = myPageService.wirtePostListCount(userNo);
		
		session.setAttribute("list", list);
		session.setAttribute("listCount", listCount);
		
		return "myPage/myPageWritePost";
	}
	
	@RequestMapping("cart.my")
	public String cart() {
		
		return "myPage/myPageCart";
	}
	
	@RequestMapping("inquiry.my")
	public String inquiry(HttpSession session, int userNo) {
		
		ArrayList<Inquiry> list = myPageService.inquiryList(userNo);
		
		session.setAttribute("list", list);
		
		return "myPage/myPageInquiry";
	}
	
	@RequestMapping("sellerConversionPage.my")
	public String sellerConversionPage(HttpSession session, int userNo) {
		
		String status = myPageService.sellerConversionStatus(userNo);
		System.out.println(status);
		
		session.setAttribute("status", status);
				
		return "myPage/myPageSellerConversion";
	}
	
	
	@RequestMapping("sellerConversion.my")
	public ModelAndView sellerConversion(HttpSession session, SellerInfo s, ModelAndView mv) {
		int result = myPageService.sellerInfoList(s);
		
		if(result > 0) {
			mv.addObject("successMessage", "판매자 신청 성공");
			mv.setViewName("redirect:sellerConversionPage.my?userNo=" + s.getUserNo());
		} else {
			mv.addObject("errorMessage", "판매자 신청 실패");
			mv.setViewName("myPage/myPageSellerConversion");
		}
		
		return mv;
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
