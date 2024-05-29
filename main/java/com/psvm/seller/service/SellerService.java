package com.psvm.seller.service;


import com.psvm.seller.vo.ProductAttachment;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

public interface SellerService {
	
	public SellerInfo selectSeller(int userNo);
	
	public int insertProductAttachment(ProductAttachment productAttachment);

    public int insertProductCategory(ProductCategory productCategory);

    public int insertSellerPage(SellerPage sellerPage);
}
