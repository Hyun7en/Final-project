package com.psvm.seller.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.seller.dao.SellerDao;
import com.psvm.seller.vo.ProductAttachment;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;


@Service
public class SellerServiceImpl implements SellerService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SellerDao sellerDao;

	@Override
	public SellerInfo selectSeller(int userNo) {
		
		return sellerDao.selectSeller(sqlSession, userNo);
	}

	@Override
	public int insertProductAttachment(ProductAttachment productAttachment) {
		return sellerDao.insertProductAttachment(sqlSession, productAttachment);
		
	}

	@Override
	public int insertProductCategory(ProductCategory productCategory) {
		return sellerDao.insertProductCategory(sqlSession, productCategory);		
	}

	@Override
	public int insertSellerPage(SellerPage sellerPage) {
		return sellerDao.insertSellerPage(sqlSession, sellerPage);		
	}


	
}
