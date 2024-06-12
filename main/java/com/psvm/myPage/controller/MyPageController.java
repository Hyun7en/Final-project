package com.psvm.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.member.vo.Member;
import com.psvm.member.vo.MemberAttachment;
import com.psvm.myPage.service.MyPageServiceImpl;
import com.psvm.myPage.vo.Inquiry;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.store.vo.StoreInfo;

@Controller
public class MyPageController {

	@Autowired
	private MyPageServiceImpl myPageService;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	// 내 정보 페이지로  보내는 메서드
	@RequestMapping("myPage.me")
	public String selectMyInfo(HttpSession session, int userNo) {
		// 내정보 페이지 가기전에 이미지 파일 첨부했는지 조회 
		MemberAttachment ma = myPageService.selectMemberAttachment(userNo);

		session.setAttribute("ma", ma);

		return "myPage/myPageInfo";
	}

	// 내정보 페이지에 있는 회원정보 수정하는 메서드
	@RequestMapping("modifyInfo.my")
	public ModelAndView modifyInfo(HttpSession session, Member m, MemberAttachment ma, MultipartFile file,
			ModelAndView mv) {

		int result1 = 0;
		int result2 = 0;
		int userNo = m.getUserNo();

		// 전달된 첨부파일이 있을 경우
		if (!file.getOriginalFilename().equals("")) {

			// 기존의 첨부파일이 있을 때 
			if (ma.getOriginName() != null) {
				// 기존의 파일을 삭제
				new File(session.getServletContext().getRealPath(ma.getChangeName())).delete();

				// 파일명 변경하는 메소드로 보내고 값 받아오기
				String changeName = saveFile(file, session);

				ma.setOriginName(file.getOriginalFilename());
				ma.setChangeName("resources/image/" + changeName);
				ma.setRefMno(userNo);
				
				// 이미지 파일 제외한 정보 수정
				result1 = myPageService.modifyInfo(m);
				// 이미지 파일 정보 변경
				result2 = myPageService.updateImageModifyInfo(ma);
			} else { // 기존의 첨부파일이 없을때

				// 파일명 변경하는 메소드로 보내고 값 받아오기
				String changeName = saveFile(file, session);

				ma.setOriginName(file.getOriginalFilename());
				ma.setChangeName("resources/image/" + changeName);
				ma.setRefMno(userNo);
				
				//이미지 파일 제외한 정보 수정
				result1 = myPageService.modifyInfo(m);
				// 이미지 파일 정보 넣기
				result2 = myPageService.insertImageModifyInfo(ma);
			}

		} else { // 전달된 첨부파일이 없을 경우
			//이미지 파일 제외한 정보 수정
			result1 = myPageService.modifyInfo(m);
			result2 = 1;
		}

		// 변경된 회원 정보 값을 세션에 다시 등록하기 위한 select문
		Member mem = myPageService.loginUser(m);
		// 변경된 회원 정보(프로필 이미지) 값을 세션에 다시 등록하기 위한 select문
		MemberAttachment mematt = myPageService.selectMemberAttachment(userNo);

		if (result1 > 0 && result2 > 0) {
			session.setAttribute("loginUser", mem);
			session.setAttribute("ma", mematt);

			session.setAttribute("successMessage", "회원정보 수정 성공");
			mv.setViewName("redirect:myPage.me?userNo=" + userNo);
		} else {
			session.setAttribute("errorMessage", "회원정보 수정 실패");
			mv.setViewName("redirect:myPage.me?userNo=" + userNo);
		}

		return mv;
	}

