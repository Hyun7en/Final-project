package com.psvm.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.member.vo.MemberAttachment;
import com.psvm.myPage.service.MyPageServiceImpl;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.myPage.vo.PasswordCheck;
import com.psvm.seller.vo.SellerInfo;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageServiceImpl myPageService;
	
	// 내 정보 페이지로 보내는 컨트롤러
	@RequestMapping("myPage.me")
	public String selectMyInfo(HttpSession session, int userNo) {
		MemberAttachment ma = myPageService.selectMemberAttachment(userNo);
		
		session.setAttribute("ma", ma);
		
		return "myPage/myPageInfo";
	}
	
	@RequestMapping("modifyInfo.my")
	public ModelAndView modifyInfo(HttpSession session, Member m, MemberAttachment ma, MultipartFile file, ModelAndView mv) {
		
		int result1 =0;
		int result2 =0;
		int userNo = m.getUserNo();
		
		if(!file.getOriginalFilename().equals("")) {	// 전달된 첨부파일이 있을 경우
			
			//기존의 첨부파일이 있다 => 기존의 파일을 삭제
			if(ma.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(ma.getChangeName())).delete();
				
				// 파일명 변경하는 메소드로 보내고 값 받아오기
				String changeName = saveFile(file, session);
				
				ma.setOriginName(file.getOriginalFilename());
				ma.setChangeName("resources/image/" + changeName);
				ma.setRefMno(userNo);
				
				result1 = myPageService.modifyInfo(m);
				result2 = myPageService.updateImageModifyInfo(ma);
			} else {
				
				// 파일명 변경하는 메소드로 보내고 값 받아오기
				String changeName = saveFile(file, session);
				
				ma.setOriginName(file.getOriginalFilename());
				ma.setChangeName("resources/image/" + changeName);
				ma.setRefMno(userNo);
				
				result1 = myPageService.modifyInfo(m);
				result2 = myPageService.insertImageModifyInfo(ma);
			}		
			
		} else {	// 전달된 첨부파일이 없을 경우
			result1 = myPageService.modifyInfo(m);
			result2 = 1;
		}
		
		// 변경된 회원 정보 값을 세션에 다시 등록하기 위한 select문
		Member mem = myPageService.loginUser(m);
		// 변경된 회원 정보(프로필 이미지) 값을 세션에 다시 등록하기 위한 select문
		MemberAttachment mematt = myPageService.selectMemberAttachment(userNo);
			
		if(result1 > 0 && result2 > 0) {
			session.setAttribute("loginUser",mem);
			session.setAttribute("ma", mematt);
			
			mv.addObject("successMessage", "회원정보 수정 성공");
			mv.setViewName("redirect:myPage.me?userNo=" + userNo);
		} else {
			mv.addObject("errorMessage", "회원정보 수정 실패");
			mv.setViewName("redirect:myPage.me?userNo=" + userNo);
		}
					
		return mv;
	}
	
	public String saveFile(MultipartFile file, HttpSession session) {
		//파일명 수정 후 서버에 업로드하기("imgFile.jpg => 202404231004305488.jpg")
		String originName = file.getOriginalFilename();
		
		//년월일시분초 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		//확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//수정된 첨부파일명
		String changeName = currentTime + ranNum + ext;
		
		//첨부파일을 저장할 폴더의 물리적 경로(session)
		String savePath = session.getServletContext().getRealPath("/resources/image/");
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
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
	
	// 회원탈퇴시 입력한 비밀번호가 맞는지 체크하기 위한 select
	@RequestMapping("passwordCheck.my")
	public String passwordCheck(PasswordCheck pc , HttpSession session) {
		
		PasswordCheck passwordCheck =  myPageService.passwordCheck(pc);
		
		return "";
	}
	
	
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
		
		int authority = myPageService.selectSellerConversionAuthority(userNo);
		String status = myPageService.selectSellerConversionStatus(userNo);
		
		session.setAttribute("authority", authority);
		session.setAttribute("status", status);
				
		return "myPage/myPageSellerConversion";
	}
	
	
	@RequestMapping("sellerConversion.my")
	public ModelAndView sellerConversion(HttpSession session, SellerInfo s, ModelAndView mv) {
		int result = myPageService.sellerInfoInsert(s);
		
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
