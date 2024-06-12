package com.psvm.store.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class StoreInfo {
	//판매자 홈페이지/SELLER_PAGE → 홈 소개, 이미지 파일(배너)
	//사업자 정보/SELLER_INFO → 상호명
	//판매상품카테고리/PRODUCT_CATEGORY → 전체

	//판매자 알람/USER_ALARM → 알람
	
	//페이지네이션
	//상품/PRODUCT → 상품번호, 판매카테고리, 상품명, 판매가액, 별점, 이미지 파일, 판매중
	//관심상품/LOVE_IT → 상품 별 관심 등록
	
	private int sellerPageNo; //판매 홈페이지 번호
	private int businessNo; //사업자 번호
	private String sellerExplain; //홈 소개
	private String spChangeName; //변경파일명(배너 이미지)
	private String prCategory; // 판매카테고리
	private String storeName; //상호명
	private int prNo; //상품번호
	private String prTitle; //상품명
	private int prPrice; //판매가액
	private Date prEnrollDate; //등록일자
	private int prStar; //별점
	private String prChangeName; //변경파일명(상품 이미지)
	private String prStatus; //판매중
	private int userNo; //회원고유번호
	private int reviewCount; //리뷰 갯수
	private Date loveDate; //찜 등록 날짜
}
