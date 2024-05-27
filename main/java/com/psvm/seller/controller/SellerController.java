package com.psvm.seller.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.psvm.seller.service.SellerService;
import com.psvm.seller.vo.ProductAttachment;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SellerController {
    
    @Autowired
    private SellerService sellerService;
    
//    @Autowired
//    private SellerPage sellerPage;
//    
//    @Autowired
//    private ProductAttachment productAttachment;
    
    // 마이페이지에서 적은 판매자 정보 불러오기
    @RequestMapping("info.sr")
    public String selectSeller(Model model, HttpSession session) {
        // 실제 애플리케이션에서는 로그인된 사용자 정보를 사용합니다.
        int userNo = 5; // 예시를 위해 하드코딩됨. 실제로는 세션 또는 인증 객체에서 가져와야 함.
        SellerInfo sr = sellerService.selectSeller(userNo);
        
        log.info("Seller info: {}", sr);
        model.addAttribute("sr", sr);
        
        return "seller/sellerInfo";
    }
    
    @RequestMapping("enroll.srh")
    public String insertSellerHome(
            @RequestParam("storeDescription") String storeDescription,
            @RequestParam("storeHomeImage") MultipartFile storeHomeImage,
            @RequestParam(value = "categories", required = false) String categoriesJson,
            HttpSession session, Model model) {

        // 로그로 요청 파라미터를 출력하여 디버깅에 도움
        log.info("Store Description: {}", storeDescription);
        log.info("Store Home Image: {}", storeHomeImage.getOriginalFilename());
        log.info("Categories: {}", categoriesJson);

        // 객체 생성 및 데이터 설정
        sellerPage.setSellerExpalin(storeDescription);
        
        // 전달된 파일이 있을 경우 => 파일이름 변경 => 서버에 저장 => 원본명, 서버 업로드된 경로를 객체에 담기
        if (!storeHomeImage.getOriginalFilename().isEmpty()) {
            String changeName = saveFile(storeHomeImage, session);
            
            productAttachment.setOriginName(storeHomeImage.getOriginalFilename());
            productAttachment.setChangeName("resources/upFiles/" + changeName);
            
            sellerService.insertProductAttachment(productAttachment);
        }

        // 카테고리 설정
        if (categoriesJson != null && !categoriesJson.isEmpty()) {
            Gson gson = new Gson();
            ArrayList<String> categories = gson.fromJson(categoriesJson, ArrayList.class);
            String categoriesAsJson = gson.toJson(categories);
            ProductCategory productCategory = new ProductCategory();
            productCategory.setPCategory(categoriesAsJson);
            sellerService.insertProductCategory(productCategory);
        }

        sellerService.insertSellerPage(sellerPage);
        
        return "redirect:/seller/sellerInfo";  // 판매자 홈 페이지로 리다이렉트
    }

    // 실제 넘어온 파일의 이름을 변경해서 서버에 저장하는 메소드
    public String saveFile(MultipartFile upfile, HttpSession session) {
        String originName = upfile.getOriginalFilename();
        
        // 년월일시분초
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        
        // 5자리 랜덤값
        int ranNum = (int) (Math.random() * 90000) + 10000;
        
        // 확장자
        String ext = originName.substring(originName.lastIndexOf("."));
        
        // 수정된 첨부파일명
        String changeName = currentTime + ranNum + ext;
        
        // 첨부파일을 저장할 폴더의 물리적 경로(session)
        String savePath = session.getServletContext().getRealPath("/resources/upFiles/");
        
        try {
            upfile.transferTo(new File(savePath + changeName));
        } catch (IllegalStateException | IOException e) {
            log.error("File upload error: ", e);
            // 사용자에게 피드백 제공 (예: 예외 발생 시의 처리)
        }
        
        return changeName;
    }
}
