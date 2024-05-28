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
	private int userNo;
	private String pCategory;
	private String pOption;
	private int pFileNo;
	private String pTitle;
	private String pStatus;
	private int sellPrice;
	private String pExplane;
	private Date pEnrollDate;
	
}
