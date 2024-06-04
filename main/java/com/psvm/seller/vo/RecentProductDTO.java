package com.psvm.seller.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class RecentProductDTO {
	
	//Product
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
	
	//productCategory
	private int sellerPageNo;
	
	//sellerPage
	private int businessNo;
	private String sellerExplain;
	private Date spEnrollDate;
	private String spOriginName;
	private String spChangeName;
	
	//sellerInfo
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
	
}
