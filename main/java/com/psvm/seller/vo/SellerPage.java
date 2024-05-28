package com.psvm.seller.vo;

import java.util.Date;

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
	private String sellerExpalin;
	private Date spEnrollDate;
	private String spOriginName;
	private String spChangeName;
}
