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
public class Product {
	
	private int pNo;
	private String pCategory;
	private String pOption;
	private String pTitle;
	private String pStatus;
	private int pPrice;
	private String pContent;
	private Date pEnrollDate;
	private int pStar;
	private int pSellCount;
	private String pOriginName;
	private String pChangeName;
	
}
