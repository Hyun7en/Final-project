package com.psvm.seller.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.commons.vo.PageInfo;
import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.ProductOption;
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

	//카테고리 넣기
	public int insertProductCategory(SqlSessionTemplate sqlSession, String category){
		
		return sqlSession.insert("sellerMapper.insertProductCategory", category);
		
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

	//option 넣기
	public int insertProductOption(SqlSessionTemplate sqlSession, HashMap<String,Object> newMap){
	
		return sqlSession.insert("sellerMapper.insertProductOption", newMap);
			
	}

	public int selectProductListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sellerMapper.selectProductListCount");
	}

	public ArrayList<Product> ProductList(SqlSessionTemplate sqlSession, PageInfo pi, int businessNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("sellerMapper.ProductList", businessNo, rowBounds);
	}
	
	public Product selectProduct(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.selectOne("sellerMapper.selectProduct", pno);
	}
	
	public ArrayList<ProductOption> selectOptions(SqlSessionTemplate sqlSession,int pno) {
		
		return (ArrayList)sqlSession.selectList("sellerMapper.selectOptions", pno);
	}
	
	public ArrayList<Product> selectRecentList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("sellerMapper.selectRecentList");
	}
}
