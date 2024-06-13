package com.psvm.seller.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ProductDTO {
	
	//사업자
	private int businessNo;
	private int userNo;
	private String businessName;
	private String subBusinessName;
	private Date openBusinessDate;
	private String storeName;
	private int crn;
	private String mainBusinessName;
	private String mainItemName;
	private String businessAddress;
	private String businessAccount;
	private String status;
	
	//판매자 홈페이지
	private int sellerPageNo;
	private String sellerExplain;
	private Date spEnrollDate;
	private String spOriginName;
	private String spChangeName;
	
	//카테고리
	private int caNo;
	private String Category;
	
	//상품
	private int pdNo;
	private String pdCategory;
	private String pdTitle;
	private int pdPrice;
	private String pdContent;
	private Date pdEnrollDate;
	private int pdStar;
	private String pdOriginName;
	private String pdChangeName;
	private String pdStatus;
	
	//옵션
	private int pdCount;
	private String poStatus;
	private String optionName;
	private int pdOptionNo;
	
	//리뷰
	private int replyNo;
	private Date reviewDate;
	private int reviewDibs;
	private String reviewContents;
}
