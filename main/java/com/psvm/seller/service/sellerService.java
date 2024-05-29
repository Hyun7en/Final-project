package com.psvm.seller.service;


import java.util.ArrayList;

import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

public interface SellerService {
	
	public SellerInfo selectSeller(int userNo);
	
	public int selectBusinessNo(int userNo);
	
	public int insertSellerHome(SellerPage sellerPage, ArrayList<String> categories);
	
	public ArrayList<ProductCategory> selectCategories(int businessNo);

	public SellerPage selectSellerHomeDetail(int businessNo);
}
