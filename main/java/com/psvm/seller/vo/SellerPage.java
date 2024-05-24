package com.psvm.seller.vo;

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
	private String pCategory;
	private int businessNo;
	private String storeName;
}
