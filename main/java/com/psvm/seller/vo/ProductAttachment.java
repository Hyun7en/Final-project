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
public class ProductAttachment {
	
	private int productFileNo;
	private int sellerPageNo;
	private int refPno;
	private Date uploadDate;
	private int fileLevel;
	private String originName;
	private String changeName;
	

}
