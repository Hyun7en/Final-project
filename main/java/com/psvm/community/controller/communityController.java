package com.psvm.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.community.service.CommunityService;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.CommunityAttachment;
import com.psvm.community.vo.Reply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@RequestMapping("list.co")//게시글 목록 띄우기
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="category", defaultValue="0") int boardLevel, Model model) {
		int boardCount = communityService.selectListCount(boardLevel);
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 5);
		ArrayList<Community> list = communityService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "community/CommunityList";
	}
	
	@RequestMapping(value = "detail.co")//게시글 내용 띄우기
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
	@RequestMapping("enrollForm.co")//게시글 작성 화면
	public String enrollForm() {
		return "community/CommunityEnroll";
	}
	
	//게시글 작성하기(화면)
	@GetMapping("insert.co")
	public String write() {
		return "insert.co";
	}
	
	//게시글 추가하기
	@PostMapping("insert.co")
	public String insertBoard(Community c) {
		System.out.println(c);
		return "insert.co";
	}
	
	//ajax로 들어오는 파일 업로드 요청 처리
	//파일목록을 저장한 후 저장된 파일명목록을 반환
	@PostMapping("upload.co")
	@ResponseBody
	public String upload(List<MultipartFile> fileList, HttpSession session) {
		System.out.println(fileList);
		
		List<String> changeNameList = new ArrayList<String>();
		
		for (MultipartFile f : fileList) {
			String changeName = saveFile(f, session, "/resources/image/");
			
			changeNameList.add("/resources/image/" + changeName);
		}
		
		return new Gson().toJson(changeNameList);
	}
	
	//실제 넘어온 파일의 이름을 변경해서 서버에 저장하는 메소드
	public String saveFile(MultipartFile upfile, HttpSession session, String path) {
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
		String savePath = session.getServletContext().getRealPath(path);
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	@ResponseBody
	@RequestMapping(value = "rlist.co", produces = "application/json; charset-UTF-8")
	public String ajaxSelectReplyList(int boardNo) {
		ArrayList<Reply> list = communityService.selectReply(boardNo);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping("updateForm.co")
	public String updateForm(int boardNo, Model model) {
		
		model.addAttribute("c", communityService.selectBoard(boardNo));
		return "community/CommunityEdit";
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
