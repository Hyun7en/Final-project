package com.psvm.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.psvm.manager.service.ManagerServiceImpl;
import com.psvm.manager.vo.SellerNewApplication;

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerServiceImpl managerService;
	
	@RequestMapping("main.ma")
	public String managerMainView() {
		return "manager/managerMain";
	}
	
	@RequestMapping("memberList.ma")
	public String memberInfoListView(HttpSession session, String categoryName) {
		
		session.setAttribute("categoryName", categoryName);
		return "manager/managerMemberInfoManagement";
	}
	
	@RequestMapping("memberLevel.ma")
	public String memberLevelManagement(HttpSession session, String categoryName) {
		
		session.setAttribute("categoryName", categoryName);
		return "manager/managerMemberLevelManagement";
	}
	
	
	@RequestMapping("sellerList.ma")
	public String sellerListView(HttpSession session, String categoryName) {
		
		session.setAttribute("categoryName", categoryName);
		return "manager/managerSellerListView";
	}
	
	@RequestMapping("sellerNewApplication.ma")
	public String sellerNewApplicationList(HttpSession session, String categoryName) {
		ArrayList<SellerNewApplication> list = managerService.sellerNewApplicationList();
		session.setAttribute("list", list);
		session.setAttribute("categoryName", categoryName);
		return "manager/managerSellerNewApplication";
	}
	
	@RequestMapping("sellerNewApplicationApprove.ma")
	public String sellerNewApplicationApprove(int userNo) {
		int result = managerService.sellerNewApplicationApprove(userNo);
		System.out.println(userNo);
		System.out.println(result);
		return "redirect:sellerNewApplication.ma?categoryName=seller";
	}
	
	
	
	
	
	
	@RequestMapping("sellerProductApplication.ma")
	public String sellerProductApplication(HttpSession session, String categoryName) {
		
		session.setAttribute("categoryName", categoryName);
		return "manager/managerSellerProductApplication";
	}
	
	
}
