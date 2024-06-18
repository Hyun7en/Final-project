package com.psvm.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.community.service.CommunityService;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;
import com.psvm.community.vo.ThumbUp;
import com.psvm.member.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@RequestMapping("list.co")//게시글 목록 띄우기
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="category", defaultValue="0") int boardLevel, Model model) {
		int boardCount = communityService.selectListCount(boardLevel);
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 10);
		ArrayList<Community> list = communityService.selectList(pi, boardLevel);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("boardLevel", boardLevel);
		return "community/CommunityList";
	}
	
	@RequestMapping("searchlist.co")//게시글 목록 띄우기
	public String searchList(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="category", defaultValue="0") int boardLevel, @RequestParam(value="condition", defaultValue="title") String condition, @RequestParam(value="keyword", defaultValue="") String keyword, Model model) {
		
		HashMap<String, String>map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("boardLevel", Integer.toString(boardLevel));
		
		int boardCount = communityService.searchListCount(map);
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 10);
		ArrayList<Community> list = communityService.searchList(pi, map);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
		model.addAttribute("boardLevel", boardLevel);
		return "community/CommunitySearchList";
	}
	
	@RequestMapping("detail.co")//게시글 내용 띄우기
	public String selectBoard(int boardNo, @RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="category", defaultValue="0") int boardLevel, @RequestParam(value="condition", defaultValue="title") String condition, @RequestParam(value="keyword", defaultValue="") String keyword, Model model) {
		
		PageInfo pi = new PageInfo();
		ArrayList<Community> list = new ArrayList<Community>();
		
		if (keyword.isEmpty()) {
			int boardCount = communityService.selectListCount(boardLevel);
			pi = Pagination.getPageInfo(boardCount, currentPage, 10, 10);
			list = communityService.selectList(pi, boardLevel);
		}else {
			HashMap<String, String>map = new HashMap<>();
			map.put("condition", condition);
			map.put("keyword", keyword);
			map.put("boardLevel", Integer.toString(boardLevel));
			
			int boardCount = communityService.searchListCount(map);
			pi = Pagination.getPageInfo(boardCount, currentPage, 10, 10);
			list = communityService.searchList(pi, map);
		}
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
		model.addAttribute("boardLevel", boardLevel);
		
		int result = communityService.increaseCount(boardNo);
		
		Community c = communityService.selectBoard(boardNo);
		model.addAttribute("c", c);
		
		return "community/CommunityDetail";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "rlist.co", produces = "application/json; charset-UTF-8")
	public String ajaxSelectReplyList(int bno) {
		ArrayList<Reply> rlist = communityService.selectReply(bno);
		
		GsonBuilder gsonBuilder = new GsonBuilder();
	    gsonBuilder.registerTypeAdapter(java.sql.Date.class, new TypeAdapter<java.sql.Date>() {
	        private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	        @Override
	        public void write(JsonWriter out, java.sql.Date value) throws IOException {
	            if (value == null) {
	                out.nullValue();
	            } else {
	                out.value(dateFormat.format(value));
	            }
	        }

	        @Override
	        public java.sql.Date read(JsonReader in) throws IOException {
	            try {
	                return new java.sql.Date(dateFormat.parse(in.nextString()).getTime());
	            } catch (Exception e) {
	                return null;
	            }
	        }
	    });

	    Gson gson = gsonBuilder.create();
	    String json = gson.toJson(rlist);
	    return json;
	}
	@ResponseBody
	@RequestMapping("rinsert.co")
	public String ajaxInsertReply(Reply r) {
		//성공했을 때는 success, 실패했을 때 fail
		return communityService.insertReply(r) > 0 ? "success" : "fail";
	}

	@ResponseBody
	@RequestMapping("rdelete.co")
	public ModelAndView deleteReply(int boardReplyNo, int boardLevel, int boardNo, HttpSession session, ModelAndView mv) {
		
		int result = communityService.deleteReply(boardReplyNo);

		if (result > 0) { //성공 => list페이지로 이동
			session.setAttribute("infoMessage", "댓글이 삭제되었습니다.");
			mv.setViewName("redirect:detail.co?category=" + boardLevel + "&cpage=1&boardNo=" + boardNo);
		} else { //실패 => 에러페이지
			mv.addObject("errorMessage", "오류가 발생했습니다.");
			mv.setViewName("redirect:detail.co?category=" + boardLevel + "&cpage=1&boardNo=" + boardNo);
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("thumbUpCount.co")//추천 수 확인
	public int ajaxThumbUpCount(int boardNo) {
		System.out.println(boardNo);
		return communityService.thumbUpCount(boardNo);
	}
	
	@ResponseBody
	@RequestMapping("thumbUpCheck.co")//추천 버튼 클릭 여부 확인
	public int ajaxthumbUpCheck(ThumbUp t) {
		return communityService.thumbUpCheck(t);
	}
	
	@ResponseBody
	@RequestMapping("thumbUpOn.co")//추천하기
	public String ajaxthumbUpOn(ThumbUp t) {
		//성공했을 때는 success, 실패했을 때 fail
		return communityService.thumbUpOn(t) > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping("thumbUpOff.co")//추천 취소
	public String ajaxthumbUpOff(ThumbUp t) {
		//성공했을 때는 success, 실패했을 때 fail
		return communityService.thumbUpOff(t) > 0 ? "success" : "fail";
	}
	
	@RequestMapping("enrollForm.co")//게시글 작성 화면
	public String enrollForm() {
		return "community/CommunityEnroll";
	}
	
	//게시글 추가하기
	@PostMapping("insert.co")
	public ModelAndView insertBoard(Community c, HttpSession session, ModelAndView mv) {
		
		int result = communityService.insertBoard(c);
		
		if (result > 0) { //성공 => list페이지로 이동
			session.setAttribute("successMessage", "게시글이 작성되었습니다!");
			mv.setViewName("redirect:list.co?category="+ c.getBoardLevel() +"&cpage=1");
		} else { //실패 => 에러페이지
			mv.addObject("errorMessage", "오류가 발생했습니다.");
			mv.setViewName("commons/error"); ;
		}
		return mv;
	}
	
	//ajax로 들어오는 파일 업로드 요청 처리
	//파일목록을 저장한 후 저장된 파일명목록을 반환
	@PostMapping("upload.co")
	@ResponseBody
	public String upload(List<MultipartFile> fileList, HttpSession session) {
		
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

	@RequestMapping("updateForm.co")
	public String updateForm(int boardNo, Model model, HttpSession session) {
		model.addAttribute("c", communityService.selectBoard(boardNo));
		Member loginUser = (Member)session.getAttribute("loginUser");
		Community c = (Community)model.getAttribute("c");
		if(loginUser.getUserNo() == c.getUserNo()) {
			return "community/CommunityEdit";
		}else {
			return "redirect:/list.co?category=0&cpage=1";
		}
	}
	
	@RequestMapping("update.co")
	public ModelAndView updateBoard(Community c, HttpSession session, ModelAndView mv) {

		int result = communityService.updateBoard(c);

		if (result > 0) { //성공 => list페이지로 이동
			session.setAttribute("successMessage", "게시글이 수정되었습니다!");
			mv.setViewName("redirect:detail.co?category=" + c.getBoardLevel() + "&cpage=1&boardNo=" + c.getBoardNo());
		} else { //실패 => 에러페이지
			session.setAttribute("errorMessage", "오류가 발생했습니다.");
			mv.setViewName("redirect:updateForm.co?boardNo=" + c.getBoardNo());
		}
		
		return mv;
	}
	
	@RequestMapping("delete.co")
	public ModelAndView deleteBoard(int boardLevel, int boardNo, HttpSession session, ModelAndView mv) {
		
		int result = communityService.deleteBoard(boardNo);

		if (result > 0) { //성공 => list페이지로 이동
			session.setAttribute("infoMessage", "게시글이 삭제되었습니다.");
			mv.setViewName("redirect:list.co?category="+ boardLevel +"&cpage=1");
		} else { //실패 => 에러페이지
			mv.addObject("errorMessage", "오류가 발생했습니다.");
			mv.setViewName("redirect:detail.co?category=" + boardLevel + "&cpage=1&boardNo=" + boardNo);
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="topList.co", produces="application/json; charset=UTF-8")
	public String ajaxTopBoardList() {
		return new Gson().toJson(communityService.selectTopBoardList());
	}
}
