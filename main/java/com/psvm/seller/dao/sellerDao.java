package com.psvm.seller.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

@Repository
public class SellerDao {
	
	public SellerInfo selectSeller(SqlSessionTemplate sqlSession, int userNo){
		
		
		return sqlSession.selectOne("sellerMapper.selectSeller", userNo);
		
	}
	
	public int selectBusinessNo(SqlSessionTemplate sqlSession, int userNo){
		
		return sqlSession.selectOne("sellerMapper.selectBusinessNo", userNo);
		
	}
	
	public int insertSellerPage(SqlSessionTemplate sqlSession, SellerPage sellerPage){
		
	    	return sqlSession.insert("sellerMapper.insertSellerPage", sellerPage);
	    
	}

	public int insertProductCategory(SqlSessionTemplate sqlSession, ArrayList<String> categories){
		
		int result = 1;
		
		for(String category : categories) {
			
			if(!category.equals("")) {
				result = result * sqlSession.insert("sellerMapper.insertProductCategory", category);
			}
			
		}
			
		return result;	
	}

	public ArrayList<ProductCategory> selectCategories(SqlSessionTemplate sqlSession, int businessNo) {
		
		return (ArrayList)sqlSession.selectList("sellerMapper.selectCategories", businessNo);
	} 
	
	public SellerPage selectSellerHomeDetail(SqlSessionTemplate sqlSession, int businessNo) {
		
		return sqlSession.selectOne("sellerMapper.selectSellerHomeDetail", businessNo);
	}
	
	
	public int insertpProduct(SqlSessionTemplate sqlSession, Product product) {
		
		return sqlSession.insert("sellerMapper.insertProduct", product);
	}

	public int insertProductOption(SqlSessionTemplate sqlSession, ArrayList<String> options){
	
		int result = 1;
		
		for(String option : options) {
			
			if(!option.equals("")) {
				result = result * sqlSession.insert("sellerMapper.insertProductOption", option);
			}
		
	}
		
	return result;	
}

}
