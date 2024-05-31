package com.psvm.seller.service;


import java.util.ArrayList;

import com.psvm.commons.vo.PageInfo;
import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

public interface SellerService {
	
	// 사용자 정보 불러오기
	public SellerInfo selectSeller(int userNo);
	
	// 사업자 번호 가져오기
	public int selectBusinessNo(int userNo);
	
	// 판매자 홈 등록
	public int insertSellerHome(SellerPage sellerPage, ArrayList<String> categories);
	
	// 판매 홈 카테고리 불러오기
	public ArrayList<ProductCategory> selectCategories(int businessNo);

	// 판매자 홈 불러오기
	public SellerPage selectSellerHomeDetail(int businessNo);
	
	// 상품 등록
	public int insertProduct(Product product, int pdCount, ArrayList<String> options);
	
	public int selectProductListCount();
	
	public ArrayList<Product> ProductList(PageInfo pi,int businessNo);
	
	public Product selectProduct(int pno);
}
