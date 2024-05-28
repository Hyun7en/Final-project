package com.psvm.manager.vo;

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
public class SellerNewApplication {
	   private int userNo;
	   private String userName;
	   private String userId;
	   private int businessNo;
	   private String businessName;
	   private String subBusinessName;
	   private String openBusinessDate;
	   private String storeName;
	   private int crn;
	   private String mainBusinessName;
	   private String mainItemName;
	   private String businessAddress;
	   private int businessAccount;
	   private String applicationDate;
}
