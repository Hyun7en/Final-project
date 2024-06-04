package com.psvm.seller.service;


import java.util.ArrayList;

import com.psvm.commons.vo.PageInfo;
import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.ProductOption;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

public interface SellerService {
	
	// 판매자 정보 불러오기
	public SellerInfo selectSeller(int userNo);
	
	// 사업자 번호 가져오기
	public int selectBusinessNo(int userNo);
	
	// 판매자 홈 등록
	public int insertSellerHome(SellerPage sellerPage, ArrayList<String> categories);
	
	// 판매 홈 카테고리 등록
	public ArrayList<ProductCategory> selectCategories(int businessNo);

	// 판매자 홈 불러오기
	public SellerPage selectSellerHomeDetail(int businessNo);
	
	// 판매자 홈 수정
	public int updateSellerHome(SellerPage sellerPage, ArrayList<String> categories);
	
	// 상품 등록
	public int insertProduct(Product product, ArrayList<ProductOption> options);
	
	// 상품 리스트 페이징
	public int selectProductListCount();
	
	// 상품 리스트 불러오기 
	public ArrayList<Product> selectProductList(PageInfo pi,int businessNo);
	
	// 상품 옵션 불러오기
	public ArrayList<ProductOption> selectOptions(int pno);
	
	// 상품 불러오기
	public Product selectProduct(int pno);
	
	// 상품 정보 수정
	public int updateProduct(Product product, ArrayList<ProductOption> options);
	
	// 최신 상품 불러오기
	public ArrayList<Product> selectRecentList();
	
	// 판매 상품 상세 정보
	public Product selectSalesProduct(int pno);
	
	
}
