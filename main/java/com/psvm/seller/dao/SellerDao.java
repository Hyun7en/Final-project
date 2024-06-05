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
	
	// 판매자 정보 불러오기
	public SellerInfo selectSeller(SqlSessionTemplate sqlSession, int userNo){
		
		return sqlSession.selectOne("sellerMapper.selectSeller", userNo);
		
	}
	
	// 사업자 번호 가져오기
	public int selectBusinessNo(SqlSessionTemplate sqlSession, int userNo){
		
		return sqlSession.selectOne("sellerMapper.selectBusinessNo", userNo);
		
	}
	
	// 판매자 홈 등록 
	public int insertSellerHome(SqlSessionTemplate sqlSession, SellerPage sellerPage){
		
	    return sqlSession.insert("sellerMapper.insertSellerHome", sellerPage);
	    
	}

	//카테고리 넣기
	public int insertProductCategory(SqlSessionTemplate sqlSession, String category){
		
		return sqlSession.insert("sellerMapper.insertProductCategory", category);
		
	}

	// 판매 홈 카테고리 불러오기
	public ArrayList<ProductCategory> selectCategories(SqlSessionTemplate sqlSession, int businessNo) {
		
		return (ArrayList)sqlSession.selectList("sellerMapper.selectCategories", businessNo);
	} 
	
	// 판매자 홈 불러오기
	public SellerPage selectSellerHomeDetail(SqlSessionTemplate sqlSession, int businessNo) {
		
		return sqlSession.selectOne("sellerMapper.selectSellerHomeDetail", businessNo);
	}
	
	//판매자 홈 수정
	public int updateSellerHome(SqlSessionTemplate sqlSession, SellerPage sellerPage){
		
	    return sqlSession.insert("sellerMapper.updateSellerHome", sellerPage);
	   
	}

	//수정한 카테고리 넣기
	public int updateProductCategory(SqlSessionTemplate sqlSession, String category){
		
		return sqlSession.insert("sellerMapper.updateProductCategory", category);
		
	}
	
	// 상품 등록
	public int insertpProduct(SqlSessionTemplate sqlSession, Product product) {
		
		return sqlSession.insert("sellerMapper.insertProduct", product);
	}

	// 옵션 등록
	public int insertProductOption(SqlSessionTemplate sqlSession, HashMap<String,Object> newMap){
	
		return sqlSession.insert("sellerMapper.insertProductOption", newMap);
			
	}

	// 상품 리스트 페이징
	public int selectProductListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sellerMapper.selectProductListCount");
	}

	// 상품 리스트 불러오기
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, PageInfo pi, int businessNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("sellerMapper.selectProductList", businessNo, rowBounds);
	}
	
	// 상품 옵션 불러오기
	public ArrayList<ProductOption> selectOptions(SqlSessionTemplate sqlSession,int pno) {
		
		return (ArrayList)sqlSession.selectList("sellerMapper.selectOptions", pno);
	}
	
	// 상품 불러오기
	public Product selectProduct(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.selectOne("sellerMapper.selectProduct", pno);
	}
	
	// 상품 정보 수정
	
	// 최신 상품 불러오기
	public ArrayList<Product> selectRecentList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("sellerMapper.selectRecentList");
	}
	
	// 판매 상품 상세 정보
	
	
}
