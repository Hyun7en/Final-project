package com.psvm.seller.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.psvm.commons.vo.PageInfo;
import com.psvm.seller.dao.SellerDao;
import com.psvm.seller.dto.StoreMainDTO;
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
	@Transactional
	@Override
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
	
	// 판매자 홈 불러오기
	@Override
	public SellerPage selectSellerHomeDetail(int businessNo) {
		
		return sellerDao.selectSellerHomeDetail(sqlSession, businessNo);
	}
	
	//판매자 홈 수정
	@Transactional
	@Override
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
	@Transactional
	@Override
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
	public int selectProductListCount() {
		
		int count = sellerDao.selectProductListCount(sqlSession);
		
		return count;
	}

	// 상품 리스트 불러오기
	@Override
	public List<Product> selectProductList(PageInfo pi, int businessNo) {
		
		return sellerDao.selectProductList(sqlSession, pi,businessNo);
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
	
	@Override
	public int deleteProduct(int pno) {
		return sellerDao.deleteProduct(sqlSession, pno);
	}

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

	// 판매 상품 상세 정보
	@Override
	public StoreMainDTO selectSalesProduct(int pno) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 무한 스크롤로 전체 상품 가져오기
	@Override
	public List<StoreMainDTO> selectAllProduct(int page, int size) {
		
		return sellerDao.selectAllProduct(sqlSession, page, size);
	}

}
