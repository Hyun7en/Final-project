package com.psvm.seller.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.psvm.commons.vo.PageInfo;
import com.psvm.seller.dto.ProductDTO;
import com.psvm.seller.dto.StoreMainDTO;
import com.psvm.seller.vo.Buy;
import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.ProductOption;
import com.psvm.seller.vo.Review;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;

@Repository
public class SellerDao {
	
	//############################################## 판매자 관련 ############################################################
	
	// 판매자 정보 불러오기
	public SellerInfo selectSeller(SqlSessionTemplate sqlSession, int userNo){
		
		return sqlSession.selectOne("sellerMapper.selectSeller", userNo);
		
	}
	
	// 사업자 번호 가져오기
	public int getBusinessNo(SqlSessionTemplate sqlSession, int userNo){
		
		return sqlSession.selectOne("sellerMapper.getBusinessNo", userNo);
		
	}
	
	//판매자 홈페이지 번호 가져오기
	public int getSellerPageNo(SqlSessionTemplate sqlSession, int businessNo) {
		return sqlSession.selectOne("sellerMapper.getSellerPageNo", businessNo);
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
	public List<ProductCategory> selectCategories(SqlSessionTemplate sqlSession, int businessNo) {
		
		return (List)sqlSession.selectList("sellerMapper.selectCategories", businessNo);
	} 
	
	// 판매자 홈 상세
	public SellerPage selectSellerHomeDetail(SqlSessionTemplate sqlSession, int businessNo) {
		
		return sqlSession.selectOne("sellerMapper.selectSellerHomeDetail", businessNo);
	}
	
	//판매자 홈 수정
	public int updateSellerHome(SqlSessionTemplate sqlSession, SellerPage sellerPage){
		
	    return sqlSession.update("sellerMapper.updateSellerHome", sellerPage);
	   
	}
	
//	public int getSellerPageNo(SqlSessionTemplate sqlSession) {
//		
//		return sqlSession.selectOne("sellerMapper.getSellerPageNo");
//	}
	
	// 추가할 카테고리 처리
	public int insertNewProductCategory(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.insert("sellerMapper.insertNewProductCategory", map);
	}
	
	// 삭제할 카테고리 처리
	public int deleteProductCategory(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.delete("sellerMapper.deleteProductCategory", map);
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

	// 상품 리스트
	public List<Product> selectProductList(SqlSessionTemplate sqlSession, PageInfo pi, int businessNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (List)sqlSession.selectList("sellerMapper.selectProductList", businessNo, rowBounds);
	}
	
	//상품 리스트 검색
	
	
	// 상품 옵션 불러오기
	public List<ProductOption> selectOptions(SqlSessionTemplate sqlSession,int pno) {
		
		return (List)sqlSession.selectList("sellerMapper.selectOptions", pno);
	}
	
	// 상품 불러오기
	public Product selectProduct(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.selectOne("sellerMapper.selectProduct", pno);
	}
	
	// 상품 정보 수정
	public int updateProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.update("sellerMapper.updateProduct",product);
	}
	
	public int insertNewProductOption(SqlSessionTemplate sqlSession, ProductOption option) {
		return sqlSession.insert("sellerMapper.insertNewProductOption",option);
	}
	
	public int updateProductOption(SqlSessionTemplate sqlSession, ProductOption option) {
		return sqlSession.update("sellerMapper.updateProductOption",option);
	}
	
	public int deleteProductOption(SqlSessionTemplate sqlSession, ProductOption option) {
		return sqlSession.delete("sellerMapper.deleteProductOption",option);
	}
	
	
	// 상품 삭제
	public int deleteProduct(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.update("sellerMapper.deleteProduct",pno);
	}
	
	//############################################## 스토어 메인  ############################################################
	
	// 인기 상품 불러오기
	public List<StoreMainDTO> selectPopularList(SqlSessionTemplate sqlSession) {
		
		return (List)sqlSession.selectList("sellerMapper.selectPopularList");
	}
	
	// 최신 상품 불러오기
	public List<StoreMainDTO> selectRecentList(SqlSessionTemplate sqlSession) {
		
		return (List)sqlSession.selectList("sellerMapper.selectRecentList");
	}
	
	// 무한 스크롤로 전체 상품 가져오기
	public List<StoreMainDTO> selectAllProduct(SqlSessionTemplate sqlSession,int page, int size) {
		
		int offset = page * size;  
		
		RowBounds rowBounds = new RowBounds(offset, size);
		
		return (List)sqlSession.selectList("sellerMapper.selectAllProduct", null, rowBounds);
	}
	
	//############################################## 판매 상품 상세 페이지  ############################################################
	
	// 판매 상품 상세 정보
	public ProductDTO selectSalesProduct( SqlSessionTemplate sqlSession,int pno) {
		
		return sqlSession.selectOne("sellerMapper.selectSalesProduct", pno);
	}
	
	//리뷰 가져오기
	
	//문의 가져오기
	
	// 장바구니 담기
	public int insertCart(SqlSessionTemplate sqlSession,List<Map<String, Object>> data) {
		
		return sqlSession.insert("sellerMapper.insertCart", data);
	}
	
	public List<Review> selectReviewList(SqlSessionTemplate sqlSession){
		
		return sqlSession.selectList("sellerMapper.selectReviewList");
	}
	
	//리뷰 쓰기
	
	//문의 쓰기
	
	
	//############################################## 구매 페이지  ############################################################
	
	//구매 페이지
	
}
