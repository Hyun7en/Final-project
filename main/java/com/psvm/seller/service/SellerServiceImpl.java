package com.psvm.seller.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.psvm.commons.vo.PageInfo;
import com.psvm.member.vo.Member;
import com.psvm.seller.dao.SellerDao;
import com.psvm.seller.dto.FaqDTO;
import com.psvm.seller.dto.ProductDTO;
import com.psvm.seller.dto.StoreMainDTO;
import com.psvm.seller.vo.Buy;
import com.psvm.seller.vo.Faq;
import com.psvm.seller.vo.FaqAnswer;
import com.psvm.seller.vo.PayInfo;
import com.psvm.seller.vo.Product;
import com.psvm.seller.vo.ProductCategory;
import com.psvm.seller.vo.ProductOption;
import com.psvm.seller.vo.Review;
import com.psvm.seller.vo.SellerInfo;
import com.psvm.seller.vo.SellerPage;


@Service
public class SellerServiceImpl implements SellerService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SellerDao sellerDao;
	
	//############################################## 판매자 관련 ############################################################

	// 판매자 정보 불러오기
	@Override
	public SellerInfo selectSeller(int userNo) {
		
		return sellerDao.selectSeller(sqlSession, userNo);
	}
	
	// 사업자 번호 가져오기
	@Override
	public int getBusinessNo(int userNo) {
		
		return sellerDao.getBusinessNo(sqlSession, userNo);
	}
	
	//판매자 홈페이지 번호 가져오기
	@Override
	public int getSellerPageNo(int businessNo) {
		
		return sellerDao.getSellerPageNo(sqlSession, businessNo);
	}
	
	// 판매자 홈 등록 
	// 카테고리 등록
	@Override
	@Transactional
	public int insertSellerHome(SellerPage sellerPage, List<String> categories) {
		
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
	public List<ProductCategory> selectCategories(int businessNo) {
		
		return sellerDao.selectCategories(sqlSession, businessNo);
	}
	
	// 판매자 홈 상세
	@Override
	public SellerPage selectSellerHomeDetail(int businessNo) {
		
		return sellerDao.selectSellerHomeDetail(sqlSession, businessNo);
	}
	
	//판매자 홈 수정
	@Override
	@Transactional
	public int updateSellerHome(SellerPage sellerPage, List<ProductCategory> addCategories, List<ProductCategory> deleteCategories,int sellerPageNo) {
		
		int t1 = sellerDao.updateSellerHome(sqlSession, sellerPage);
		
		int t2 = 1;
		int t3 = 1;
		
		
		// 추가할 카테고리 처리
        for (ProductCategory category : addCategories) {
        	
        	category.setSellerPageNo(sellerPageNo);
        	
        	HashMap<String, Object> map = new HashMap<>();
        	
        	map.put("pdCategory", category.getPdCategory());
        	map.put("sellerPageNo", sellerPageNo);
        	
        	if(!category.getPdCategory().equals("")) {
        		t2 = t2 * sellerDao.insertNewProductCategory(sqlSession,map);
        	}
        	
        }

        // 삭제할 카테고리 처리
        for (ProductCategory category : deleteCategories) {
        	
        	HashMap<String, Object> map = new HashMap<>();
        	
        	map.put("caNo", category.getCaNo());
        	
        	if(!category.getPdCategory().equals("")) {
        		t3 = t3 * sellerDao.deleteProductCategory(sqlSession,map);
        	}
        }

		
		return t1 * t2 * t3;
	}
	
	// 상품 등록
	// 옵션 등록
	@Override
	@Transactional
	public int insertProduct(Product product, List<ProductOption> options) {
		
		int t1 = sellerDao.insertpProduct(sqlSession, product);
		
		int t2 = 1;
		
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
	public int selectProductListCount(int businessNo) {
		
		int count = sellerDao.selectProductListCount(sqlSession, businessNo);
		
		return count;
	}

	// 상품 리스트
	@Override
	public List<Product> selectProductList(PageInfo pi, int businessNo) {
		
		return sellerDao.selectProductList(sqlSession, pi,businessNo);
	}
	
	// 상품 리스트 검색
	@Override
	public int searchProductListCount(HashMap<String, Object> map) {
		
		return sellerDao.searchProductListCount(sqlSession,map);
	}
	
	@Override
	public List<Product> searchProductList(PageInfo pi, HashMap<String, Object> map) {
		
		return sellerDao.searchProductList(sqlSession,pi,map);
	}

	// 상품 옵션 불러오기
	@Override
	public List<ProductOption> selectOptions(int pno) {
		
		return sellerDao.selectOptions(sqlSession, pno);
	}
	
	// 상품 불러오기
	@Override
	public Product selectProduct(int pno) {
		
		return sellerDao.selectProduct(sqlSession, pno);
	}
	
	// 상품 정보 수정
	@Override
    @Transactional
    public int updateProduct(Product product, List<ProductOption> options) {
        // 상품 업데이트
        int t1 = sellerDao.updateProduct(sqlSession, product);
        int t2 = 1, t3 =1 ,t4 =1;
        
        // 옵션 처리
        for (ProductOption option : options) {
            switch (option.getOptionStatus()) {
                case "new":
                	 t2 = t2 * sellerDao.insertNewProductOption(sqlSession, option);
                    break;
                case "updated":
                	 t3 = t3 * sellerDao.updateProductOption(sqlSession, option);
                    break;
                case "deleted":
                	 t4 = t4 * sellerDao.deleteProductOption(sqlSession, option);
                    break;
                default:
                    throw new IllegalArgumentException("Unknown option status: " + option.getOptionStatus());
            }
        }
        return t1*t2*t3*t4;
    }
	
	// 상품 삭제
	@Override
	public int deleteProduct(int pno) {
		return sellerDao.deleteProduct(sqlSession, pno);
	}
	
	//주문 관리
	
	//배송 관리
	
	//고객 문의 관리
	@Override
	public int selectCsInquiryListCount(int userNo) {
		int count = sellerDao.selectCsInquiryListCount(sqlSession,userNo);
		
		return count;
	}
	
	@Override
	public List<FaqDTO> selectCsInquiryList(PageInfo pi, int userNo) {
		
		return sellerDao.selectCsInquiryList(sqlSession,pi,userNo);
	}
	
	//고객 문의 답변
	@Override
	@Transactional
	public int insertInquiryAnswer( FaqAnswer faqAnswer, int faqNo) {
		
		int t1 = sellerDao.insertInquiryAnswer(sqlSession,faqAnswer);
		int t2 = sellerDao.updateInquiry(sqlSession,faqNo);
		return t1*t2;
	}
	
	//고객 문의 검색
	@Override
	public int searchInquiryListCount(HashMap<String, Object> map) {
		
		return sellerDao.searchInquiryListCount(sqlSession,map);
	}

	@Override
	public List<FaqDTO> searchInquiryList(PageInfo pi, HashMap<String, Object> map) {
		
		return sellerDao.searchInquiryList(sqlSession,pi,map);
	}
	
	//판매자 탈퇴
	@Override
	@Transactional
	public int deleteSeller(int userNo) {
		
		int t1 = sellerDao.updateMemberAuthority(sqlSession, userNo);
		int t2= sellerDao.deleteSellerinfo(sqlSession, userNo);
		
		return t1*t2;
	}
	
	//############################################## 스토어 메인 ############################################################

	// 인기 상품 불러오기
	@Override
	public List<StoreMainDTO> selectPopularList() {
		
		return sellerDao.selectPopularList(sqlSession);
	}
	
	// 최신 상품 불러오기
	@Override
	public List<StoreMainDTO> selectRecentList() {
		
		return sellerDao.selectRecentList(sqlSession);
	}
	
	// 무한 스크롤로 전체 상품 가져오기
	@Override
	public List<StoreMainDTO> selectAllProduct(int page, int size) {
		
		return sellerDao.selectAllProduct(sqlSession, page, size);
	}
	
	// 카테고리 제품 검색
		@Override
		public List<StoreMainDTO> selectSearchProduct(int page, int size, String title) {
			
			return sellerDao.selectSearchProduct(sqlSession, page, size, title);
		}

	//############################################## 판매상품 상세 페이지 #######################################################
	
	// 판매 상품 상세 정보
	@Override
	public ProductDTO selectSalesProduct(int pno) {
		
		return sellerDao.selectSalesProduct(sqlSession, pno);
	}
	
	//상품 구매한 유저 번호 가져오기
	@Override
	public List<PayInfo> getPayUserNo(int pno) {
		
		return sellerDao.getPayUserNo(sqlSession, pno);
	}
	
	//리뷰 리스트 페이징
	@Override
	public int selectReviewListCount(int pno) {
		int count = sellerDao.selectReviewListCount(sqlSession,pno);
		
		return count;
	}
	
	//리뷰 가져오기
	@Override
	public List<Review> selectReviewList(PageInfo rpi, int pno) {
		
		return sellerDao.selectReviewList(sqlSession,rpi,pno);
	}
	
	//문의 리스트 페이징
	@Override
	public int selectInquiryListCount(int pno) {
		int count = sellerDao.selectInquiryListCount(sqlSession, pno);
		
		return count;
	}
	
	//문의 가져오기
	@Override
	public List<FaqDTO> selectInquiryList(PageInfo ipi,int pno) {
		
		return sellerDao.selectInquiryList(sqlSession,ipi,pno);
	}
	
	// 장바구니 담기
	@Override
    public int insertCart(List<Map<String, Object>> data) {
        
        return sellerDao.insertCart(sqlSession,data);
    }

	//리뷰 쓰기
	@Override
	public int insertReview(Review review) {
		return sellerDao.insertReview(sqlSession,review);
	}

	//문의 쓰기
	@Override
	public int insertInquiry(Faq faq) {
		
		return sellerDao.insertInquiry(sqlSession,faq);
	}
	
	
	//############################################## 구매 페이지 ############################################################
	
	//구매 페이지

	
	//상품 구매
	@Override
	public int getBusinessNo(String productName) {
		
		return sellerDao.getBusinessNo(sqlSession, productName);
	}	
	
	@Override
	public int insertOrder(PayInfo payInfo) {
		
		return sellerDao.insertOrder(sqlSession,payInfo);
	}



	

}
