package com.psvm.seller.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.psvm.commons.vo.PageInfo;
import com.psvm.seller.dao.SellerDao;
import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.ProductOption;
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
	
	//카테고리 넣기
	@Transactional
	@Override
	public int insertSellerHome(SellerPage sellerPage, ArrayList<String> categories) {
		
		int t1 = sellerDao.insertSellerPage(sqlSession, sellerPage);
		
		int t2 = 1;
		
		for(String category : categories) {
			
			if(!category.equals("")) {
				
				t2 = t2 * sellerDao.insertProductCategory(sqlSession, category);
				
			}
			
		}	
		
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

	//옵션 넣기
	@Transactional
	@Override
	public int insertProduct(Product product, ArrayList<ProductOption> options) {
		
		int t1 = sellerDao.insertpProduct(sqlSession, product);
		
		int t2 = 1;
		
		System.out.println(options);
		
		for(ProductOption option : options) {
		
			HashMap<String,Object> newMap = new HashMap<>();
			
			newMap.put("optionName", option.getOptionName());
			
			newMap.put("pdCount", option.getPdCount());
			
			if(!option.getOptionName().equals("")) {
				t2 = t2 * sellerDao.insertProductOption(sqlSession, newMap);
			}		
		}						
		
		return t1*t2;
	}

	@Override
	public int selectProductListCount() {
		
		int count = sellerDao.selectProductListCount(sqlSession);
		
		return count;
	}

	@Override
	public ArrayList<Product> ProductList(PageInfo pi, int businessNo) {
		
		return sellerDao.ProductList(sqlSession, pi,businessNo);
	}

	@Override
	public Product selectProduct(int pno) {
		
		return sellerDao.selectProduct(sqlSession, pno);
	}

	@Override
	public ArrayList<ProductOption> selectOptions(int pno) {
		
		return sellerDao.selectOptions(sqlSession, pno);
	}

	@Override
	public ArrayList<Product> selectRecentList() {
		
		return sellerDao.selectRecentList(sqlSession);
	}

	@Override
	public Product selectSalesProduct(int pno) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
