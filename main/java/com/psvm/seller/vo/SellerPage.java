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
public class SellerPage {
	
	private int sellerPageNo;
	private int businessNo;
	private String sellerExplain;
	private Date spEnrollDate;
	private String spOriginName;
	private String spChangeName;
}
