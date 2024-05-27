package com.psvm.seller.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
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

//    판매자 정보 출력
    @RequestMapping("info.sr")
    public String selectSeller(Model model, HttpSession session) {
        int userNo = 5; // 예시를 위해 하드코딩됨. 실제로는 세션 또는 인증 객체에서 가져와야 함.
        SellerInfo sr = sellerService.selectSeller(userNo);
        
        log.info("Seller info: {}", sr);
        model.addAttribute("sr", sr);
        
        return "seller/sellerInfo";
    }
    
//    판매자 홈 관련
    @RequestMapping("enrollForm.srh")
	public String sellerHomeEnrollForm() {
		return "seller/sellerHomeEnrollForm";
	}
    
    @RequestMapping("insert.srh")
    public String insertSellerHome(
            @RequestParam("storeDescription") String storeDescription,
            @RequestParam("storeHomeImage") MultipartFile storeHomeImage,
            @RequestParam(value = "categories", required = false) String categoriesJson,
            HttpSession session, Model model) {

        log.info("Store Description: {}", storeDescription);
        log.info("Store Home Image: {}", storeHomeImage.getOriginalFilename());
        log.info("Categories: {}", categoriesJson);

        // SellerPage 객체 생성 및 데이터 설정
        SellerPage sellerPage = new SellerPage();
        
        sellerPage.setSellerExpalin(storeDescription);
        int sellerPageResult = sellerService.insertSellerPage(sellerPage);
        
        
        int srNo = sellerPage.getSellerPageNo();
        
        if (!storeHomeImage.getOriginalFilename().isEmpty()) {
            String changeName = saveFile(storeHomeImage, session);

            // ProductAttachment 객체 생성 및 데이터 설정
            
            ProductAttachment productAttachment = new ProductAttachment();
            
            productAttachment.setOriginName(storeHomeImage.getOriginalFilename());
            productAttachment.setChangeName("resources/upFiles/" + changeName);
            
            productAttachment.setSellerPageNo(srNo);

            sellerService.insertProductAttachment(productAttachment);
        }

        if (categoriesJson != null && !categoriesJson.isEmpty()) {
            Gson gson = new Gson();
            ArrayList<String> categories = gson.fromJson(categoriesJson, new TypeToken<ArrayList<String>>(){}.getType());
            for (String category : categories) {
            	
            	// ProductCategory 객체 생성 및 데이터 설정
                ProductCategory productCategory = new ProductCategory();
                
                productCategory.setSellerPageNo(srNo);
                productCategory.setPCategory(category);
                
                sellerService.insertProductCategory(productCategory);
            }
        }

        return "redirect:/seller/enrollForm.srh";
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
  		String savePath = session.getServletContext().getRealPath("/resources/upFiles/");
  		
  		try {
  			upfile.transferTo(new File(savePath + changeName));
  		} catch (IllegalStateException e) {
  			e.printStackTrace();
  		} catch (IOException e) {
  			e.printStackTrace();
  		}
  		
  		return changeName;
  	}
    
    @RequestMapping("updateForm.srh")
  	public String sellerHomeUpdateForm() {
  		return "seller/sellerHomeUpdateForm";
  	}
   
// 판매자 물품 관련
    @RequestMapping("enrollForm.pd")
  	public String productEnrollForm() {
  		return "seller/productEnrollForm";
  	}
    
    @RequestMapping("insert.pd")
  	public String insertProduct() {
    	
  		return "";
  	}
    
    @RequestMapping(value = "/categories", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ArrayList<ProductCategory> getCategories() {
    	
        return sellerService.getAllCategories();
    }
    
    @RequestMapping("select.pd")
  	public String selectProduct() {
    	
  		return "";
  	}
    
    @RequestMapping("list.pd")
  	public String ProductList() {
    	
  		return "seller/productListView";
  	}
    
    @RequestMapping("updateForm.pd")
  	public String productUpdateForm() {
  		return "seller/productUpdateForm";
  	}
    
    @RequestMapping("update.pd")
  	public String updateProduct() {
  		return "";
  	}
    
   
   
}
