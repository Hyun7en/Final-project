package com.psvm.seller.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.psvm.commons.vo.PageInfo;
import com.psvm.seller.dto.FaqDTO;
import com.psvm.seller.dto.ProductDTO;
import com.psvm.seller.dto.StoreMainDTO;
import com.psvm.seller.vo.Buy;
import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.ProductOption;
import com.psvm.seller.vo.Review;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

public interface SellerService {
	
	//############################################## 판매자 관련 ############################################################
	
	// 판매자 정보 불러오기
	public SellerInfo selectSeller(int userNo);
	
	// 사업자 번호 가져오기
	public int getBusinessNo(int userNo);
	
	// 판매 홈페이지 번호 가져오기
	public int getSellerPageNo(int businessNo);
	
	// 판매자 홈 등록
	public int insertSellerHome(SellerPage sellerPage, List<String> categories);
	
	// 판매 홈 카테고리 불러오기
	public List<ProductCategory> selectCategories(int businessNo);

	// 판매자 홈 상세
	public SellerPage selectSellerHomeDetail(int businessNo);
	
	// 판매자 홈 수정
	public int updateSellerHome(SellerPage sellerPage, List<ProductCategory> addCategories, List<ProductCategory> deleteCategories,int sellerPageNo);
	
	// 상품 등록
	public int insertProduct(Product product, List<ProductOption> options);
	
	// 상품 리스트 페이징
	public int selectProductListCount();
	
	// 상품 리스트 
	public List<Product> selectProductList(PageInfo pi,int businessNo);
	
	//상품 리스트 검색
	public int searchListCount(HashMap<String, String> map);
	
	public List<Product> searchList(PageInfo pi, HashMap<String, String> map);
	
	// 상품 옵션 불러오기
	public List<ProductOption> selectOptions(int pno);
	
	// 상품 불러오기
	public Product selectProduct(int pno);
	
	// 상품 정보 수정
	public int updateProduct(Product product, List<ProductOption> options);
	
	// 상품 삭제
	public int deleteProduct(int pno);
	
	//############################################## 스토어 메인 ############################################################
	
	// 인기 상품 불러오기
	public List<StoreMainDTO> selectPopularList();
	
	// 최신 상품 불러오기
	public List<StoreMainDTO> selectRecentList();
	
	// 무한 스크롤로 전체 상품 가져오기
	public List<StoreMainDTO> selectAllProduct(int page, int size);
	
	//카테고리 제품 검색
	public List<StoreMainDTO> selectSearchProduct(int page, int size, String title);
	
	//############################################## 판매상품 상세 페이지 #######################################################
	
	// 판매 상품 상세 정보
	public ProductDTO selectSalesProduct(int pno);
	
	//리뷰 가져오기
	public List<Review> selectReviewList();
	
	//문의 가져오기
	public List<FaqDTO> selectInquiryList();
	
	//장바구니 담기
	public int insertCart(List<Map<String, Object>> data);
	
	//리뷰 쓰기
	public int insertReview();
	
	//문의 쓰기
	public int insertInquiry();
	
	//############################################## 구매 페이지 ############################################################
	
	//구매 페이지
}
