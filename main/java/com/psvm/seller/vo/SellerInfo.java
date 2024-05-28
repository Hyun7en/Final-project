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
@Setter
@ToString
public class SellerInfo {
	
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
}
