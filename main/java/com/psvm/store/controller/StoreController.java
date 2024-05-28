package com.psvm.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.psvm.store.service.StoreServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	
//	@Autowired
//	private StoreService storeService; 

	
	@RequestMapping("storeMain.ma")
	public String selectList() {
		
		return "store/storeMain";
	}
	
	//실제 넘어온 파일의 이름을 변경해서 서버에 저장하는 메소드
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
}
