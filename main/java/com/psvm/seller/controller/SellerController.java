package com.psvm.seller.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.member.vo.Member;
import com.psvm.seller.service.SellerService;
import com.psvm.seller.vo.Product;
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
    public String insertSellerHome(SellerPage sellerPage, MultipartFile storeHomeImage, @RequestParam("categoriesJson") String categoriesJson,
                                   HttpSession session, RedirectAttributes redirectAttributes) {

        int businessNo = getBusinessNoFromUserNo(session);
        sellerPage.setBusinessNo(businessNo);

        if (!storeHomeImage.getOriginalFilename().isEmpty()) {
            String changeName = saveFile(storeHomeImage, session);
            sellerPage.setSpOriginName(storeHomeImage.getOriginalFilename());
            sellerPage.setSpChangeName("resources/upFiles/sellerImg/" + changeName);
        }

        try {
            Type listType = new TypeToken<ArrayList<String>>() {}.getType();
            ArrayList<String> categories = gson.fromJson(categoriesJson, listType);

            int result = sellerService.insertSellerHome(sellerPage, categories);
            
            if (result > 0 ) { // 성공
            	session.setAttribute("SellerHomeRegistered", true);
                redirectAttributes.addFlashAttribute("message", "등록이 완료되었습니다.");
                
                return "redirect:detail.srh";
                
            }else { // 실패
            	redirectAttributes.addFlashAttribute("message", "이미 홈 등록이 완료되었습니다.");
                return "redirect:detail.srh"; // 등록 페이지로 리다이렉트
                
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
  		String savePath = session.getServletContext().getRealPath("/resources/upFiles/sellerImg/");
  		
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
   
    // 판매자 제품 관련
    @RequestMapping("enrollForm.pd")
  	public String productEnrollForm() {
  		return "seller/productEnrollForm";
  	}
    
    @RequestMapping("insert.pd")
  	public String insertProduct(Product product, int pCount, MultipartFile productImage, @RequestParam("optionsJson") String optionsJson,
    HttpSession session, RedirectAttributes redirectAttributes) {
    	
    	HashMap<String, Object> map = new HashMap<>();
    	
    	
         if (!productImage.getOriginalFilename().isEmpty()) {
             String changeName = saveFile(productImage, session);
             product.setPdOriginName(productImage.getOriginalFilename());
             product.setPdChangeName("resources/upFiles/" + changeName);
         }

         try {
             Type listType = new TypeToken<ArrayList<String>>() {}.getType();
             ArrayList<String> options = gson.fromJson(optionsJson, listType);

             map.put("pCount", pCount);
         	 map.put("options", options);

         	 int result = sellerService.insertProduct(product, map);
         	 
             if (result > 0 ) { // 성공
            	 
                 redirectAttributes.addFlashAttribute("message", "등록이 완료되었습니다.");
                 
                 return "redirect:list.pd";
                 
             }else { // 실패
             	redirectAttributes.addFlashAttribute("message", "등록 실패하셨습니다.");
                 return "redirect:list.pd"; // 등록 페이지로 리다이렉트
                 
             }
         } catch (JsonSyntaxException e) {
             return "redirect:list.pd";
         }
     }
    
    /*
     * summernote 처리 
     */
    
    //ajax로 들어오는 파일 업로드 요청 처리
  	//파일목록을 저장한 후 저장된 파일명목록을 반환
  	@PostMapping("upload.pd")
  	@ResponseBody
  	public String upload(List<MultipartFile> fileList, HttpSession session) {
  		
  		List<String> changeNameList = new ArrayList<String>();
  		
  		for (MultipartFile f : fileList) {
  			String changeName = saveSummernote(f, session, "/resources/upFiles/productImg/");
  			
  			changeNameList.add("/resources/upFiles/productImg/" + changeName);
  		}
  		
  		return new Gson().toJson(changeNameList);
  	}
  	
  	//실제 넘어온 파일의 이름을 변경해서 서버에 저장하는 메소드
  	public String saveSummernote(MultipartFile upfile, HttpSession session, String path) {
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
    
  	//상품 리스트
    @RequestMapping("list.pd")
  	public String ProductList(@RequestParam(value="cpage", defaultValue="1") int currentPage,HttpSession session, Model model) {
    	
		int boardCount = sellerService.selectProductListCount();
		//logger.info("list.bo 실행");
		
		int businessNo = getBusinessNoFromUserNo(session);
		
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 5);
		ArrayList<Product> list = sellerService.ProductList(pi,businessNo);
		
		System.out.println(list);

		log.info("list",list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "seller/productListView";
	}
    
    // 옵션 불러오는 ajax
    @RequestMapping(value = "options.ax", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String ajaxGetOptions(HttpSession session) {
    	
    	
    	int businessNo = getBusinessNoFromUserNo(session);
        return gson.toJson(sellerService.selectCategories(businessNo));
    }
    
//    @RequestMapping("detail.pd")
//	public String selectProduct(int pno, Model model) {
//		
//		
//			Product p = sellerService.selectProduct(pno);
//			model.addAttribute("p", p);
//			
//			return "seller/sellerProductDetailView";
//	}
    
    @RequestMapping("updateForm.pd")
  	public String productUpdateForm() {
  		return "seller/productUpdateForm";
  	}
    
    @RequestMapping("update.pd")
  	public String updateProduct() {
  		return "";
  	}
    
   
   
}
