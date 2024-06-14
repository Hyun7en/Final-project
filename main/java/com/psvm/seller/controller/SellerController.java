package com.psvm.seller.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.google.gson.reflect.TypeToken;
import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.member.vo.Member;
import com.psvm.seller.dto.ProductCategoryDTO;
import com.psvm.seller.dto.StoreMainDTO;
import com.psvm.seller.service.SellerService;
import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.ProductOption;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SellerController {

    @Autowired
    private SellerService sellerService;
    
    private final Gson gson = new Gson();
    
    
	/*
	 * seller
	 */
    
    // 판매자 정보 불러오기
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
    
    /**
     * 로그인한 판매자의 사업자 번호를 가져오는 메서드 입니다.
     * 
     * @param session session 가져옴
     * @return 로그인한 판매자의 사업자 번호
     */
    // 로그인 한 판매자의 사업자 번호 가져오는 메서드
    public int getBusinessNo(HttpSession session) {
    	
    	// 세션에서 loginUser 객체 가져오기
    	Member loginUser = (Member)session.getAttribute("loginUser");

    	int userNo = loginUser.getUserNo();
    	
        return sellerService.getBusinessNo(userNo);
        
    }
    
    public int getSellerPageNo(HttpSession session) {
    	int businessNo = getBusinessNo(session);
    	
    	return sellerService.getSellerPageNo(businessNo);
    }
    
    // 판매자 홈
    @RequestMapping("enrollForm.srh")
	public String sellerHomeEnrollForm() {
		return "seller/sellerHomeEnrollForm";
	}
   
    // 판매자 홈 등록
    @RequestMapping("insert.srh")
    public String insertSellerHome(SellerPage sellerPage, MultipartFile storeHomeImage, @RequestParam("categoriesJson") String categoriesJson,
                                   HttpSession session, RedirectAttributes redirectAttributes) {

        int businessNo = getBusinessNo(session);
        sellerPage.setBusinessNo(businessNo);

        if (!storeHomeImage.getOriginalFilename().isEmpty()) {
            String changeName = saveFile(storeHomeImage, session);
            sellerPage.setSpOriginName(storeHomeImage.getOriginalFilename());
            sellerPage.setSpChangeName("resources/upFiles/productImg/" + changeName);
        }

     
        Type listType = new TypeToken<List<String>>() {}.getType();
        List<String> categories = gson.fromJson(categoriesJson, listType);

        int result = sellerService.insertSellerHome(sellerPage, categories);
        
        if (result > 0 ) { // 성공
            session.setAttribute("SellerHomeRegistered", true);
            redirectAttributes.addFlashAttribute("message", "등록이 완료되었습니다.");
            
            return "redirect:detail.srh";
            
        }else { // 실패
        	redirectAttributes.addFlashAttribute("message", "이미 홈 등록이 완료되었습니다.");
            return "redirect:detail.srh"; // 등록 페이지로 리다이렉트
            
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
  		String savePath = session.getServletContext().getRealPath("/resources/upFiles/productImg/");
  		
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
    	
    	int businessNo = getBusinessNo(session);
    	
        return gson.toJson(sellerService.selectCategories(businessNo));
    }
  	
    // 판매자 홈 불러오기
  	@RequestMapping("detail.srh")
  	public String selectSellerHomeDetail(HttpSession session, Model model) {
  		
  	    int businessNo = getBusinessNo(session);

  	    SellerPage sp = sellerService.selectSellerHomeDetail(businessNo);

  	    
  	    if (sp == null) {
  	        model.addAttribute("sp", null); // 명시적으로 'sp'라는 이름으로 null을 추가
  	    } else {
  	        model.addAttribute("sp", sp); // 'sp'라는 이름으로 객체 추가
  	    }

  	    return "seller/sellerHomeDetailView";
  	}
    
  	// 판매자 홈 수정 페이지
    @RequestMapping("updateForm.srh")
  	public String sellerHomeUpdateForm(HttpSession session, Model model) {
    	int businessNo = getBusinessNo(session);

  	    SellerPage sp = sellerService.selectSellerHomeDetail(businessNo);

  	    
  	    if (sp == null) {
  	        model.addAttribute("sp", null); // 명시적으로 'sp'라는 이름으로 null을 추가
  	    } else {
  	        model.addAttribute("sp", sp); // 'sp'라는 이름으로 객체 추가
  	    }
    	
  		return "seller/sellerHomeUpdateForm";
  	}
    
    // 판매자 홈 수정
    @RequestMapping("update.srh")
    public String updateSellerHome(SellerPage sellerPage, MultipartFile storeHomeImage, @RequestParam("categoriesJson") String categoriesJson,
        HttpSession session, RedirectAttributes redirectAttributes) {
        
        // 새로운 첨부파일이 넘어온 경우
        if (!storeHomeImage.getOriginalFilename().equals("")) {
            // 기존의 첨부파일이 있다면 기존의 파일을 삭제
            if (sellerPage.getSpOriginName() != null) {
                new File(session.getServletContext().getRealPath(sellerPage.getSpChangeName())).delete();
            }
            
            // 새로 넘어온 첨부파일을 서버에 업로드
            String changeName = saveFile(storeHomeImage, session);
            
            sellerPage.setSpOriginName(storeHomeImage.getOriginalFilename());
            sellerPage.setSpChangeName("resources/upFiles/productImg/" + changeName);
        }
        
        int businessNo = getBusinessNo(session);
        sellerPage.setBusinessNo(businessNo);
       
        int sellerPageNo = getSellerPageNo(session);
        
        ProductCategoryDTO categories = null;
        
        Type listType = new TypeToken<ProductCategoryDTO>() {}.getType();
        categories = gson.fromJson(categoriesJson, listType);
        
        List<ProductCategory> addCategories = categories.getAddCategories();
        List<ProductCategory> deleteCategories = categories.getDeleteCategories();

        int result = sellerService.updateSellerHome(sellerPage, addCategories, deleteCategories, sellerPageNo);
            
        if (result > 0) { // 성공
            session.setAttribute("SellerHomeRegistered", true);
            redirectAttributes.addFlashAttribute("message", "등록이 완료되었습니다.");
            return "redirect:detail.srh";
        } else { // 실패
            redirectAttributes.addFlashAttribute("error", "판매자 홈을 업데이트하는 데 실패했습니다.");
            return "redirect:detail.srh"; // 실패 시 등록 페이지로 리다이렉트
        }
      
    }
   
    // 판매자 상품
    @RequestMapping("enrollForm.pd")
  	public String productEnrollForm() {
  		return "seller/productEnrollForm";
  	}
    
    // 판매자 상품 등록
//    @RequestMapping("insert.pd")
//  	public String insertProduct(Product product, MultipartFile productImage, @RequestParam("optionsJson") String optionsJson,
//    HttpSession session, RedirectAttributes redirectAttributes) {
//    	
//    	
//    	System.out.println("Product: " + product.getCaNo());
//    	System.out.println("Options JSON: " + optionsJson);
//    	
//         if (!productImage.getOriginalFilename().isEmpty()) {
//             String changeName = saveFile(productImage, session);
//             product.setPdOriginName(productImage.getOriginalFilename());
//             product.setPdChangeName("resources/upFiles/productImg/" + changeName);
//         }
//
//      
//             Type listType = new TypeToken<List<ProductOption>>() {}.getType();
//             List<ProductOption> options = gson.fromJson(optionsJson, listType);
//
//         	 int result = sellerService.insertProduct(product, options);
//         	 
//             if (result > 0 ) { // 성공
//            	 
//                 redirectAttributes.addFlashAttribute("message", "등록이 완료되었습니다.");
//                 
//                 return "redirect:list.pd";
//                 
//             }else { // 실패
//             	redirectAttributes.addFlashAttribute("message", "등록 실패하셨습니다.");
//                 return "redirect:list.pd"; // 등록 페이지로 리다이렉트
//                 
//             }
//    
//     }
    
 // 판매자 상품 등록
    @RequestMapping("insert.pd")
    public String insertProduct(Product product, MultipartFile productImage,
                                @RequestParam("optionNames[]") String[] optionNames,
                                @RequestParam("optionQuantities[]") String[] optionQuantities,
                                HttpSession session, RedirectAttributes redirectAttributes) {
        

        // 파일이 제출되었는지 확인
        if (!productImage.getOriginalFilename().isEmpty()) {
            String changeName = saveFile(productImage, session);
            product.setPdOriginName(productImage.getOriginalFilename());
            product.setPdChangeName("resources/upFiles/productImg/" + changeName);
        }

        // 옵션명과 수량을 ProductOption 객체 리스트로 변환
        List<ProductOption> options = new ArrayList<>();
        for (int i = 0; i < optionNames.length; i++) {
            ProductOption option = new ProductOption();
            option.setOptionName(optionNames[i]);
            option.setPdCount(Integer.parseInt(optionQuantities[i]));
            options.add(option);
        }

        int result = sellerService.insertProduct(product, options);

        if (result > 0) { // 성공
            redirectAttributes.addFlashAttribute("message", "등록이 완료되었습니다.");
            return "redirect:list.pd";
        } else { // 실패
            redirectAttributes.addFlashAttribute("message", "등록 실패하셨습니다.");
            return "redirect:list.pd"; // 등록 페이지로 리다이렉트
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
  	public String selectProductList(@RequestParam(value="cpage", defaultValue="1") int currentPage,HttpSession session, Model model) {
    	
		int boardCount = sellerService.selectProductListCount();
		//logger.info("list.bo 실행");
		
		int businessNo = getBusinessNo(session);
		
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 5);
		List<Product> list = sellerService.selectProductList(pi,businessNo);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "seller/productListView";
	}
    
    //상품 카테고리 검색
//    @RequestMapping("search.pd")//게시글 목록 띄우기
//	public String searchProduct(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="condition", defaultValue="category") String condition, @RequestParam(value="keyword", defaultValue="") String keyword, Model model) {
//		
//		HashMap<String, String>map = new HashMap<>();
//		map.put("condition", condition);
//		map.put("keyword", keyword);
//		
//		int boardCount = sellerService.searchListCount(map);
//		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 10);
//		ArrayList<Product> list = sellerService.searchList(pi, map);
//		
//		model.addAttribute("list", list);
//		model.addAttribute("pi", pi);
//		model.addAttribute("keyword", keyword);
//		model.addAttribute("condition", condition);
//		
//		return "seller/productListView";
//	}
    
    // 옵션 불러오는 ajax
    @RequestMapping(value = "options.ax", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String ajaxGetOptions(@RequestParam("pno") int pno) {

    	List<ProductOption> options = sellerService.selectOptions(pno);
        return new Gson().toJson(options);
    }
   
    // 상품 불러오기
    @RequestMapping("detail.pd")
	public String selectProduct(int pno, Model model) {
		
			Product pd = sellerService.selectProduct(pno);
			
			model.addAttribute("pd", pd);
			
			return "seller/sellerProductDetailView";
	}
    
    // 상품 정보 수정 페이지
    @RequestMapping("updateForm.pd")
  	public String productUpdateForm(int pno, Model model) {
    	
    	Product pd = sellerService.selectProduct(pno);
		
		model.addAttribute("pd", pd);
    	
  		return "seller/productUpdateForm";
  	}
    
    //상품 정보 수정
//    @RequestMapping("update.pd")
//  	public String updateProduct(Product product, MultipartFile productImage, @RequestParam("optionsJson") String optionsJson,
//  		    HttpSession session, RedirectAttributes redirectAttributes) {
//    	
//    	//새로운 첨부파일이 넘어온 경우
//		if(!productImage.getOriginalFilename().equals("")) {
//			//기존의 첨부파일이 있다 => 기존의 파일을 삭제
//			if(product.getPdOriginName() != null) {
//				new File(session.getServletContext().getRealPath(product.getPdChangeName())).delete();
//			}
//			
//			//새로 넘어온 첨부파일을 서버에 업로드 시키기
//			String changeName = saveFile(productImage, session);
//			
//			product.setPdOriginName(productImage.getOriginalFilename());
//			product.setPdChangeName("/resources/upFiles/productImg/" + changeName);
//		}
//    			
//	
//            Type listType = new TypeToken<List<ProductOption>>() {}.getType();
//            List<ProductOption> options = gson.fromJson(optionsJson, listType);
//
//        	 int result = sellerService.updateProduct(product, options);
//        	 
//            if (result > 0 ) { // 성공
//           	 
//                redirectAttributes.addFlashAttribute("message", "등록이 완료되었습니다.");
//                
//                return "redirect:list.pd";
//                
//            }else { // 실패
//            	redirectAttributes.addFlashAttribute("message", "등록 실패하셨습니다.");
//                return "redirect:list.pd"; // 등록 페이지로 리다이렉트
//                
//            }
//     	
//    			
//  	}
    
    @RequestMapping("update.pd")
    public String updateProduct(Product product,
                                MultipartFile productImage,
                                @RequestParam("optionNames[]") String[] optionNames,
                                @RequestParam("optionQuantities[]") Integer[] optionQuantities,
                                @RequestParam("optionStatus[]") String[] optionStatus,
                                @RequestParam(value = "pdOptionNo[]", required = false) Integer[] pdOptionNos,
                                int pno,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
    	
    	 
        // 새로운 첨부파일이 넘어온 경우
        if (!productImage.getOriginalFilename().isEmpty()) {
            // 기존의 첨부파일이 있다면 삭제
            if (product.getPdOriginName() != null) {
                new File(session.getServletContext().getRealPath(product.getPdChangeName())).delete();
            }

            // 새로 넘어온 첨부파일을 서버에 업로드
            String changeName = saveFile(productImage, session);

            product.setPdOriginName(productImage.getOriginalFilename());
            product.setPdChangeName("/resources/upFiles/productImg/" + changeName);
        }
        
        Product po = new Product();
        
        po.setPdNo(pno);
        
        List<ProductOption> options = new ArrayList<>();
        for (int i = 0; i < optionNames.length; i++) {
            if (optionNames[i] != null && !optionNames[i].isEmpty() && optionQuantities[i] != null && optionStatus[i] != null) {
                ProductOption option = new ProductOption();
                option.setOptionName(optionNames[i]);
                option.setPdCount(optionQuantities[i]);
                option.setOptionStatus(optionStatus[i]);
                option.setPdOptionNo(pdOptionNos != null && pdOptionNos.length > i ? pdOptionNos[i] : null); // 이 부분입니다.
                option.setPno(pno);
                options.add(option);
            }
        }

        int result = sellerService.updateProduct(product, options);
        
        if(result > 0) {
            redirectAttributes.addFlashAttribute("message", "등록이 완료되었습니다.");
            return "redirect:list.pd";
        } else {
        	
            redirectAttributes.addFlashAttribute("message", "등록 실패하셨습니다.");
            return "redirect:list.pd"; // 등록 페이지로 리다이렉트
        }
    }
    
    //상품 삭제
    @RequestMapping("delete.pd")
    public String deleteProduct(int pno) {
    	
    	int result = sellerService.deleteProduct(pno);
    	
    	if(result > 0) {
    		log.info("msg" + "삭제완료");
    	}else {
    		log.info("msg" + "삭제 실패");
    	}
    	
    	return "redirect:list.pd";
    }
    
    /*
     * storeMain
     */
    
    // 스토어 상품 리스트
    @RequestMapping("list.spd")
  	public String storeMain(HttpSession session, Model model) {
		
    	List<StoreMainDTO> popularList = sellerService.selectPopularList();
    	
		List<StoreMainDTO> recentList = sellerService.selectRecentList();
		
		model.addAttribute("popularList", popularList);
		model.addAttribute("recentList", recentList);
		
		return "store/storeMain";
	}
    
    // 판매 상품 상세 정보
    @RequestMapping("detail.spd")
    public String selectSalesProduct(int pno, Model model) {
    	
    	StoreMainDTO spd = sellerService.selectSalesProduct(pno);
    	
    	model.addAttribute("spd",spd);
    	
    	return "seller/productDetailView";
    }
    
    // 무한 스크롤로 전체 상품 가져오기
  
    @RequestMapping(value = "/allProduct.ax", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String fetchProducts(@RequestParam("page") int page, @RequestParam("size") int size) {
    	
        List<StoreMainDTO> products = sellerService.selectAllProduct(page, size);
        boolean hasMore = products.size() == size; // 더 불러올 데이터가 있는지 확인
        HashMap<String, Object> response = new HashMap<>();
        
        response.put("products", products);
        response.put("hasMore", hasMore);
        
        return new Gson().toJson(response);
    }
    
    // 고객 문의 관리
    
    @RequestMapping("manage.ci")
    public String selectCustomerInqueryManagement() {
    	
    	return "seller/customerInqueryManagement";
    }
    
    // 구매 페이지
    
    @RequestMapping("order.pd")
    public String insertBuyingProduct() {
    	
    	return "store/order";
    }
    
	@ResponseBody
	@RequestMapping(value="getAlarmList.se", produces = "application/json; charset=UTF-8")
	public String getAlarmList(@RequestParam("userNo") int userNo) {
		ArrayList<String> list = sellerService.getAlarmList(userNo);

		
		return new Gson().toJson(list);
	}
   
}
