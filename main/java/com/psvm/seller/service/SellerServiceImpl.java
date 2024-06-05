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

	// 판매자 정보 불러오기
	@Override
	public SellerInfo selectSeller(int userNo) {
		
		return sellerDao.selectSeller(sqlSession, userNo);
	}
	
	// 사업자 번호 가져오기
	@Override
	public int selectBusinessNo(int userNo) {
		
		return sellerDao.selectBusinessNo(sqlSession, userNo);
	}
	
	// 판매자 홈 등록 
	// 카테고리 등록
	@Transactional
	@Override
	public int insertSellerHome(SellerPage sellerPage, ArrayList<String> categories) {
		
		int t1 = sellerDao.insertSellerHome(sqlSession, sellerPage);
		
		int t2 = 1;
		
		for(String category : categories) {
			
			if(!category.equals("")) {
				
				t2 = t2 * sellerDao.insertProductCategory(sqlSession, category);
				
			}
			
		}	
		
		return t1*t2;
		
	}
	
	// 판매 홈 카테고리 불러오기
	@Override
	public ArrayList<ProductCategory> selectCategories(int businessNo) {
		
		return sellerDao.selectCategories(sqlSession, businessNo);
	}
	
	// 판매자 홈 불러오기
	@Override
	public SellerPage selectSellerHomeDetail(int businessNo) {
		
		return sellerDao.selectSellerHomeDetail(sqlSession, businessNo);
	}
	
	//판매자 홈 수정
	@Override
	public int updateSellerHome(SellerPage sellerPage, ArrayList<String> categories) {
		
		int t1 = sellerDao.updateSellerHome(sqlSession, sellerPage);
		
		int t2 = 1;
		
		for(String category : categories) {
			
			if(!category.equals("")) {
				
				t2 = t2 * sellerDao.updateProductCategory(sqlSession, category);
				
			}
			
		}	
		
		return t1*t2;
	}
	
	// 상품 등록
	// 옵션 등록
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

	// 상품 리스트 페이징
	@Override
	public int selectProductListCount() {
		
		int count = sellerDao.selectProductListCount(sqlSession);
		
		return count;
	}

	// 상품 리스트 불러오기
	@Override
	public ArrayList<Product> selectProductList(PageInfo pi, int businessNo) {
		
		return sellerDao.selectProductList(sqlSession, pi,businessNo);
	}

	// 상품 옵션 불러오기
	@Override
	public ArrayList<ProductOption> selectOptions(int pno) {
		
		return sellerDao.selectOptions(sqlSession, pno);
	}
	
	// 상품 불러오기
	@Override
	public Product selectProduct(int pno) {
		
		return sellerDao.selectProduct(sqlSession, pno);
	}
	
	// 상품 정보 수정
	@Override
	public int updateProduct(Product product, ArrayList<ProductOption> options) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 최신 상품 불러오기
	@Override
	public ArrayList<Product> selectRecentList() {
		
		return sellerDao.selectRecentList(sqlSession);
	}

	// 판매 상품 상세 정보
	@Override
	public Product selectSalesProduct(int pno) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
