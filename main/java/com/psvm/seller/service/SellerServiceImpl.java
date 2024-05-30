package com.psvm.seller.service;


import java.util.ArrayList;
import java.util.HashMap;

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
		int t2 = sellerDao.insertProductCategory(sqlSession, categories);
								
		
		return t1*t2;
	}

	@Override
	public ArrayList<ProductCategory> selectCategories(int businessNo) {
		return sellerDao.selectCategories(sqlSession, businessNo);
	}
	
	@Override
	public SellerPage selectSellerHomeDetail(int businessNo) {
		return sellerDao.selectSellerHomeDetail(sqlSession, businessNo);
	}

	@Transactional
	@Override
	public int insertProduct(Product product, HashMap<String, Object> map) {
		
		int t1 = sellerDao.insertpProduct(sqlSession, product);
		int t2 = sellerDao.insertProductOption(sqlSession,map);
								
		
		return t1*t2;
	}

	
}
