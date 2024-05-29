package com.psvm.seller.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.psvm.seller.dao.SellerDao;
import com.psvm.seller.vo.Product;
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
	public int selectBusinessNo(int userNo) {
		return sellerDao.selectBusinessNo(sqlSession, userNo);
	}
	
	@Transactional
	@Override
	public int insertSellerHome(SellerPage sellerPage, ArrayList<String> categories) {
		
		int t1 = sellerDao.insertSellerPage(sqlSession, sellerPage);
		int t3 = sellerDao.insertProductCategory(sqlSession, categories);
								
		
		return t1*t3;
	}

	@Override
	public ArrayList<ProductCategory> selectCategories(int businessNo) {
		return sellerDao.selectCategories(sqlSession, businessNo);
	}
	
	@Override
	public SellerPage selectSellerHomeDetail(int businessNo) {
		return sellerDao.selectSellerHomeDetail(sqlSession, businessNo);
	}

	@Override
	public int insertProduct(Product product) {
		
		return sellerDao.insertProduct(sqlSession, product);
	}

	
}
