package com.psvm.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.psvm.attachment.CommunityAttachment;
import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.community.service.CommunityService;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@RequestMapping("list.co")//게시판 기본
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		int boardCount = communityService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 5);
		ArrayList<Community> list = communityService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "community/CommunityNorm";
	}
	
	@RequestMapping(value = "detail.co")
	public String selectBoard(int boardNo, Model model) {
		
		int result = communityService.increaseCount(boardNo);
		
		Community c = communityService.selectBoard(boardNo);
		model.addAttribute("c", c);
		
		return "community/CommunityDetail";
		
//		if (result > 0) {
//			Community c = communityService.selectBoard(boardNo);
//			model.addAttribute("c", c);
//			
//			return "community/CommunityDetail";
//		} else {
//			
//		}
	}
	
	@ResponseBody
	@RequestMapping(value = "rlist.co", produces = "application/json; charset-UTF-8")
	public String ajaxSelectReplyList(int boardNo) {
		ArrayList<Reply> list = communityService.selectReply(boardNo);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping("enrollForm.co")
	public String enrollForm() {
		return "community/CommunityEnroll";
	}
	
	@RequestMapping("insert.co")
	public String insertBoard(Community c, CommunityAttachment ca, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			
			ca.setOriginName(upfile.getOriginalFilename());
			ca.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		int result = communityService.insertBoard(c, ca);
//		if (result > 0) { //성공 => list페이지로 이동
//			session.setAttribute("alertMsg", "게시글 작성 성공");
//			return "redirect:list.co";
//		} else { //실패 => 에러페이지
//			model.addAttribute("errorMsg", "게시글 작성 실패");
//			return "common/errorPage";
//		}
		return "redirect:list.co";
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		//파일명 수정 후 서버에 업로드하기("imgFile.jpg => 202404231004305488.jpg")
		String originName = upfile.getOriginalFilename();
		
		//년월일시분초 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		//확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//수정된 첨부파일명
		String changeName = currentTime + ranNum + ext;
		
		//첨부파일을 저장할 폴더의 물리적 경로(session)
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	@RequestMapping("updateForm.co")
	public String updateForm(int boardNo, Model model) {
		
		model.addAttribute("c", communityService.selectBoard(boardNo));
		return "community/CommunityEdit";
	}
	
	@RequestMapping("update.co")//@ModelAttribute
	public String updateBoard(Community c, CommunityAttachment ca, MultipartFile reupfile, HttpSession session, Model model) {
		
		//새로운 첨부파일이 넘어온 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			//기존의 첨부파일이 있다 => 기존의 파일을 삭제
			if(ca.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(ca.getChangeName())).delete();
			}
			
			//새로 넘어온 첨부파일을 서버에 업로드 시키기
			String changeName = saveFile(reupfile, session);
			
			ca.setOriginName(reupfile.getOriginalFilename());
			ca.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		/*
		 * b에 boardTitle, boardContent
		 * 
		 * 1. 새로운 첨부파일 x, 기존첨부파일 x
		 * 	  => originName : null, changeName : null 
		 * 
		 * 2. 새로운 첨부파일 x, 기존첨부파일 o
		 * 	  => originName : 기존첨부파일 이름, changeName : 기존첨부파일 경로 
		 * 
		 * 3. 새로운 첨부파일 o, 기존첨부파일 o
		 *    => originName : 새로운첨부파일 이름, changeName : 새로운 첨부파일 경로
		 *    
		 * 4. 새로운 첨부파일 o, 기존첨부파일 x
		 * 	  => originName : 새로운첨부파일,  changeName : 새로운 첨부파일 경로
		 */
		
		int result = communityService.updateBoard(c, ca);
		
		if(result > 0) {//성공
			session.setAttribute("alertMsg", "게시글 수정 성공");
			return "redirect:detail.co?bno=" + c.getBoardNo();
		} else { //실패
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertReply(Reply r) {
		//성공했을 때는 success, 실패했을 때 fail
		
		return communityService.insertReply(r) > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="topList.co", produces="application/json; charset=UTF-8")
	public String ajaxTopBoardList() {
		return new Gson().toJson(communityService.selectTopBoardList());
	}
}
