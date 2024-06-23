package com.psvm.seller.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.psvm.commons.vo.PageInfo;
import com.psvm.member.vo.Member;
import com.psvm.seller.dto.FaqDTO;
import com.psvm.seller.dto.ProductDTO;
import com.psvm.seller.dto.StoreMainDTO;
import com.psvm.seller.vo.Faq;
import com.psvm.seller.vo.FaqAnswer;
import com.psvm.seller.vo.PayInfo;
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
		
		return sqlSession.selectList("sellerMapper.selectCategories", businessNo);
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
	public int selectProductListCount(SqlSessionTemplate sqlSession,int businessNo) {
		return sqlSession.selectOne("sellerMapper.selectProductListCount",businessNo);
	}

	// 상품 리스트
	public List<Product> selectProductList(SqlSessionTemplate sqlSession, PageInfo pi, int businessNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("sellerMapper.selectProductList", businessNo, rowBounds);
	}
	
	//상품 리스트 검색
	public int searchProductListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.selectOne("sellerMapper.searchProductListCount", map);
		
	}
	
	public List<Product> searchProductList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("sellerMapper.searchProductList", map, rowBounds);
		
	}
	
	// 상품 옵션 불러오기
	public List<ProductOption> selectOptions(SqlSessionTemplate sqlSession,int pno) {
		
		return sqlSession.selectList("sellerMapper.selectOptions", pno);
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
	
	//주문 관리
	
	//배송 관리
	
	//고객 문의 관리
	public int selectCsInquiryListCount(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("sellerMapper.selectCsInquiryListCount",userNo);
	}
	
	public List<FaqDTO> selectCsInquiryList(SqlSessionTemplate sqlSession,PageInfo pi,int userNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return sqlSession.selectList("sellerMapper.selectCsInquiryList",userNo,rowBounds);
	}
	
	//고객 문의 답변
	public int insertInquiryAnswer(SqlSessionTemplate sqlSession, FaqAnswer faqAnswer) {
		
		return sqlSession.insert("sellerMapper.insertInquiryAnswer",faqAnswer);
	}
	
	public int updateInquiry(SqlSessionTemplate sqlSession, int faqNo) {
		
		return sqlSession.update("sellerMapper.updateInquiry", faqNo);
	}
	
	//고객 문의 검색
	public int searchInquiryListCount(SqlSessionTemplate sqlSession,HashMap<String, Object> map) {
		
		return sqlSession.selectOne("sellerMapper.searchInquiryListCount",map);
	}

	public List<FaqDTO> searchInquiryList(SqlSessionTemplate sqlSession,PageInfo pi, HashMap<String, Object> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("sellerMapper.searchInquiryList",map,rowBounds);
	}
	
	
	//판매자 탈퇴
	public int updateMemberAuthority(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.update("sellerMapper.updateMemberAuthority",userNo);
		
	}
	
	public int deleteSellerinfo(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.delete("sellerMapper.deleteSellerinfo",userNo);
		
	}
	
	//############################################## 스토어 메인  ############################################################
	
	// 인기 상품 불러오기
	public List<StoreMainDTO> selectPopularList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("sellerMapper.selectPopularList");
	}
	
	// 최신 상품 불러오기
	public List<StoreMainDTO> selectRecentList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("sellerMapper.selectRecentList");
	}
	
	// 무한 스크롤로 전체 상품 가져오기
	public List<StoreMainDTO> selectAllProduct(SqlSessionTemplate sqlSession,int page, int size) {
		
		int offset = page * size;  
		
		RowBounds rowBounds = new RowBounds(offset, size);
		
		return sqlSession.selectList("sellerMapper.selectAllProduct", null, rowBounds);
	}
	
	public List<StoreMainDTO> selectSearchProduct(SqlSessionTemplate sqlSession,int page, int size, String title) {
		
		int offset = page * size;  
		
		RowBounds rowBounds = new RowBounds(offset, size);
		
		return (List)sqlSession.selectList("sellerMapper.selectSearchProduct", title, rowBounds);
	}
	
	
	
	//############################################## 판매 상품 상세 페이지  ############################################################
	
	// 판매 상품 상세 정보
	public ProductDTO selectSalesProduct( SqlSessionTemplate sqlSession,int pno) {
		
		return sqlSession.selectOne("sellerMapper.selectSalesProduct", pno);
	}
	
	//상품 구매한 유저 번호 가져오기
	public List<PayInfo> getPayUserNo(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.selectList("sellerMapper.getPayUserNo", pno);
	}
	
	// 리뷰 리스트 페이징
	public int selectReviewListCount(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.selectOne("sellerMapper.selectReviewListCount",pno);
	}
	
	//리뷰 가져오기
	public List<Review> selectReviewList(SqlSessionTemplate sqlSession,PageInfo rpi,int pno){
		int offset = (rpi.getCurrentPage() - 1) * rpi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, rpi.getBoardLimit());
		
		
		return sqlSession.selectList("sellerMapper.selectReviewList",pno,rowBounds);
	}
	
	// 문의 리스트 페이징
	public int selectInquiryListCount(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("sellerMapper.selectInquiryListCount");
	}
	
	//문의 가져오기
	public List<FaqDTO> selectInquiryList(SqlSessionTemplate sqlSession,PageInfo ipi,int pno){
		int offset = (ipi.getCurrentPage() - 1) * ipi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, ipi.getBoardLimit());
		
		
		return sqlSession.selectList("sellerMapper.selectInquiryList",pno,rowBounds);
	}
	
	// 장바구니 담기
	public int insertCart(SqlSessionTemplate sqlSession,List<Map<String, Object>> data) {
		
		return sqlSession.insert("sellerMapper.insertCart", data);
	}
	
	//리뷰 쓰기
	public int insertReview(SqlSessionTemplate sqlSession,Review review) {
		
		return sqlSession.insert("sellerMapper.insertReview",review);
	}
	
	//문의 쓰기
	public int insertInquiry(SqlSessionTemplate sqlSession, Faq faq) {
		
		return sqlSession.insert("sellerMapper.insertInquiry",faq);
	}
	
	
	//############################################## 구매 페이지  ############################################################
	
	//구매 페이지

	
	//상품 구매
	public int getBusinessNo(SqlSessionTemplate sqlSession, String productName) {
		
		return sqlSession.selectOne("sellerMapper.getBusinessNoToProductName", productName);
	}
	
	public int insertOrder(SqlSessionTemplate sqlSession, PayInfo payInfo) {
		
		return sqlSession.insert("sellerMapper.insertOrder",payInfo);
	}
	
}
