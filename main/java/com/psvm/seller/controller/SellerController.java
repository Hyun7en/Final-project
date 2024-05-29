package com.psvm.seller.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
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
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import com.psvm.member.vo.Member;
import com.psvm.seller.service.SellerService;
import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SellerController {
    
    @Autowired
    private SellerService sellerService;
    
    private final Gson gson = new Gson();
    
    

//    판매자 정보 출력
    @RequestMapping("info.sr")
    public String selectSeller(HttpSession session, Model model) {
    	
    	// 세션에서 loginUser 객체 가져오기
    	Member loginUser = (Member)session.getAttribute("loginUser");

    	// loginUser가 null이 아닌지 확인하고 userNo 접근
    	if (loginUser != null) {
    	    int userNo = loginUser.getUserNo();
    	    
    	    // userNo를 사용하는 로직
    	    SellerInfo sr = sellerService.selectSeller(userNo);
    	    model.addAttribute("sr", sr);
    	}
    	
        
        return "seller/sellerInfo";
    }
    
    
    // 로그인 한 user의 businessNo가져오는 메서드
    public int getBusinessNoFromUserNo(HttpSession session) {
    	// 세션에서 loginUser 객체 가져오기
    	Member loginUser = (Member)session.getAttribute("loginUser");

    	int userNo = loginUser.getUserNo();
    	
        int businessNo = sellerService.selectBusinessNo(userNo);
        
        return businessNo;
    }
    
    // 판매자 홈 관련
    @RequestMapping("enrollForm.srh")
	public String sellerHomeEnrollForm() {
		return "seller/sellerHomeEnrollForm";
	}
    
    @RequestMapping("insert.srh")
    public String insertSellerHome(SellerPage sellerPage , MultipartFile storeHomeImage, @RequestParam("categoriesJson") String categoriesJson,
    		HttpSession session, Model model) {
    	
    	int businessNo = getBusinessNoFromUserNo(session); 
    	
    	sellerPage.setBusinessNo(businessNo);
    	
    	log.info("Business No: {}", businessNo);
    	log.info("Categories: {}", categoriesJson);
    	
    	
		if (!storeHomeImage.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(storeHomeImage, session);
			
			sellerPage.setSpOriginName(storeHomeImage.getOriginalFilename());
			sellerPage.setSpChangeName("resources/upFiles/" + changeName);
		
		}
		
		try {
			
			Type listType = new TypeToken<ArrayList<String>>() {}.getType();
			
			ArrayList<String> categories = gson.fromJson(categoriesJson, listType);
			
			int result = sellerService.insertSellerHome(sellerPage, categories);
			
			if (result > 0) { //성공 => info페이지로 이동
				
				return "redirect:detail.srh";
				
			} else { //실패 => 에러페이지
				
				return "common/error";
			}
			
		} catch (JsonSyntaxException e) {
			
			return "redirect:detail.srh";
		}
	
	}
   

    // 실제 넘어온 파일의 이름을 변경해서 서버에 저장하는 메소드
  	public String saveFile(MultipartFile upfile, HttpSession session) {
  		// 파일명 수정 후 서버에 업로드하기("imgFile.jpg => 202404231004305488.jpg")
  		String originName = upfile.getOriginalFilename();
  		
  		// 년월일시분초 
  		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
  		
  		// 5자리 랜덤값
  		int ranNum = (int)(Math.random() * 90000) + 10000;
  		
  		// 확장자
  		String ext = originName.substring(originName.lastIndexOf("."));
  		
  		// 수정된 첨부파일명
  		String changeName = currentTime + ranNum + ext;
  		
  		// 첨부파일을 저장할 폴더의 물리적 경로(session)
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
  	
    // 카테고리 불러오는 ajax
    @RequestMapping(value = "categories.ax", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String ajaxGetCategories(HttpSession session) {
    	
    	int businessNo = getBusinessNoFromUserNo(session);

    	String str=  gson.toJson(sellerService.selectCategories(businessNo)); 
    	System.out.println(str);
    	
        return gson.toJson(sellerService.selectCategories(businessNo));
    }
  	
    //
  	@RequestMapping("detail.srh")
  	public String selectSellerHomeDetail(HttpSession session, Model model) {
  	    int businessNo = getBusinessNoFromUserNo(session);

  	    SellerPage sp = sellerService.selectSellerHomeDetail(businessNo);

  	    
  	    if (sp == null) {
  	        model.addAttribute("sp", null); // 명시적으로 'sp'라는 이름으로 null을 추가
  	    } else {
  	        model.addAttribute("sp", sp); // 'sp'라는 이름으로 객체 추가
  	    }

  	    return "seller/sellerHomeDetailView";
  	}
    
    @RequestMapping("updateForm.srh")
  	public String sellerHomeUpdateForm(HttpSession session, Model model) {
    	int businessNo = getBusinessNoFromUserNo(session);

  	    SellerPage sp = sellerService.selectSellerHomeDetail(businessNo);

  	    
  	    if (sp == null) {
  	        model.addAttribute("sp", null); // 명시적으로 'sp'라는 이름으로 null을 추가
  	    } else {
  	        model.addAttribute("sp", sp); // 'sp'라는 이름으로 객체 추가
  	    }
    	
  		return "seller/sellerHomeUpdateForm";
  	}
    
    @RequestMapping("update.srh")
  	public String sellerHomeUpdate() {
    	
  		return "redirect:detail.srh";
  	}
   
    // 판매자 물품 관련
    @RequestMapping("enrollForm.pd")
  	public String productEnrollForm() {
  		return "seller/productEnrollForm";
  	}
    
    @RequestMapping("insert.pd")
  	public String insertProduct(Product product, MultipartFile productImage, HttpSession session, Model model ) {
    	
    	int result = sellerService.insertProduct(product);
    	
    	if (result > 0) { //성공 => list페이지로 이동
			session.setAttribute("successMessage", "게시글이 작성되었습니다!");
			
		} else { //실패 => 에러페이지
			model.addAttribute("errorMessage", "작성 실패");
			
			return "common/error";
		}
    	
    	if (!productImage.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(productImage, session);
			
			product.setPOriginName(productImage.getOriginalFilename());
			product.setPChangeName("resources/upFiles/" + changeName);
		
		}
    	
    	

  		return "list.pd";
  	}
    
    // 옵션 불러오는 ajax
    @RequestMapping(value = "options.ax", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String ajaxGetOptions(HttpSession session) {
    	
    	int businessNo = getBusinessNoFromUserNo(session);

    	String str=  gson.toJson(sellerService.selectCategories(businessNo)); 
    	System.out.println(str);
    	
        return gson.toJson(sellerService.selectCategories(businessNo));
    }
    
    @RequestMapping("detail.pd")
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
