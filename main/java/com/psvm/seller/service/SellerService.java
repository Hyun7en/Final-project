package com.psvm.seller.service;


import java.util.ArrayList;
import java.util.List;

import com.psvm.commons.vo.PageInfo;
import com.psvm.seller.dto.StoreMainDTO;
import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.ProductOption;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

public interface SellerService {
	
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

	// 판매자 홈 불러오기
	public SellerPage selectSellerHomeDetail(int businessNo);
	
	// 판매자 홈 수정
	public int updateSellerHome(SellerPage sellerPage, List<ProductCategory> addCategories, List<ProductCategory> deleteCategories,int sellerPageNo);
	
	// 상품 등록
	public int insertProduct(Product product, List<ProductOption> options);
	
	// 상품 리스트 페이징
	public int selectProductListCount();
	
	// 상품 리스트 불러오기 
	public List<Product> selectProductList(PageInfo pi,int businessNo);
	
	// 상품 옵션 불러오기
	public List<ProductOption> selectOptions(int pno);
	
	// 상품 불러오기
	public Product selectProduct(int pno);
	
	// 상품 정보 수정
	public int updateProduct(Product product, List<ProductOption> options);
	
	// 상품 삭제
	public int deleteProduct(int pno);
	
	// 인기 상품 불러오기
	public List<StoreMainDTO> selectPopularList();
	
	// 최신 상품 불러오기
	public List<StoreMainDTO> selectRecentList();
	
	// 판매 상품 상세 정보
	public StoreMainDTO selectSalesProduct(int pno);
	
	// 무한 스크롤로 전체 상품 가져오기
	public List<StoreMainDTO> selectAllProduct(int page, int size);
	
	//알람 ajax
	ArrayList<String> getAlarmList(int userNo);
}
