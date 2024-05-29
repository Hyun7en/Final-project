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
public class ProductOption {
	
	private int pOptionNo;
	private int pNo;
	private String pOptionName;
	private int pCount;
	private String pStatus;
	
	
}
