package com.psvm.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.psvm.manager.service.ManagerServiceImpl;
import com.psvm.manager.vo.Seller;
import com.psvm.member.vo.Member;

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerServiceImpl managerService;
	
	@RequestMapping("main.ma")
	public String managerMainView() {
		return "manager/managerMain";
	}
	
	//관리자를 제외한 모든 회원 조회 메서드
	@RequestMapping("memberList.ma")
	public String memberListView(HttpSession session, String categoryName) {
		
		// 관리자를 제외한 모든 회원 수 조회
		int memberListCount = managerService.memberListCount();
		
		//관리자를 제외한 모든 회원 조회
		ArrayList<Member> memberList = managerService.memberList();
		
		session.setAttribute("memberListCount", memberListCount);
		session.setAttribute("memberList", memberList);
		session.setAttribute("categoryName", categoryName);
		return "manager/managerMemberInfoManagement";
	}
	
	// 관리자가 회원 강제 탈퇴 시키는 메서드
	@RequestMapping("deleteMember.ma")
	public ModelAndView deleteMember(HttpSession session, int userNo, ModelAndView mv) {
		
		int result = managerService.deleteMember(userNo);
		System.out.println(result);
		
		if(result > 0) {
			
			session.setAttribute("successMessage", "회원 탈퇴 성공");
			mv.setViewName("redirect:memberList.ma?categoryName=member");
		} else {
			session.setAttribute("errorMessage", "회원 탈퇴 실패");
			mv.setViewName("redirect:memberList.ma?categoryName=member");
		}
		
		return mv;
	}
	
	@RequestMapping("memberLevel.ma")
	public String memberLevelManagement(HttpSession session, String categoryName) {
		
		session.setAttribute("categoryName", categoryName);
		return "manager/managerMemberLevelManagement";
	}
	
	
	
	
	
	
	@RequestMapping("sellerList.ma")
	public String sellerListView(HttpSession session, String categoryName) {
		
		// 판매자 수 조회
		int sellerListCount = managerService.sellerListCount();
		
		// 판매자 조회
		ArrayList<Member> sellerList = managerService.sellerList();
		
		session.setAttribute("sellerListCount", sellerListCount);
		session.setAttribute("sellerList", sellerList);
		session.setAttribute("categoryName", categoryName);
		return "manager/managerSellerListView";
	}
	
	@RequestMapping("sellerNewApplication.ma")
	public String sellerNewApplicationList(HttpSession session, String categoryName) {
		
		// 판매자 신청한 일반회원 리스트 조회
		ArrayList<Seller> list = managerService.sellerNewApplicationList();
		
		session.setAttribute("list", list);
		session.setAttribute("categoryName", categoryName);
		return "manager/managerSellerNewApplication";
	}
	
	@RequestMapping("sellerNewApplicationApprove.ma")
	public String sellerNewApplicationApprove(int userNo) {
		
		// 회원의 판매자 신청 승인
		int result = managerService.sellerNewApplicationApprove(userNo);
		
		if(result > 0) {
			return "redirect:sellerNewApplication.ma?categoryName=seller";
		} else {
			return "redirect:sellerNewApplication.ma?categoryName=seller";
		}
	}
	
	
	
	
	
	
	@RequestMapping("sellerProductApplication.ma")
	public String sellerProductApplication(HttpSession session, String categoryName) {
		
		session.setAttribute("categoryName", categoryName);
		return "manager/managerSellerProductApplication";
	}
	
	@RequestMapping("customerOnetoOne.ma")
	public String customerOnetoOne(HttpSession session, String categoryName) {
		session.setAttribute("categoryName", categoryName);
		return "manager/managerCustomerOnetoOne";
		
	}
	
	@RequestMapping("customerOutlist.ma")
	public String customerOutlist(HttpSession session, String categoryName) {
		session.setAttribute("categoryName", categoryName);
		return "manager/managerCustomerOutlist";
		
	}
}