	// 프로필 이미지 변경할 때 이미지 파일 이름 변경하는 메서드 (originName -> changeName)
	public String saveFile(MultipartFile file, HttpSession session) {
		// 파일명 수정 후 서버에 업로드하기("imgFile.jpg => 202404231004305488.jpg")
		String originName = file.getOriginalFilename();

		// 년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		// 5자리 랜덤값
		int ranNum = (int) (Math.random() * 90000) + 10000;

		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));

		// 수정된 첨부파일명
		String changeName = currentTime + ranNum + ext;

		// 첨부파일을 저장할 폴더의 물리적 경로(session)
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

	// 회원 탈퇴 메서드
	@RequestMapping("deleteMember.my")
	public ModelAndView deleteMember(int userNo, Model model, HttpSession session, ModelAndView mv) {
		
		// 회원 탈퇴(activated : 'Y' => 'N')
		int result = myPageService.deleteMember(userNo);

		if (result > 0) {
			session.removeAttribute("loginUser");
			session.setAttribute("successMessage", "회원탈퇴 성공");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMessage", "회원탈퇴 실패");
			mv.setViewName("myPage/myPageInfo");
		}
		return mv;
	}

	// 회원탈퇴시 탈퇴한건지 확인하기 위한 비밀번호 확인이 맞는지 체크(ajax)하는 메서드
	@ResponseBody
	@RequestMapping(value = "passwordCheck.my", produces = "application/json; charset-UTF-8")
	public String passwordCheck(String inputPwd, HttpSession session) {
		
		// 세션에 로그인 되어있는 회원 비밀번호 가져오기
		String loginUserPwd = ((Member) session.getAttribute("loginUser")).getUserPwd();
		// 입력한 비밀번호가  로그인한 회원 비밀번호랑 같은지 비교
		boolean isPasswordCheck = bcryptPasswordEncoder.matches(inputPwd, loginUserPwd);
		return new Gson().toJson(isPasswordCheck);
	}

	@RequestMapping("interestProduct.my")
	public String interestProduct(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		//페이징
		int interestCount = myPageService.selectInterestCount(userNo);
		PageInfo pi = Pagination.getPageInfo(interestCount, currentPage, 5, 10);
		ArrayList<StoreInfo> InterestList = myPageService.selectInterest(pi, userNo);
		
		model.addAttribute("iList", InterestList);
		return "myPage/myPageInterest";
	}
	
	@RequestMapping("cart.my")
	public String cart() {

		return "myPage/myPageCart";
	}

	@RequestMapping("orderHistory.my")
	public String orderHistory() {

		return "myPage/myPageOrderHistory";
	}
	
	// 회원이 작성한 게시글을 조회하기 위한 메서드
	@RequestMapping("writePost.my")
	public String wirtePostList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, int userNo) {
		
		// 회원이 작성한 게시글 수 조회
		int myBoardListCount = myPageService.writePostListCount(userNo);
		
		// 페이징 처리
		PageInfo pi = Pagination.getPageInfo(myBoardListCount, currentPage, 10, 10);
		
		// 회원이 작성한 게시글 리스트 조회
		ArrayList<Community> myBoardList = myPageService.wirtePostList(userNo, pi);
		
		//회원이 작성한 타입별 게시글 수 조회(일반, 꿀팁, 질문, 중고거래)
		ArrayList<Integer> myBoardTypeListCount = myPageService.wirtePostTypeListCount(userNo);
		
		session.setAttribute("pi", pi);
		session.setAttribute("myBoardList", myBoardList);
		session.setAttribute("myBoardListCount", myBoardTypeListCount);

		return "myPage/myPageWritePost";
	}

	// 회원이 작성한 문의글을 조회하기 위한 메서드
	@RequestMapping("inquiry.my")
	public String inquiry(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, int userNo) {
		
		// 회원이 작성한 문의글 수 조회
		int myInquiryListCount = myPageService.inquiryListCount(userNo);
		
		// 페이징 처리
		PageInfo pi = Pagination.getPageInfo(myInquiryListCount, currentPage, 10, 10);
		
		// 회원이 작성한 문의글 리스트 조회
		ArrayList<Inquiry> myInquiryList = myPageService.inquiryList(userNo, pi);

		session.setAttribute("myInquiryList", myInquiryList);

		return "myPage/myPageInquiry";
	}
	
	// 판매자 신청할 때 회원등급(일반회원) 확인 및 이미 판매자 신청한 상태인지 확인하기위한 메서드
	@RequestMapping("sellerConversionPage.my")
	public String sellerConversionPage(HttpSession session, int userNo) {
		
		// 판매자 신청한 일반회원의 등급 조회(일반회원=0, 판매자=1, 관리자=2)
		int authority = myPageService.selectSellerConversionAuthority(userNo);
		// 판매자 신청한 일반회원의 상태 조회(seller_info의 status 조회 / 'Y', 'N') 
		String status = myPageService.selectSellerConversionStatus(userNo);
		
		// 1. 판매자 신청 안한 회원, 2. 판매자 신청한 회원(아직 관리자한테 승인은 안됨), 3. 판매지 신청 승인된 회원 / 각각의 페이지가 필요해서 값 조회
		// 1. 판마자 신청 안한 회원 => 판매자가 되기위한 정보 입력 페이지
		// 2. 판매자 신청은 했지만 승인이 안된 회원 => 승인중 문구 페이지
		// 3. 판매자 신청했고 승인된 회원 => 승인됨 문구 페이지

		session.setAttribute("authority", authority);
		session.setAttribute("status", status);

		return "myPage/myPageSellerConversion";
	}
	
	// 판매자 정보 등록하는 메서드
	@RequestMapping("sellerConversion.my")
	public ModelAndView sellerConversion(HttpSession session, SellerInfo s, ModelAndView mv) {
		// 판매자 정보 입력 후 판매자 신청
		int result = myPageService.sellerInfoInsert(s);

		if (result > 0) {
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
