package com.psvm.seller.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.seller.vo.ProductAttachment;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

@Repository
public class SellerDao {
	
	public SellerInfo selectSeller(SqlSessionTemplate sqlSession, int userNo){
		
		
		return sqlSession.selectOne("sellerMapper.selectSeller", userNo);
		
	}
	
	public int insertProductAttachment(SqlSessionTemplate sqlSession, ProductAttachment productAttachment){
		
		
		return sqlSession.insert("sellerMapper.insertProductAttachment", productAttachment);
		
	}

	public int insertProductCategory(SqlSessionTemplate sqlSession, ProductCategory productCategory){
		
		
		return sqlSession.insert("sellerMapper.insertProductCategory", productCategory);
		
	}

	public int insertSellerPage(SqlSessionTemplate sqlSession, SellerPage sellerPage){
		
		
		return sqlSession.insert("sellerMapper.insertSellerPage", sellerPage);
		
	}
}
