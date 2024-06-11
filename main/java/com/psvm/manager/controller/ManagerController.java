package com.psvm.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.manager.service.ManagerServiceImpl;
import com.psvm.manager.vo.Search;
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
	public String memberListView(@RequestParam(value="cpage", defaultValue="1") int currentPage, Search s, String categoryName, Model model) {	//Model은 request처럼 한번만 값 내려줌(세션처럼 값을 저장해두지 않음)

		// 관리자를 제외한 모든 회원 수 조회
		int memberListCount = managerService.memberListCount();
		
		// 페이징 처리
		PageInfo pi = Pagination.getPageInfo(memberListCount, currentPage, 10, 5);

		//관리자를 제외한 모든 회원 조회
		ArrayList<Member> memberList = managerService.memberList(pi);
		
		model.addAttribute("memberListCount", memberListCount);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pi", pi);
		model.addAttribute("categoryName", categoryName);
		return "manager/managerMemberInfoManagement";
	}
	
	// 회원 검색 조회 메서드
	@RequestMapping("searchMember.ma")
	public String searchMember(@RequestParam(value="cpage", defaultValue="1") int currentPage, Search s, String categoryName, Model model) {
		
    	// 검색한 회원 수 조회
		int searchMemberCount = managerService.searchMemberCount(s);
		
		// 페이징 처리
		PageInfo pi = Pagination.getPageInfo(searchMemberCount, currentPage, 10, 5);
		
		// 검색한 회원 조회
    	ArrayList<Member> searchMemberList = managerService.searchMemberList(s, pi);
        
    	model.addAttribute("memberListCount", searchMemberCount);
		model.addAttribute("memberList", searchMemberList);
		model.addAttribute("pi", pi);
		model.addAttribute("searchType", s.getSearchType());
		model.addAttribute("searchKeyword", s.getSearchKeyword());
		model.addAttribute("startDate", s.getStartDate());
		model.addAttribute("endDate", s.getEndDate());
		model.addAttribute("categoryName", categoryName);

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
	
	// 회원 레벨 관리하는 메서드
	@RequestMapping("memberLevel.ma")
	public String memberLevelManagement(String categoryName, Model model) {
		
		model.addAttribute("categoryName", categoryName);
		return "manager/managerMemberLevelManagement";
	}
	

	// 판매자 조회 메서드
	@RequestMapping("sellerList.ma")
	public String sellerListView(@RequestParam(value="cpage", defaultValue="1") int currentPage, String categoryName, Model model) {
		
		// 판매자 수 조회
		int sellerListCount = managerService.sellerListCount();

		// 페이징 처리
		PageInfo pi = Pagination.getPageInfo(sellerListCount, currentPage, 10, 5);

		// 판매자 조회
		ArrayList<Seller> sellerList = managerService.sellerList(pi);
		
		model.addAttribute("sellerListCount", sellerListCount);
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("pi", pi);
		model.addAttribute("categoryName", categoryName);
		return "manager/managerSellerListView";
	}
	
	// 판매자 검색 조회 메서드
	@RequestMapping("searchSeller.ma")
	public String searchSeller(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Search s, String categoryName, Model model) {

    	// 검색한 판매자 수 조회
		int searchSellerCount = managerService.searchSellerCount(s);
		System.out.println(searchSellerCount);
		// 페이징 처리
		PageInfo pi = Pagination.getPageInfo(searchSellerCount, currentPage,10, 5);
		 
		// 검색된 판매자 조회
    	ArrayList<Seller> searchSellerList = managerService.searchSellerList(s, pi);
    	System.out.println(searchSellerList);
		model.addAttribute("sellerListCount", searchSellerCount);
		model.addAttribute("sellerList", searchSellerList);
		model.addAttribute("pi", pi);
		model.addAttribute("searchType", s.getSearchType());
		model.addAttribute("searchKeyword", s.getSearchKeyword());
		model.addAttribute("startDate", s.getStartDate());
		model.addAttribute("endDate", s.getEndDate());
		model.addAttribute("categoryName", categoryName);
		return "manager/managerSellerListView";
	}
	
	// 판매자 신규신청한 회원 조회 메서드
	@RequestMapping("sellerNewApplication.ma")
	public String sellerNewApplicationList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String categoryName, Model model) {
		
		// 판매자 신청한 일반회원 수 조회
		int sellerNewApplicationCount = managerService.sellerNewApplicationCount();
		
		// 페이징 처리
		PageInfo pi = Pagination.getPageInfo(sellerNewApplicationCount, currentPage, 10, 5);
		
		// 판매자 신청한 일반회원 리스트 조회
		ArrayList<Seller> sellerNewApplicationList = managerService.sellerNewApplicationList(pi);
		
		model.addAttribute("sellerNewApplicationCount", sellerNewApplicationCount);
		model.addAttribute("sellerNewApplicationList", sellerNewApplicationList);
		model.addAttribute("pi", pi);
		model.addAttribute("categoryName", categoryName);
		return "manager/managerSellerNewApplication";
	}
	
	// 판매자 신규신청 검색 조회 메서드
	@RequestMapping("searchSellerNewApplication.ma")
	public String searchSellerNewApplication(@RequestParam(value="cpage", defaultValue="1") int currentPage, Search s, String categoryName, Model model) {

    	// 검색한 판매자 수 조회
		int searchSellerNewApplicationCount = managerService.searchSellerNewApplicationCount(s);
		System.out.println(searchSellerNewApplicationCount);
		// 페이징 처리
		PageInfo pi = Pagination.getPageInfo(searchSellerNewApplicationCount, currentPage,10, 5);
		 
		// 검색된 판매자 조회
    	ArrayList<Seller> searchSellerNewApplicationList = managerService.searchSellerNewApplicationList(s, pi);
    	System.out.println(searchSellerNewApplicationList);

    	model.addAttribute("sellerNewApplicationCount", searchSellerNewApplicationCount);
		model.addAttribute("sellerNewApplicationList", searchSellerNewApplicationList);
		model.addAttribute("pi", pi);
		model.addAttribute("searchType", s.getSearchType());
		model.addAttribute("searchKeyword", s.getSearchKeyword());
		model.addAttribute("startDate", s.getStartDate());
		model.addAttribute("endDate", s.getEndDate());
		model.addAttribute("categoryName", categoryName);
		return "manager/managerSellerNewApplication";
	}
	
	// 판매자 신규신청 승인 메서드
	@RequestMapping("sellerNewApplicationApprove.ma")
	public String sellerNewApplicationApprove(HttpSession session, int userNo, Model model) {
		
		// 회원의 판매자 신청 승인
		int result = managerService.sellerNewApplicationApprove(userNo);
		
		if(result > 0) {  // 승인 성공
			session.setAttribute("alertMsg", "승인 되었습니다.");
			return "redirect:sellerNewApplication.ma?categoryName=seller";
		} else {  // 승인 실패
			model.addAttribute("errorMsg", "승인 실패하였습니다.");
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
